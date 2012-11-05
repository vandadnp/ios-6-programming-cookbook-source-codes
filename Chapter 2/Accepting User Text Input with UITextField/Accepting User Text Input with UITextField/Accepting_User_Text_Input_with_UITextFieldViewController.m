//
//  Accepting_User_Text_Input_with_UITextFieldViewController.m
//  Accepting User Text Input with UITextField
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import "Accepting_User_Text_Input_with_UITextFieldViewController.h"
//
//@implementation Accepting_User_Text_Input_with_UITextFieldViewController

/* 2 */
#import "Accepting_User_Text_Input_with_UITextFieldViewController.h"

@implementation Accepting_User_Text_Input_with_UITextFieldViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  CGRect textFieldFrame = CGRectMake(0.0f,
//                                     0.0f,
//                                     200.0f, 
//                                     31.0f);
//	
//  self.myTextField = [[UITextField alloc]
//                      initWithFrame:textFieldFrame];
//  self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//  
//  self.myTextField.contentVerticalAlignment = 
//    UIControlContentVerticalAlignmentCenter;
//  
//  self.myTextField.textAlignment = UITextAlignmentCenter;
//  
//  self.myTextField.text = @"Sir Richard Branson";
//  self.myTextField.center = self.view.center;
//  [self.view addSubview:self.myTextField];
//  
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  CGRect textFieldFrame = CGRectMake(0.0f,
//                                     0.0f,
//                                     200.0f, 
//                                     31.0f);
//	
//  self.myTextField = [[UITextField alloc]
//                      initWithFrame:textFieldFrame];
//  
//  self.myTextField.delegate = self;
//  
//  self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//  
//  self.myTextField.contentVerticalAlignment = 
//    UIControlContentVerticalAlignmentCenter;
//  
//  self.myTextField.textAlignment = UITextAlignmentCenter;
//  
//  self.myTextField.text = @"Sir Richard Branson";
//  self.myTextField.center = self.view.center;
//  [self.view addSubview:self.myTextField];
//  
//}

/* 3 */
//- (void) calculateAndDisplayTextFieldLengthWithText:(NSString *)paramText{
//  
//  NSString *characterOrCharacters = @"Characters";
//  if ([paramText length] == 1){
//    characterOrCharacters = @"Character";
//  }
//  
//  self.labelCounter.text = [NSString stringWithFormat:@"%lu %@",
//                            (unsigned long)[paramText length],
//                            characterOrCharacters];
//}
//
//- (BOOL)                textField:(UITextField *)textField 
//    shouldChangeCharactersInRange:(NSRange)range 
//                replacementString:(NSString *)string{
//  
//  BOOL result = YES;
//  
//  if ([textField isEqual:self.myTextField]){
//    NSString *wholeText = 
//    [textField.text stringByReplacingCharactersInRange:range
//                                            withString:string];
//    [self calculateAndDisplayTextFieldLengthWithText:wholeText];
//  }
//  
//  return result;
//  
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//  [textField resignFirstResponder];
//  return YES;
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  CGRect textFieldFrame = CGRectMake(38.0f,
//                                     30.0f,
//                                     220.0f, 
//                                     31.0f);
//	
//  self.myTextField = [[UITextField alloc]
//                      initWithFrame:textFieldFrame];
//  
//  self.myTextField.delegate = self;
//  
//  self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//  
//  self.myTextField.contentVerticalAlignment = 
//    UIControlContentVerticalAlignmentCenter;
//  
//  self.myTextField.textAlignment = UITextAlignmentCenter;
//  
//  self.myTextField.text = @"Sir Richard Branson";
//  [self.view addSubview:self.myTextField];
//  
//  CGRect labelCounterFrame = self.myTextField.frame;
//  labelCounterFrame.origin.y += textFieldFrame.size.height + 10;
//  self.labelCounter = [[UILabel alloc] initWithFrame:labelCounterFrame];
//  [self.view addSubview:self.labelCounter];
//  
//  [self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
//  
//}

/* 4 */
//- (void) calculateAndDisplayTextFieldLengthWithText:(NSString *)paramText{
//  
//  NSString *characterOrCharacters = @"Characters";
//  if ([paramText length] == 1){
//    characterOrCharacters = @"Character";
//  }
//  
//  self.labelCounter.text = [NSString stringWithFormat:@"%lu %@",
//                            (unsigned long)[paramText length],
//                            characterOrCharacters];
//}
//
//- (BOOL)                textField:(UITextField *)textField 
//    shouldChangeCharactersInRange:(NSRange)range 
//                replacementString:(NSString *)string{
//  
//  BOOL result = YES;
//  
//  if ([textField isEqual:self.myTextField]){
//    NSString *wholeText = 
//    [textField.text stringByReplacingCharactersInRange:range
//                                            withString:string];
//    [self calculateAndDisplayTextFieldLengthWithText:wholeText];
//  }
//  
//  return result;
//  
//}
//
//- (BOOL)textFieldShouldReturn:(UITextField *)textField{
//  [textField resignFirstResponder];
//  return YES;
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  CGRect textFieldFrame = CGRectMake(38.0f,
//                                     30.0f,
//                                     220.0f, 
//                                     31.0f);
//	
//  self.myTextField = [[UITextField alloc]
//                      initWithFrame:textFieldFrame];
//  
//  self.myTextField.delegate = self;
//  
//  self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
//  
//  self.myTextField.contentVerticalAlignment = 
//    UIControlContentVerticalAlignmentCenter;
//  
//  self.myTextField.textAlignment = UITextAlignmentCenter;
//  
//  self.myTextField.placeholder = @"Enter text here...";
//  [self.view addSubview:self.myTextField];
//  
//  CGRect labelCounterFrame = self.myTextField.frame;
//  labelCounterFrame.origin.y += textFieldFrame.size.height + 10;
//  self.labelCounter = [[UILabel alloc] initWithFrame:labelCounterFrame];
//  [self.view addSubview:self.labelCounter];
//  
//  [self calculateAndDisplayTextFieldLengthWithText:self.myTextField.text];
//  
//}

/* 5 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  CGRect textFieldFrame = CGRectMake(38.0f,
                                     30.0f,
                                     240.0f, 
                                     31.0f);
	
  self.myTextField = [[UITextField alloc]
                      initWithFrame:textFieldFrame];
  
  self.myTextField.keyboardType = UIKeyboardTypeDecimalPad;
  
  self.myTextField.borderStyle = UITextBorderStyleRoundedRect;
  
  self.myTextField.contentVerticalAlignment = 
    UIControlContentVerticalAlignmentCenter;
  
  self.myTextField.textAlignment = UITextAlignmentLeft;
  
  self.myTextField.placeholder = @"Enter amount here.";
  [self.view addSubview:self.myTextField];
  
  UILabel *currencyLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  currencyLabel.text = [[[NSNumberFormatter alloc] init] currencySymbol];
  currencyLabel.font = self.myTextField.font;
  [currencyLabel sizeToFit];
  self.myTextField.leftView = currencyLabel;
  self.myTextField.leftViewMode = UITextFieldViewModeAlways;
  
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

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
