//
//  Taking_Photos_with_the_CameraViewController.m
//  Taking Photos with the Camera
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Taking_Photos_with_the_CameraViewController.h"

@implementation Taking_Photos_with_the_CameraViewController

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
    
  }
  
  else if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeImage]){
    
    /* Let's get the metadata. This is only for
     images. Not videos */
    
    NSDictionary *metadata =
    [info objectForKey:
     UIImagePickerControllerMediaMetadata];
    
    UIImage *theImage =
    [info objectForKey:
     UIImagePickerControllerOriginalImage];
    
    NSLog(@"Image Metadata = %@", metadata);
    NSLog(@"Image = %@", theImage);
    
    
  }
  
  [picker dismissModalViewControllerAnimated:YES];
  
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
  
  NSLog(@"Picker was cancelled");
  [picker dismissModalViewControllerAnimated:YES];
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  if ([self isCameraAvailable] &&
      [self doesCameraSupportTakingPhotos]){
    
    UIImagePickerController *controller = 
      [[UIImagePickerController alloc] init];
    
    controller.sourceType = UIImagePickerControllerSourceTypeCamera;
    
    NSString *requiredMediaType = (__bridge NSString *)kUTTypeImage;
    controller.mediaTypes = [[NSArray alloc] 
                             initWithObjects:requiredMediaType, nil];
    
    controller.allowsEditing = YES;
    controller.delegate = self;
    
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
