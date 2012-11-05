//
//  Displaying_Popovers_with_UIPopoverControllerViewController.h
//  Displaying Popovers with UIPopoverController
//
//  Created by Vandad Nahavandipoor on 28/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Displaying_Popovers_with_UIPopoverControllerViewController
           : UIViewController <UIAlertViewDelegate>

@property (nonatomic, strong) UIPopoverController *popoverController;
@property (nonatomic, strong) UIBarButtonItem *barButtonAdd;

@end
