//
//  Editing_Videos_on_an_iOS_DeviceViewController.h
//  Editing Videos on an iOS Device
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface Editing_Videos_on_an_iOS_DeviceViewController
           : UIViewController <UINavigationControllerDelegate,
                               UIVideoEditorControllerDelegate,
                               UIImagePickerControllerDelegate>

@property (nonatomic, strong) NSURL *videoURLToEdit;

@end
