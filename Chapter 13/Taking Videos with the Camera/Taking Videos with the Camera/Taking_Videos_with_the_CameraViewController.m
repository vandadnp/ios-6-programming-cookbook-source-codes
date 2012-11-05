//
//  Taking_Videos_with_the_CameraViewController.m
//  Taking Videos with the Camera
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Taking_Videos_with_the_CameraViewController.h"

@implementation Taking_Videos_with_the_CameraViewController

- (BOOL) cameraSupportsMedia:(NSString *)paramMediaType
                  sourceType:(UIImagePickerControllerSourceType)paramSourceType{
  
  __block BOOL result = NO;
  
  if ([paramMediaType length] == 0){
    NSLog(@"Media type is empty.");
    return NO;
  }
  
  NSArray *availableMediaTypes = 
  [UIImagePickerController availableMediaTypesForSourceType:paramSourceType];
  
  [availableMediaTypes enumerateObjectsUsingBlock:
   ^(id obj, NSUInteger idx, BOOL *stop) {
     
     NSString *mediaType = (NSString *)obj;
     if ([mediaType isEqualToString:paramMediaType]){
       result = YES;
       *stop= YES;
     }
     
   }];
  
  return result;
  
}

- (BOOL) isCameraAvailable{
  
  return [UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypeCamera];
  
}

- (BOOL) doesCameraSupportTakingPhotos{
  
  return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeImage
                        sourceType:UIImagePickerControllerSourceTypeCamera];
  
}

- (void)  imagePickerController:(UIImagePickerController *)picker 
  didFinishPickingMediaWithInfo:(NSDictionary *)info{
  
  NSLog(@"Picker returned successfully.");
  
  NSLog(@"%@", info);
  
  NSString     *mediaType = [info objectForKey:
                             UIImagePickerControllerMediaType];
  
  if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeMovie]){
    
    NSURL *urlOfVideo =
    [info objectForKey:UIImagePickerControllerMediaURL];
    
    NSLog(@"Video URL = %@", urlOfVideo);
    
    NSError *dataReadingError = nil;
    
    NSData *videoData =
    [NSData dataWithContentsOfURL:urlOfVideo
                          options:NSDataReadingMapped
                            error:&dataReadingError];
    
    if (videoData != nil){
      /* We were able to read the data */
      NSLog(@"Successfully loaded the data.");
    } else {
      /* We failed to read the data. Use the dataReadingError
       variable to determine what the error is */
      NSLog(@"Failed to load the data with error = %@",
            dataReadingError);
    }
    
  }
  
  [picker dismissModalViewControllerAnimated:YES];

}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
  
  NSLog(@"Picker was cancelled");
  [picker dismissModalViewControllerAnimated:YES];
  
}

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  if ([self isCameraAvailable] &&
//      [self doesCameraSupportTakingPhotos]){
//    
//    UIImagePickerController *controller = 
//      [[UIImagePickerController alloc] init];
//    
//    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
//    
//    NSString *requiredMediaType = (__bridge NSString *)kUTTypeMovie;
//    controller.mediaTypes = [[NSArray alloc] 
//                             initWithObjects:requiredMediaType, nil];
//    
//    controller.allowsEditing = YES;
//    controller.delegate = self;
//    
//    [self.navigationController presentModalViewController:controller
//                                                 animated:YES];
//    
//  } else {
//    NSLog(@"Camera is not available.");
//  }
//  
//}

/* 2 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  if ([self isCameraAvailable] &&
      [self doesCameraSupportTakingPhotos]){
    
    UIImagePickerController *controller = 
      [[UIImagePickerController alloc] init];
    
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    NSString *requiredMediaType = (__bridge NSString *)kUTTypeMovie;
    controller.mediaTypes = [[NSArray alloc] 
                             initWithObjects:requiredMediaType, nil];
    
    controller.allowsEditing = YES;
    controller.delegate = self;
    
    /* Record in high quality */
    controller.videoQuality = UIImagePickerControllerQualityTypeHigh;
    
    /* Only allow 30 seconds of recording */
    controller.videoMaximumDuration = 30.0f;
    
    [self.navigationController presentModalViewController:controller
                                                 animated:YES];
    
  } else {
    NSLog(@"Camera is not available.");
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
:(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end