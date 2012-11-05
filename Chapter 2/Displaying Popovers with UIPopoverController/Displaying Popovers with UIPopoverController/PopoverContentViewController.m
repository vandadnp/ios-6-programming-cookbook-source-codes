//
//  PopoverContentViewController.m
//  Displaying Popovers with UIPopoverController
//
//  Created by Vandad Nahavandipoor on 28/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "PopoverContentViewController.h"

@implementation PopoverContentViewController

@synthesize popoverController;

- (BOOL) isInPopover{
  
  Class popoverClass = NSClassFromString(@"UIPopoverController");
  
  if (popoverClass != nil &&
      UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad &&
      self.popoverController != nil){
    return YES; 
  } else {
    return NO;
  }
  
}

- (void) gotoAppleWebsite:(id)paramSender{
  
  if ([self isInPopover]){
    /* Go to website and then dismiss popover */
    [self.popoverController dismissPopoverAnimated:YES];
  } else {
    /* Handle case for iPhone */
  }
  
}

- (void) gotoAppleStoreWebsite:(id)paramSender{
  
  if ([self isInPopover]){
    /* Go to website and then dismiss popover */
    [self.popoverController dismissPopoverAnimated:YES];
  } else {
    /* Handle case for iPhone */
  }
  
}


- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.contentSizeForViewInPopover = CGSizeMake(200.0f, 125.0f);
  
  CGRect buttonRect = CGRectMake(20.0f, 
                                 20.0f,
                                 160.0f, 
                                 37.0f);
  
  self.buttonPhoto = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  [self.buttonPhoto setTitle:@"Photo"
                    forState:UIControlStateNormal];
  [self.buttonPhoto addTarget:self
                       action:@selector(gotoAppleWebsite:)
             forControlEvents:UIControlEventTouchUpInside];
  
  self.buttonPhoto.frame = buttonRect;
  
  [self.view addSubview:self.buttonPhoto];
  
  
  buttonRect.origin.y += 50.0f;
  self.buttonAudio = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  
  [self.buttonAudio setTitle:@"Audio"
                    forState:UIControlStateNormal];
  [self.buttonAudio addTarget:self
                       action:@selector(gotoAppleStoreWebsite:)
             forControlEvents:UIControlEventTouchUpInside];
  
  self.buttonAudio.frame = buttonRect;
  
  [self.view addSubview:self.buttonAudio];
  
}


- (void)viewDidUnload{
  [super viewDidUnload];
  self.buttonPhoto = nil;
  self.buttonAudio = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
	return YES;
}

@end
