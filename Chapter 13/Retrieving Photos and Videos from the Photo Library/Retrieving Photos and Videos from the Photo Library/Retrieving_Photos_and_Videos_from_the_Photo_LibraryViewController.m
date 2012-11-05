//
//  Retrieving_Photos_and_Videos_from_the_Photo_LibraryViewController.m
//  Retrieving Photos and Videos from the Photo Library
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Retrieving_Photos_and_Videos_from_the_Photo_LibraryViewController.h"

@implementation Retrieving_Photos_and_Videos_from_the_Photo_LibraryViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

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

- (void)  imagePickerController:(UIImagePickerController *)picker 
  didFinishPickingMediaWithInfo:(NSDictionary *)info{
  [picker dismissModalViewControllerAnimated:YES];
}

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker{
  [picker dismissModalViewControllerAnimated:YES];
}

- (BOOL) isPhotoLibraryAvailable{
  
  return [UIImagePickerController isSourceTypeAvailable:
          UIImagePickerControllerSourceTypePhotoLibrary];
  
}

- (BOOL) canUserPickVideosFromPhotoLibrary{
  
  return [self
          cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie
          sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
  
}

- (BOOL) canUserPickPhotosFromPhotoLibrary{
  
  return [self
          cameraSupportsMedia:(__bridge NSString *)kUTTypeImage
          sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
	
  if ([self isPhotoLibraryAvailable]){
    
    UIImagePickerController *controller = 
      [[UIImagePickerController alloc] init];
    
    controller.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    NSMutableArray *mediaTypes = [[NSMutableArray alloc] init];
    
    if ([self canUserPickPhotosFromPhotoLibrary]){
      [mediaTypes addObject:(__bridge NSString *)kUTTypeImage];
    }
    
    if ([self canUserPickVideosFromPhotoLibrary]){
      [mediaTypes addObject:(__bridge NSString *)kUTTypeMovie];
    }
    
    controller.mediaTypes = nil;
    
    controller.delegate = self;
    
    [self.navigationController presentModalViewController:controller
                                                 animated:YES];
    
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
