//
//  Editing_Videos_on_an_iOS_DeviceViewController.m
//  Editing Videos on an iOS Device
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Editing_Videos_on_an_iOS_DeviceViewController.h"

@implementation Editing_Videos_on_an_iOS_DeviceViewController

- (void)videoEditorController:(UIVideoEditorController *)editor
     didSaveEditedVideoToPath:(NSString *)editedVideoPath{
  NSLog(@"The video editor finished saving video");
  NSLog(@"The edited video path is at = %@", editedVideoPath);
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorController:(UIVideoEditorController *)editor
             didFailWithError:(NSError *)error{
  NSLog(@"Video editor error occurred = %@", error);
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)videoEditorControllerDidCancel:(UIVideoEditorController *)editor{
  NSLog(@"The video editor was cancelled");
  [editor dismissModalViewControllerAnimated:YES];
}

- (void)    imagePickerController:(UIImagePickerController *)picker
    didFinishPickingMediaWithInfo:(NSDictionary *)info{
  
  NSLog(@"Picker returned successfully.");
  
  NSString     *mediaType = [info objectForKey:
                             UIImagePickerControllerMediaType];
  
  if ([mediaType isEqualToString:(NSString *)kUTTypeMovie]){
    self.videoURLToEdit = [info objectForKey:UIImagePickerControllerMediaURL];  
  }
  
  [picker dismissModalViewControllerAnimated:YES];
  
}

- (void) imagePickerControllerDidCancel:(UIImagePickerController *)picker{
  
  NSLog(@"Picker was cancelled");
  self.videoURLToEdit = nil;
  [picker dismissModalViewControllerAnimated:YES];
  
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

- (BOOL) canUserPickVideosFromPhotoLibrary{
  
  return [self cameraSupportsMedia:(__bridge NSString *)kUTTypeMovie
               sourceType:UIImagePickerControllerSourceTypePhotoLibrary];
  
}

- (BOOL) isPhotoLibraryAvailable{
  
  return [UIImagePickerController
          isSourceTypeAvailable:
          UIImagePickerControllerSourceTypePhotoLibrary];
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  if ([self isPhotoLibraryAvailable] &&
      [self canUserPickVideosFromPhotoLibrary]){
    
    UIImagePickerController *imagePicker =
      [[UIImagePickerController alloc] init];
    
    /* Set the source type to photo library */
    imagePicker.sourceType = UIImagePickerControllerSourceTypePhotoLibrary;
    
    /* And we want our user to be able to pick movies from the library */
    NSArray  *mediaTypes = [[NSArray alloc] initWithObjects:
                            (__bridge NSString *)kUTTypeMovie, nil];
    
    imagePicker.mediaTypes = mediaTypes;
    
    /* Set the delegate to the current view controller */
    imagePicker.delegate = self;
    
    /* Present our image picker */
    [self.navigationController presentModalViewController:imagePicker
                                                 animated:YES];
    
  }
  
}

- (void) viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  
  if (self.videoURLToEdit != nil){
    
    NSString *videoPath = [self.videoURLToEdit path];
    
    /* First let's make sure the video editor is able to edit the
     video at the path in our documents folder */
    if ([UIVideoEditorController canEditVideoAtPath:videoPath]){
      
      /* Instantiate the video editor */
      UIVideoEditorController *videoEditor =
      [[UIVideoEditorController alloc] init];
      
      /* We become the delegate of the video editor */
      videoEditor.delegate = self;
      
      /* Make sure to set the path of the video */
      videoEditor.videoPath = videoPath;
      
      /* And present the video editor */
      [self.navigationController presentModalViewController:videoEditor
                                                   animated:YES];
      
      self.videoURLToEdit = nil;
      
    } else {
      NSLog(@"Cannot edit the video at this path");
    }
    
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
