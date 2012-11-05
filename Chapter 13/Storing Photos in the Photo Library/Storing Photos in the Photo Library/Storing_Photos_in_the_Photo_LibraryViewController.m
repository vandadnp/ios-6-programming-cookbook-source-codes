//
//  Storing_Photos_in_the_Photo_LibraryViewController.m
//  Storing Photos in the Photo Library
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Storing_Photos_in_the_Photo_LibraryViewController.h"

@implementation Storing_Photos_in_the_Photo_LibraryViewController

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

- (void) imageWasSavedSuccessfully:(UIImage *)paramImage
          didFinishSavingWithError:(NSError *)paramError
                       contextInfo:(void *)paramContextInfo{
  
  if (paramError == nil){
    NSLog(@"Image was saved successfully.");
  } else {
    NSLog(@"An error happened while saving the image.");
    NSLog(@"Error = %@", paramError);
  }
  
}

- (void)  imagePickerController:(UIImagePickerController *)picker 
  didFinishPickingMediaWithInfo:(NSDictionary *)info{
  
  NSLog(@"Picker returned successfully.");
  
  NSLog(@"%@", info);
  
  NSString     *mediaType = [info objectForKey:
                             UIImagePickerControllerMediaType];
  
  if ([mediaType isEqualToString:(__bridge NSString *)kUTTypeImage]){

    UIImage *theImage = nil;
    
    if ([picker allowsEditing]){
      theImage = [info objectForKey:UIImagePickerControllerEditedImage];
    } else {
      theImage = [info objectForKey:UIImagePickerControllerOriginalImage];
    }
    
    SEL selectorToCall = 
    @selector(imageWasSavedSuccessfully:didFinishSavingWithError:contextInfo:);
    
    UIImageWriteToSavedPhotosAlbum(theImage,
                                   self, 
                                   selectorToCall, 
                                   NULL);
    
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
  // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
