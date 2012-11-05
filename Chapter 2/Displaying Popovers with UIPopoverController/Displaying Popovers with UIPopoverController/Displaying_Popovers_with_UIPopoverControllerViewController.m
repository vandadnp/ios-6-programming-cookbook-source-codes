//
//  Displaying_Popovers_with_UIPopoverControllerViewController.m
//  Displaying Popovers with UIPopoverController
//
//  Created by Vandad Nahavandipoor on 28/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Popovers_with_UIPopoverControllerViewController.h"
#import "PopoverContentViewController.h"

@implementation Displaying_Popovers_with_UIPopoverControllerViewController

@synthesize popoverController;

- (NSString *) photoButtonTitle{
  return @"Photo";
}

- (NSString *) audioButtonTitle{
  return @"Audio";
}

- (void)          alertView:(UIAlertView *)alertView 
  didDismissWithButtonIndex:(NSInteger)buttonIndex{
  
  NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
  
  if ([buttonTitle isEqualToString:[self photoButtonTitle]]){
    /* Adding a photo ... */
  }
  else if ([buttonTitle isEqualToString:[self audioButtonTitle]]){
    /* Adding an audio... */
  }
  
}

- (void) performAddWithAlertView:(id)paramSender{
  
  [[[UIAlertView alloc] initWithTitle:nil
                              message:@"Add..."
                             delegate:self
                    cancelButtonTitle:@"Cancel"
                    otherButtonTitles:
    [self photoButtonTitle],
    [self audioButtonTitle], nil] show];
  
}

- (void) performAddWithPopover:(id)paramSender{
  
  [self.popoverController 
   presentPopoverFromBarButtonItem:self.barButtonAdd
   permittedArrowDirections:UIPopoverArrowDirectionAny 
   animated:YES];
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  /* See if this class exists on the iOS running the app */
  Class popoverClass = NSClassFromString(@"UIPopoverController");
  
  if (popoverClass != nil &&
      UI_USER_INTERFACE_IDIOM() == UIUserInterfaceIdiomPad){
    
    PopoverContentViewController *content = 
    [[PopoverContentViewController alloc]  initWithNibName:nil
                                                    bundle:nil];
    
    self.popoverController = [[UIPopoverController alloc]
                              initWithContentViewController:content];
    
    content.popoverController = self.popoverController;
    
    self.barButtonAdd = [[UIBarButtonItem alloc] 
                         initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                         target:self
                         action:@selector(performAddWithPopover:)];
    
  } else {
    
    self.barButtonAdd = [[UIBarButtonItem alloc] 
                         initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                         target:self
                         action:@selector(performAddWithAlertView:)];
    
  }
  
  [self.navigationItem setRightBarButtonItem:self.barButtonAdd
                                    animated:NO];
  
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
