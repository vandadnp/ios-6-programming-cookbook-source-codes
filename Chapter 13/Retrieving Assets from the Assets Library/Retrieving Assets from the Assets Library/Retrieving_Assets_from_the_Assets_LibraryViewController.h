//
//  Retrieving_Assets_from_the_Assets_LibraryViewController.h
//  Retrieving Assets from the Assets Library
//
//  Created by Vandad Nahavandipoor on 22/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//#import <AssetsLibrary/AssetsLibrary.h>
//#import <MobileCoreServices/MobileCoreServices.h>
//
//@interface Retrieving_Assets_from_the_Assets_LibraryViewController
//           : UIViewController <UIImagePickerControllerDelegate, 
//                               UINavigationControllerDelegate>
//
//@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;
//
//@end

#import <UIKit/UIKit.h>
#import <AssetsLibrary/AssetsLibrary.h>
#import <MobileCoreServices/MobileCoreServices.h>

@interface Retrieving_Assets_from_the_Assets_LibraryViewController
           : UIViewController <UIImagePickerControllerDelegate, 
                               UINavigationControllerDelegate>

@property (nonatomic, strong) ALAssetsLibrary *assetsLibrary;

@end