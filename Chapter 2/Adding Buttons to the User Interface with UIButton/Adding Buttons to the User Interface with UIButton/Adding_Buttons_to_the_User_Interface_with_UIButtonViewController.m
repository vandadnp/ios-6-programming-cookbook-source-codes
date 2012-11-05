//
//  Adding_Buttons_to_the_User_Interface_with_UIButtonViewController.m
//  Adding Buttons to the User Interface with UIButton
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Adding_Buttons_to_the_User_Interface_with_UIButtonViewController.h"

@implementation
  Adding_Buttons_to_the_User_Interface_with_UIButtonViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/* 1 */
//- (void) buttonIsPressed:(UIButton *)paramSender{
//  NSLog(@"Button is pressed.");
//}
//
//- (void) buttonIsTapped:(UIButton *)paramSender{
//  NSLog(@"Button is tapped.");
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//	self.view.backgroundColor = [UIColor whiteColor];
//  
//  self.myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//  
//  self.myButton.frame = CGRectMake(110.0f,
//                                   200.0f, 
//                                   100.0f, 
//                                   37.0f);
//  
//  [self.myButton setTitle:@"Press Me"
//                 forState:UIControlStateNormal];
//  
//  [self.myButton setTitle:@"I'm Pressed"
//                 forState:UIControlStateHighlighted];
//  
//  [self.myButton addTarget:self
//                    action:@selector(buttonIsPressed:)
//          forControlEvents:UIControlEventTouchDown];
//  
//  [self.myButton addTarget:self
//                    action:@selector(buttonIsTapped:)
//          forControlEvents:UIControlEventTouchUpInside];
//  
//  [self.view addSubview:self.myButton];
//  
//}

/* 2 */
//- (void) buttonIsPressed:(UIButton *)paramSender{
//  NSLog(@"Button is pressed.");
//}
//
//- (void) buttonIsTapped:(UIButton *)paramSender{
//  NSLog(@"Button is tapped.");
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//	self.view.backgroundColor = [UIColor whiteColor];
//  
//  self.myButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
//  
//  self.myButton.frame = CGRectMake(110.0f,
//                                   200.0f, 
//                                   100.0f, 
//                                   37.0f);
//  
//  [self.myButton setTitle:@"Press Me"
//                 forState:UIControlStateNormal];
//  
//  [self.myButton setTitle:@"I'm Pressed"
//                 forState:UIControlStateHighlighted];
//  
//  [self.myButton addTarget:self
//                    action:@selector(buttonIsPressed:)
//          forControlEvents:UIControlEventTouchDown];
//  
//  [self.myButton addTarget:self
//                    action:@selector(buttonIsTapped:)
//          forControlEvents:UIControlEventTouchUpInside];
//  
//  [self.view addSubview:self.myButton];
//  
//}

/* 3 */
- (void) buttonIsPressed:(UIButton *)paramSender{
  NSLog(@"Button is pressed.");
}

- (void) buttonIsTapped:(UIButton *)paramSender{
  NSLog(@"Button is tapped.");
}

- (void)viewDidLoad{
  [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
  
  UIImage *normalImage = [UIImage imageNamed:@"NormalBlueButton.png"];
  UIImage *highlightedImage = [UIImage imageNamed:@"HighlightedBlueButton"];
  
  self.myButton = [UIButton buttonWithType:UIButtonTypeCustom];
  
  self.myButton.frame = CGRectMake(110.0f,
                                   200.0f, 
                                   100.0f, 
                                   37.0f);
  
  [self.myButton setBackgroundImage:normalImage
                           forState:UIControlStateNormal];
  [self.myButton setTitle:@"Normal"
                 forState:UIControlStateNormal];
  
  [self.myButton setBackgroundImage:highlightedImage
                           forState:UIControlStateHighlighted];
  [self.myButton setTitle:@"Pressed"
                 forState:UIControlStateHighlighted];
  
  [self.myButton addTarget:self
                    action:@selector(buttonIsPressed:)
          forControlEvents:UIControlEventTouchDown];
  
  [self.myButton addTarget:self
                    action:@selector(buttonIsTapped:)
          forControlEvents:UIControlEventTouchUpInside];
  
  [self.view addSubview:self.myButton];
  
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
