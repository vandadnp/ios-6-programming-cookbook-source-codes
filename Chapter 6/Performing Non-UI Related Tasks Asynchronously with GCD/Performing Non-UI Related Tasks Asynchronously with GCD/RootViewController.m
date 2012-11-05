//
//  RootViewController.m
//  Performing Non-UI Related Tasks Asynchronously with GCD
//
//  Created by Vandad Nahavandipoor on 13/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)didReceiveMemoryWarning
{
    // Releases the view if it doesn't have a superview.
    [super didReceiveMemoryWarning];
    
    // Release any cached data, images, etc that aren't in use.
}

- (NSString *) fileLocation{
  
  /* Get the document folder(s) */
  NSArray *folders = 
  NSSearchPathForDirectoriesInDomains(NSDocumentDirectory,
                                      NSUserDomainMask,
                                      YES);
  
  /* Did we find anything? */
  if ([folders count] == 0){
    return nil;
  }
  
  /* Get the first folder */
  NSString *documentsFolder = [folders objectAtIndex:0];
  
  /* Append the file name to the end of the documents path */
  return [documentsFolder 
          stringByAppendingPathComponent:@"list.txt"];
  
}

- (BOOL) hasFileAlreadyBeenCreated{
  
  BOOL result = NO;
  
  NSFileManager *fileManager = [[NSFileManager alloc] init];
  if ([fileManager fileExistsAtPath:[self fileLocation]]){
    result = YES;
  }
  
  return result;
}

- (void) viewDidAppear:(BOOL)paramAnimated{
  
  dispatch_queue_t concurrentQueue = 
    dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
  
  /* If we have not already saved an array of 10,000
   random numbers to the disk before, generate these numbers now
   and then save them to the disk in an array */
  dispatch_async(concurrentQueue, ^{
    
    NSUInteger numberOfValuesRequired = 10000;
    
    if ([self hasFileAlreadyBeenCreated] == NO){
      dispatch_sync(concurrentQueue, ^{
        
        NSMutableArray *arrayOfRandomNumbers = 
        [[NSMutableArray alloc] initWithCapacity:numberOfValuesRequired];
        
        NSUInteger counter = 0;
        for (counter = 0;
             counter < numberOfValuesRequired;
             counter++){
          unsigned int randomNumber = 
          arc4random() % ((unsigned int)RAND_MAX + 1);
          
          [arrayOfRandomNumbers addObject:
           [NSNumber numberWithUnsignedInt:randomNumber]];
        }
        
        /* Now let's write the array to disk */
        [arrayOfRandomNumbers writeToFile:[self fileLocation]
                               atomically:YES];
        
      });
    }
    
    __block NSMutableArray *randomNumbers = nil;
    
    /* Read the numbers from disk and sort them in an
     ascending fashion */
    dispatch_sync(concurrentQueue, ^{
      
      /* If the file has now been created, we have to read it */
      if ([self hasFileAlreadyBeenCreated]){
        randomNumbers = [[NSMutableArray alloc] 
                         initWithContentsOfFile:[self fileLocation]];
        
        /* Now sort the numbers */
        [randomNumbers sortUsingComparator:
         ^NSComparisonResult(id obj1, id obj2) {
           
           NSNumber *number1 = (NSNumber *)obj1;
           NSNumber *number2 = (NSNumber *)obj2;
           return [number1 compare:number2];
           
         }];
      }
    });
    
    
    dispatch_async(dispatch_get_main_queue(), ^{
      if ([randomNumbers count] > 0){
        /* Refresh the UI here using the numbers in the
         randomNumbers array */
      }
    });
    
  });
  
}

//- (void) viewDidAppear:(BOOL)paramAnimated{
//  
//  dispatch_queue_t concurrentQueue = 
//  dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
//  
//  dispatch_async(concurrentQueue, ^{
//    
//    __block UIImage *image = nil;
//    
//    dispatch_sync(concurrentQueue, ^{
//      /* Download the image here */
//      
//      /* iPad's image from Apple's website. Wrap it into two
//       lines as the URL is too long to fit into one line */
//      NSString *urlAsString = @"http://images.apple.com/mobileme/features"\
//                              "/images/ipad_findyouripad_20100518.jpg";
//      
//      NSURL *url = [NSURL URLWithString:urlAsString];
//      
//      NSURLRequest *urlRequest = [NSURLRequest requestWithURL:url];
//      
//      NSError *downloadError = nil;
//      NSData *imageData = [NSURLConnection 
//                           sendSynchronousRequest:urlRequest
//                           returningResponse:nil
//                           error:&downloadError];
//      
//      if (downloadError == nil &&
//          imageData != nil){
//        
//        image = [UIImage imageWithData:imageData];
//        /* We have the image. We can use it now */
//        
//      }
//      else if (downloadError != nil){
//        NSLog(@"Error happened = %@", downloadError);
//      } else {
//        NSLog(@"No data could get downloaded from the URL.");
//      }
//      
//    });
//    
//    dispatch_sync(dispatch_get_main_queue(), ^{
//      /* Show the image to the user here on the main queue*/
//      
//      if (image != nil){
//        /* Create the image view here */
//        UIImageView *imageView = [[UIImageView alloc] 
//                                  initWithFrame:self.view.bounds];
//        
//        /* Set the image */
//        [imageView setImage:image];
//        
//        /* Make sure the image is not scaled incorrectly */
//        [imageView setContentMode:UIViewContentModeScaleAspectFit];
//        
//        /* Add the image to this view controller's view */
//        [self.view addSubview:imageView];
//        
//      } else {
//        NSLog(@"Image isn't downloaded. Nothing to display.");
//      }
//      
//    });
//    
//  });
//  
//}

#pragma mark - View lifecycle

/*
// Implement loadView to create a view hierarchy programmatically, without using a nib.
- (void)loadView
{
}
*/

/*
// Implement viewDidLoad to do additional setup after loading the view, typically from a nib.
- (void)viewDidLoad
{
    [super viewDidLoad];
}
*/

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
    return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
