//
//  ViewController.m
//  Handling Conflicts in iCloud Documents
//
//  Created by Vandad NP on 16/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ViewController.h"
#import "ConflictViewController.h"

@interface ViewController(Private)
- (NSURL *) urlForDocumentsDirectoryIniCloud;
@end

@implementation ViewController

#pragma mark - Table View Delegate

- (void)          tableView:(UITableView *)tableView 
    didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  if (indexPath.row == 0){
    [self dismissModalViewControllerAnimated:YES];
    return;
  }
  
  self.textViewCloudDocumentText.text = [NSString string];
  
  NSFileVersion *selectedFileVersion = [self.arrayOfCloudDocumentVersions 
                                        objectAtIndex:indexPath.row];
  
  NSLog(@"Closing the document...");
  
  /* Step 1: First close the document */
  [self.cloudDocument closeWithCompletionHandler:^(BOOL success) {
    if (success){
      NSLog(@"Successfully closed the current document.");
      
      /* Step 2: Remove all other versions of the selected revision */
      NSLog(@"Removing all other versions of the selected revision...");
      NSError *removeError = nil;
      BOOL removed = [NSFileVersion 
                      removeOtherVersionsOfItemAtURL:selectedFileVersion.URL
                      error:&removeError];
      if (removed && 
          removeError == nil){
        NSLog(@"Successfully removed all other versions of selected revision.");
        
        /* Step 3: Open the selected revision */
        NSLog(@"Opening the selected revision...");
        self.cloudDocument = [[CloudDocument alloc] 
                              initWithFileURL:selectedFileVersion.URL
                              delegate:self];
        
        [self.cloudDocument openWithCompletionHandler:^(BOOL success) {
          if (success){
            NSLog(@"Successfully opened the new file.");
            self.textViewCloudDocumentText.text = 
            self.cloudDocument.documentText;
          } else {
            NSLog(@"Failed to open the new file.");
          }
        }];
        
      } else {
        NSLog(@"Failed to remove other versions of this revision. Error = %@",
              removeError); 
      }
    } else {
      NSLog(@"Failed to close the current document.");
    }
  }];
  
  [self dismissModalViewControllerAnimated:YES];
  
}

#pragma mark - Table View Data Source

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  
  return [self.arrayOfCloudDocumentVersions count];
  
}

- (UITableViewCell *) tableView:(UITableView *)tableView 
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *result = nil;
  
  static NSString *FileVersionTableViewCell = @"FileVersionTableViewCell";
  
  result = [tableView dequeueReusableCellWithIdentifier:
            FileVersionTableViewCell];
  
  if (result == nil){
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                                    reuseIdentifier:FileVersionTableViewCell];
    result.detailTextLabel.numberOfLines = 2;
  }
  
  NSFileVersion *version = [self.arrayOfCloudDocumentVersions objectAtIndex:
                            indexPath.row];
  
  if (indexPath.row == 0){
    result.textLabel.text = [NSString stringWithFormat:
                             @"(Current) Version at: %@",
                             version.modificationDate];
  } else {
    result.textLabel.text = [NSString stringWithFormat:@"Version at: %@",
                             version.modificationDate];
  }
  
  
  result.detailTextLabel.text = [NSString stringWithFormat:@"Modified by: %@",
                                 version.localizedNameOfSavingComputer];
  
  return result;
  
}

#pragma mark - URL Management

- (NSURL *) urlForDocumentsDirectoryIniCloud{
  
  NSURL *result = nil;
  
  #error Replace this with your own Team ID
  NSString *teamID = @"TEAM ID";
  
  NSString *containerID = 
  @"com.pixolity.Handling-Conflicts-in-iCloud-Documents";
  
  NSString *teamIDAndContainerID = [NSString stringWithFormat:@"%@.%@",
                                    teamID,
                                    containerID];
  
  NSFileManager *fileManager = [[NSFileManager alloc] init];
  
  NSURL *iCloudURL = [fileManager 
                      URLForUbiquityContainerIdentifier:teamIDAndContainerID];
  
  NSURL *documentsFolderURLIniCloud = 
  [iCloudURL URLByAppendingPathComponent:@"Documents"
                             isDirectory:YES];
  
  /* If it doesn't exist, create it */
  if ([fileManager fileExistsAtPath:[documentsFolderURLIniCloud path]] == NO){
    NSLog(@"The documents folder does NOT exist in iCloud. Creating...");
    NSError *folderCreationError = nil;
    BOOL created = [fileManager createDirectoryAtURL:documentsFolderURLIniCloud
                         withIntermediateDirectories:YES
                                          attributes:nil
                                               error:&folderCreationError];
    
    if (created){
      NSLog(@"Successfully created the Documents folder in iCloud.");
      result = documentsFolderURLIniCloud;
    } else {
      NSLog(@"Failed to create the Documents folder in iCloud. Error = %@",
            folderCreationError);
    }
  } else {
    NSLog(@"The Documents folder already exists in iCloud.");
    result = documentsFolderURLIniCloud;
  }
  
  return result;
  
}

- (NSURL *) urlForFileInDocumentsDirectoryIniCloud{
  
  return [[self urlForDocumentsDirectoryIniCloud] 
          URLByAppendingPathComponent:@"UserDocument.txt"];
  
}

- (void) cloudDocumentChanged:(CloudDocument *)paramSender{
  self.textViewCloudDocumentText.text = paramSender.documentText;
}

- (void) textViewDidChange:(UITextView *)textView{
  self.cloudDocument.documentText = textView.text;
  [self.cloudDocument updateChangeCount:UIDocumentChangeDone];
}

- (void) listenForKeyboardNotifications{
  /* As we have a text view, when the keyboard shows on screen, we want to
   make sure our textview's content is fully visible so start
   listening for keyboard notifications */
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(handleKeyboardWillShow:)
   name:UIKeyboardWillShowNotification
   object:nil];
  
  [[NSNotificationCenter defaultCenter] 
   addObserver:self
   selector:@selector(handleKeyboardWillHide:)
   name:UIKeyboardWillHideNotification
   object:nil];
}

- (void) setupTextView{
  /* Create the text view */
  
  CGRect textViewRect = CGRectMake(20.0f,
                                   20.0f,
                                   self.view.bounds.size.width - 40.0f,
                                   self.view.bounds.size.height - 40.0f);
  
  self.textViewCloudDocumentText = [[UITextView alloc] initWithFrame:
                                    textViewRect];
  
  self.textViewCloudDocumentText.delegate = self;
  self.textViewCloudDocumentText.font = [UIFont systemFontOfSize:20.0f];
  [self.view addSubview:self.textViewCloudDocumentText];
}

- (void) startSearchingForDocumentIniCloud{
  /* Start searching for existing text documents */
  self.metadataQuery = [[NSMetadataQuery alloc] init];
  
  NSPredicate *predicate = [NSPredicate predicateWithFormat:@"%K like %@", 
                            NSMetadataItemFSNameKey, 
                            @"*"];
  
  [self.metadataQuery setPredicate:predicate];
  NSArray *searchScopes = [[NSArray alloc] initWithObjects:
                           NSMetadataQueryUbiquitousDocumentsScope,
                           nil];
  [self.metadataQuery setSearchScopes:searchScopes];
  
  NSString *metadataNotification = 
  NSMetadataQueryDidFinishGatheringNotification;
  
  [[NSNotificationCenter defaultCenter] 
   addObserver:self
   selector:@selector(handleMetadataQueryFinished:)
   name:metadataNotification
   object:nil];
  
  [self.metadataQuery startQuery];
}

- (void) handleDocumentStateChanged:(NSNotification *)paramNotification{
  NSLog(@"Document state has changed");
  NSLog(@"Notification Object = %@", [paramNotification object]);
  
  NSLog(@"Notification Object Class = %@", 
        NSStringFromClass([[paramNotification object] class]));
  
  CloudDocument *senderDocument = (CloudDocument *)paramNotification.object;
  NSLog(@"Document State = %d", senderDocument.documentState);
  
  
  /* Since we don't yet know how to solve conflicts, we will disallow the user
   from editing the document if an error of any sort has happened. Later when
   we will learn about handling conflicts, we will handle these issues
   more gracefully*/
  
  if (senderDocument.documentState & UIDocumentStateInConflict){
    NSLog(@"Conflict found in the document.");
    
    NSMutableArray *versions = [[NSMutableArray alloc] init];
    
    /* The first item in our list will be the current version */
    [versions addObject:[NSFileVersion currentVersionOfItemAtURL:
                         self.cloudDocument.fileURL]];
    
    /* Then add the other available versions of this document to the list */
    [versions addObjectsFromArray:
     [NSFileVersion otherVersionsOfItemAtURL:senderDocument.fileURL]];    
    
    self.arrayOfCloudDocumentVersions = [NSArray arrayWithArray:versions];
    
    NSLog(@"There are %lu versions of this document available.",
          (unsigned long)[self.arrayOfCloudDocumentVersions count]);
    
    UINavigationController *tempNavController = 
    [[UINavigationController alloc] initWithRootViewController:
     self.conflictViewController];
    
    [self presentModalViewController:tempNavController
                            animated:YES];
    
    [self.conflictViewController.tableViewVersions reloadData];
    
  }
  
  if (senderDocument.documentState & UIDocumentStateClosed){
    NSLog(@"Document is closed.");
    self.textViewCloudDocumentText.editable = NO;
  }
  if (senderDocument.documentState & UIDocumentStateEditingDisabled){
    NSLog(@"Editing is disabled on this document.");
    self.textViewCloudDocumentText.editable = NO;
  }
  if (senderDocument.documentState & UIDocumentStateNormal){
    NSLog(@"Things are normal. We are good to go.");
  }
  if (senderDocument.documentState & UIDocumentStateSavingError){
    NSLog(@"A saving error has happened.");
    self.textViewCloudDocumentText.editable = NO;
  }
  
}

- (void) listenForDocumentStateChangesNotification{
  
  /* Start listening for the Document State Changes notification */
  [[NSNotificationCenter defaultCenter]
   addObserver:self
   selector:@selector(handleDocumentStateChanged:)
   name:UIDocumentStateChangedNotification
   object:nil];
  
}

- (void) prepareFileVersionsTableView{
  
  self.conflictViewController = [[ConflictViewController alloc]
                                 initWithNibName:@"ConflictViewController"
                                 bundle:nil
                                 tableViewDelegate:self
                                 tableViewDataSource:self];
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  [self prepareFileVersionsTableView];
  [self listenForDocumentStateChangesNotification];
  [self listenForKeyboardNotifications];
  self.view.backgroundColor = [UIColor brownColor];
  [self setupTextView];
  [self startSearchingForDocumentIniCloud];
}

- (void) handleMetadataQueryFinished:(NSNotification *)paramNotification{
  
  /* Make sure this is the metadata query that we were expecting... */
  NSMetadataQuery *senderQuery = (NSMetadataQuery *)[paramNotification object];
  
  if ([senderQuery isEqual:self.metadataQuery] == NO){
    NSLog(@"Unknown metadata query sent us a message.");
    return;
  }
  
  [self.metadataQuery disableUpdates];
  
  /* Now we stop listening for these notifications because we don't really
   have to, any more */
  NSString *metadataNotification = 
  NSMetadataQueryDidFinishGatheringNotification;
  
  [[NSNotificationCenter defaultCenter] removeObserver:self
                                                  name:metadataNotification
                                                object:nil];
  [self.metadataQuery stopQuery];
  
  NSLog(@"Metadata query finished.");
  
  
  /* Let's find out if we had previously created this document in the user's
   cloud space because if yes, then we have to avoid overwriting that
   document and just use the existing one */
  __block BOOL documentExistsIniCloud = NO;
  NSString *FileNameToLookFor = @"UserDocument.txt";
  
  NSArray *results = self.metadataQuery.results;
  
  [results enumerateObjectsUsingBlock:^(id obj, NSUInteger idx, BOOL *stop) {
    NSMetadataItem *item = (NSMetadataItem *)obj;
    NSURL *itemURL = (NSURL *)[item valueForAttribute:NSMetadataItemURLKey];
    NSString *lastComponent = (NSString *)[[itemURL pathComponents] lastObject];
    if ([lastComponent isEqualToString:FileNameToLookFor]){
      if ([itemURL isEqual:[self urlForFileInDocumentsDirectoryIniCloud]]){
        documentExistsIniCloud = YES;
        *stop = YES;
      }
    }
  }];
  
  NSURL *urlOfDocument = [self urlForFileInDocumentsDirectoryIniCloud];
  self.cloudDocument = [[CloudDocument alloc] initWithFileURL:urlOfDocument
                                                     delegate:self];
  
  __weak ViewController *weakSelf = self;
  
  /* If the document exists, open it */
  if (documentExistsIniCloud){
    NSLog(@"Document already exists in iCloud. Loading it from there...");
    [self.cloudDocument openWithCompletionHandler:^(BOOL success) {
      if (success){
        ViewController *strongSelf = weakSelf;
        NSLog(@"Successfully loaded the document from iCloud.");
        strongSelf.textViewCloudDocumentText.text = 
        strongSelf.cloudDocument.documentText;
      } else {
        NSLog(@"Failed to load the document from iCloud.");
      }
    }];
    
  } else {
    NSLog(@"Document does not exist in iCloud. Creating it...");
    
    /* If the document doesn't exist, ask the CloudDocument class to
     save a new file on that address for us */
    [self.cloudDocument saveToURL:[self urlForFileInDocumentsDirectoryIniCloud]
                 forSaveOperation:UIDocumentSaveForCreating
                completionHandler:^(BOOL success) {
                  if (success){
                    NSLog(@"Successfully created the new file in iCloud.");
                    ViewController *strongSelf = weakSelf;
                    
                    strongSelf.textViewCloudDocumentText.text = 
                    strongSelf.cloudDocument.documentText;
                    
                  } else {
                    NSLog(@"Failed to create the file.");
                  }
                }];
    
  }
  
}



- (void) handleKeyboardWillShow:(NSNotification *)paramNotification{
  
  NSDictionary *userInfo = [paramNotification userInfo];
  
  NSValue *animationCurveObject = 
  [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
  
  NSValue *animationDurationObject =
  [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
  
  NSValue *keyboardEndRectObject = 
  [userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
  
  NSUInteger animationCurve = 0;
  double animationDuration = 0.0f;
  CGRect keyboardEndRect = CGRectMake(0, 0, 0, 0);
  
  [animationCurveObject getValue:&animationCurve];
  [animationDurationObject getValue:&animationDuration];
  [keyboardEndRectObject getValue:&keyboardEndRect];
  
  UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
  
  /* Convert the frame from window's coordinate system to
   our view's coordinate system */
  keyboardEndRect = [self.view convertRect:keyboardEndRect
                                  fromView:window];
  
  [UIView beginAnimations:@"changeTextViewContentInset"
                  context:NULL];
  [UIView setAnimationDuration:animationDuration];
  [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
  
  CGRect intersectionOfKeyboardRectAndWindowRect =
  CGRectIntersection(window.frame, keyboardEndRect);
  
  CGFloat bottomInset = intersectionOfKeyboardRectAndWindowRect.size.height;
  
  self.textViewCloudDocumentText.contentInset = UIEdgeInsetsMake(0.0f,
                                                                 0.0f,
                                                                 bottomInset,
                                                                 0.0f);
  
  [UIView commitAnimations];
  
}

- (void) handleKeyboardWillHide:(NSNotification *)paramNotification{
  
  if (UIEdgeInsetsEqualToEdgeInsets(self.textViewCloudDocumentText.contentInset, 
                                    UIEdgeInsetsZero)){
    /* Our text view's content inset is intact so no need to reset it */
    return;
  }
  
  NSDictionary *userInfo = [paramNotification userInfo];
  
  NSValue *animationCurveObject = 
  [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
  
  NSValue *animationDurationObject =
  [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
  
  NSUInteger animationCurve = 0;
  double animationDuration = 0.0f;
  
  [animationCurveObject getValue:&animationCurve];
  [animationDurationObject getValue:&animationDuration];
  
  [UIView beginAnimations:@"changeTextViewContentInset"
                  context:NULL];
  [UIView setAnimationDuration:animationDuration];
  [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
  
  self.textViewCloudDocumentText.contentInset = UIEdgeInsetsZero;
  
  [UIView commitAnimations];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
:(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
