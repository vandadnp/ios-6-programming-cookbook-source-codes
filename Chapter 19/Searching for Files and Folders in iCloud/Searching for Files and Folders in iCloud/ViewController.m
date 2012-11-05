//
//  ViewController.m
//  Searching for Files and Folders in iCloud
//
//  Created by Vandad Nahavandipoor on 17/09/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (NSURL *) urlForDocumentsFolderIniCloud{
  
  NSURL *result = nil;
  
  #error Replace this with your own Team ID
  NSString *teamID = @"TEAM ID";
  
  NSString *containerID = [[NSBundle mainBundle] bundleIdentifier];
  
  NSString *teamIDAndContainerID = [[NSString alloc] initWithFormat:@"%@.%@",
                                    TeamID,
                                    containerID];
  
  NSFileManager *fileManager = [[NSFileManager alloc] init];
  
  NSURL *appiCloudContainerURL = 
  [fileManager URLForUbiquityContainerIdentifier:teamIDAndContainerID];
  
  result = [appiCloudContainerURL URLByAppendingPathComponent:@"Documents"
                                                  isDirectory:YES];
  
  if ([fileManager fileExistsAtPath:[result path]] == NO){
    
    /* The Documents directory does NOT exist in our app's iCloud container;
     attempt to create it now */
    
    NSError *creationError = nil;
    BOOL created = [fileManager createDirectoryAtURL:result
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:&creationError];
    
    if (created){
      NSLog(@"Successfully created the Documents folder in iCloud.");
    } else {
      NSLog(@"Failed to create the Documents folder in iCloud. Error = %@",
            creationError);
      result = nil;
    }
    
  } else {
    /* the Documents directory already exists in our app's iCloud container;
     we don't have to do anything */
  }
  
  return result;
  
}

- (NSURL *) urlForRandomFileInDocumentsFolderIniCloud{
  
  NSURL *result = nil;
  
  NSUInteger randomNumber = arc4random() % NSUIntegerMax;
  
  NSString *randomFileName = [[NSString alloc] initWithFormat:@"%llu.txt",
                              (unsigned long)randomNumber];
  
  /* Check in the metadata query if this file already exists */
  __block BOOL fileExistsAlready = NO;
  [self.metadataQuery.results enumerateObjectsUsingBlock:
   ^(NSMetadataItem *item, NSUInteger idx, BOOL *stop) {
     NSString *itemFileName = [item valueForAttribute:NSMetadataItemFSNameKey];
     if ([itemFileName isEqualToString:randomFileName]){
       NSLog(@"This file already exists. Aborting...");
       fileExistsAlready = YES;
       *stop = YES;
     }
   }];
  
  if (fileExistsAlready){
    return nil;
  }
  
  result = [[self urlForDocumentsFolderIniCloud] 
            URLByAppendingPathComponent:randomFileName];
  
  return result;
  
}

- (NSURL *) urlForRandomFileInDocumentsFolderInAppSandbox
            :(NSString *)paramFileName{
  
  NSURL *result = nil;
  
  NSString *documentsFolderInAppSandbox = 
  [NSSearchPathForDirectoriesInDomains(NSDocumentDirectory, 
                                       NSUserDomainMask, 
                                       YES) objectAtIndex:0];
  
  NSString *filePath = [documentsFolderInAppSandbox 
                        stringByAppendingPathComponent:paramFileName];
  
  result = [NSURL fileURLWithPath:filePath];
  
  return result;
  
}

- (void) enumerateMetadataResults:(NSArray *)paramResults{
  
  [paramResults enumerateObjectsUsingBlock:
   ^(NSMetadataItem *item, NSUInteger index, BOOL *stop) {
     
     NSString *itemName = [item valueForAttribute:NSMetadataItemFSNameKey];
     NSURL *itemURL = [item valueForAttribute:NSMetadataItemURLKey];
     NSNumber *itemSize = [item valueForAttribute:NSMetadataItemFSSizeKey];
     
     NSLog(@"Item name = %@", itemName);
     NSLog(@"Item URL = %@", itemURL);
     NSLog(@"Item Size = %llu", 
           (unsigned long long)[itemSize unsignedLongLongValue]);
     
   }];
  
}

- (void) handleMetadataQueryFinished:(id)paramSender{
  
  NSLog(@"Search finished");
  
  if ([[paramSender object] isEqual:self.metadataQuery] == NO){
    NSLog(@"An unknown object called this method. Not safe to proceed.");
    return;
  }
  
  /* Stop listening for notifications as we are not expecting anything more */
  [[NSNotificationCenter defaultCenter] removeObserver:self];
  
  /* We are done with the query, let's stop the process now */
  [self.metadataQuery disableUpdates];
  [self.metadataQuery stopQuery];
  
  [self enumerateMetadataResults:self.metadataQuery.results];
  
  if ([self.metadataQuery.results count] == 0){
    NSLog(@"No files were found.");
  }
  
  NSURL *urlForFileIniCloud = [self urlForRandomFileInDocumentsFolderIniCloud];
  
  if (urlForFileIniCloud == nil){
    NSLog(@"Cannot create a file with this URL. URL is empty.");
    return;
  }
  
  NSString *fileName = [[[urlForFileIniCloud path] 
                         componentsSeparatedByString:@"/"] lastObject];
  
  NSURL *urlForFileInAppSandbox = 
  [self urlForRandomFileInDocumentsFolderInAppSandbox:fileName];
  
  NSString *fileContent = 
  [[NSString alloc] initWithFormat:@"Content of %@",
   [[self urlForRandomFileInDocumentsFolderIniCloud] path]];
  
  /* Save the file temporarily in the app bundle and then move 
   it to the cloud */
  NSError *writingError = nil;
  BOOL couldWriteToAppSandbox = 
  [fileContent writeToFile:[urlForFileInAppSandbox path]
                atomically:YES
                  encoding:NSUTF8StringEncoding
                     error:&writingError];
  
  /* If cannot save the file, just return from method because it won't make
   any sense to continue as we, ideally, should have stored the file in iCloud
   from the app sandbox but here, if an error has occurred, 
   we cannot continue */
  if (couldWriteToAppSandbox == NO){
    NSLog(@"Failed to save the file to app sandbox. Error = %@", writingError);
    return;
  }
  
  NSFileManager *fileManager = [[NSFileManager alloc] init];
  
  /* Now move the file to the cloud */
  NSError *ubiquitousError = nil;
  BOOL setUbiquitousSucceeded = 
  [fileManager setUbiquitous:YES
                   itemAtURL:urlForFileInAppSandbox
              destinationURL:urlForFileIniCloud
                       error:&ubiquitousError];
  
  if (setUbiquitousSucceeded){
    NSLog(@"Successfully moved the file to iCloud.");
    /* The file has been moved from App Sandbox to iCloud */
  } else {
    NSLog(@"Failed to move the file to iCloud with error = %@", 
          ubiquitousError);
  }
  
}

- (void)viewDidLoad{
  
  [super viewDidLoad];
  
  /* Listen for a notification that gets fired when the metadata query
   has finished finding the items we were looking for */
  [[NSNotificationCenter defaultCenter] 
   addObserver:self
   selector:@selector(handleMetadataQueryFinished:)
   name:NSMetadataQueryDidFinishGatheringNotification
   object:nil];
  
	// Do any additional setup after loading the view, typically from a nib.
  self.metadataQuery = [[NSMetadataQuery alloc] init];
  NSArray *searchScopes = [[NSArray alloc] initWithObjects:
                           NSMetadataQueryUbiquitousDocumentsScope, nil];
  [self.metadataQuery setSearchScopes:searchScopes];
  NSPredicate *predicate = [NSPredicate predicateWithFormat:
                            @"%K like %@", 
                            NSMetadataItemFSNameKey,
                            @"*"];
  [self.metadataQuery setPredicate:predicate];
  if ([self.metadataQuery startQuery]){
    NSLog(@"Successfully started the query.");
  } else {
    NSLog(@"Failed to start the query.");
  }
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
