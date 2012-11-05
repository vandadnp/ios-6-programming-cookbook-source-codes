//
//  Displaying_Alerts_with_UIAlertViewViewController.m
//  Displaying Alerts with UIAlertView
//
//  Created by Vandad Nahavandipoor on 16/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Alerts_with_UIAlertViewViewController.h"

@implementation Displaying_Alerts_with_UIAlertViewViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
  [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
}

- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

/* 1 */
//- (void) viewDidAppear:(BOOL)animated{
//  [super viewDidAppear:animated];
//  
//  UIAlertView *alertView = [[UIAlertView alloc]
//                            initWithTitle:@"Title"
//                            message:@"Message"
//                            delegate:nil
//                            cancelButtonTitle:@"Cancel"
//                            otherButtonTitles:@"Ok", nil];
//  [alertView show];
//  
//}

/* 2 */
- (NSString *) yesButtonTitle{
  return @"Yes";
}

- (NSString *) noButtonTitle{
  return @"No";
}

- (void)      alertView:(UIAlertView *)alertView 
   clickedButtonAtIndex:(NSInteger)buttonIndex{
  
  NSString *buttonTitle = [alertView buttonTitleAtIndex:buttonIndex];
  
  if ([buttonTitle isEqualToString:[self yesButtonTitle]]){
    NSLog(@"User pressed the Yes button.");
  }
  else if ([buttonTitle isEqualToString:[self noButtonTitle]]){
    NSLog(@"User pressed the No button.");
  }
  
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  NSString *message = @"Are you sure you want to open this link in Safari?";
  UIAlertView *alertView = [[UIAlertView alloc]
                            initWithTitle:@"Open Link"
                            message:message
                            delegate:self
                            cancelButtonTitle:[self noButtonTitle]
                            otherButtonTitles:[self yesButtonTitle], nil];
  [alertView show];
  
}

/* 3 */
//- (void) viewDidAppear:(BOOL)animated{
//  [super viewDidAppear:animated];
//  
//  UIAlertView *alertView = [[UIAlertView alloc] 
//                            initWithTitle:@"Credit Card Number"
//                            message:@"Please enter your credit card number:"
//                            delegate:self
//                            cancelButtonTitle:@"Cancel"
//                            otherButtonTitles:@"Ok", nil];
//  [alertView setAlertViewStyle:UIAlertViewStylePlainTextInput];
//  
//  /* Display a numerical keypad for this text field */
//  UITextField *textField = [alertView textFieldAtIndex:0];
//  textField.keyboardType = UIKeyboardTypeNumberPad;
//  
//  [alertView show];
//  
//}

/* 4 */
//- (void) viewDidAppear:(BOOL)animated{
//  [super viewDidAppear:animated];
//  
//  UIAlertView *alertView = [[UIAlertView alloc] 
//                            initWithTitle:@"Password"
//                            message:@"Please enter your password:"
//                            delegate:self
//                            cancelButtonTitle:@"Cancel"
//                            otherButtonTitles:@"Ok", nil];
//  
//  [alertView setAlertViewStyle:UIAlertViewStyleSecureTextInput];
//  [alertView show];
//  
//}

/* 5 */
//- (void) viewDidAppear:(BOOL)animated{
//  [super viewDidAppear:animated];
//  
//  UIAlertView *alertView = [[UIAlertView alloc] 
//                            initWithTitle:@"Password"
//                            message:@"Please enter your credentials:"
//                            delegate:self
//                            cancelButtonTitle:@"Cancel"
//                            otherButtonTitles:@"Ok", nil];
//  
//  [alertView setAlertViewStyle:UIAlertViewStyleLoginAndPasswordInput];
//  [alertView show];
//  
//}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
