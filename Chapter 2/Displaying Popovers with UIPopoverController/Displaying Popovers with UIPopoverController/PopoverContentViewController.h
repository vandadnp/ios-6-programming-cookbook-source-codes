//
//  PopoverContentViewController.h
//  Displaying Popovers with UIPopoverController
//
//  Created by Vandad Nahavandipoor on 28/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PopoverContentViewController : UIViewController

@property (nonatomic, strong) UIButton *buttonPhoto;
@property (nonatomic, strong) UIButton *buttonAudio;
/* We shouldn't define this as strong. That will create a retain cycle
 between the popover controller and the content view controller since the
 popover controller retains the content view controller and the view controller will
 retain the popover controller */
@property (nonatomic, weak) UIPopoverController *popoverController;

@end
