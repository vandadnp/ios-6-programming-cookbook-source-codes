//
//  Creating_and_Using_Switches_with_UISwitchViewController.m
//  Creating and Using Switches with UISwitch
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Creating_and_Using_Switches_with_UISwitchViewController.h"

@implementation Creating_and_Using_Switches_with_UISwitchViewController

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
//  /* Make sure our view is white */
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  /* Create the switch */
//  self.mySwitch = [[UISwitch alloc] initWithFrame:
//                   CGRectMake(100, 100, 0, 0)];
//  
//  [self.view addSubview:self.mySwitch];
//  
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  /* Make sure our view is white */
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  /* Create the switch */
//  self.mySwitch = [[UISwitch alloc] initWithFrame:
//                   CGRectMake(100, 100, 0, 0)];  
//  [self.mySwitch setOn:YES];
//  [self.view addSubview:self.mySwitch];
//  
//}

/* 3 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  /* Make sure our view is white */
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  /* Create the switch */
//  self.mySwitch = [[UISwitch alloc] initWithFrame:
//                   CGRectMake(100, 100, 0, 0)];  
//  [self.mySwitch setOn:YES];
//  [self.view addSubview:self.mySwitch];
//  
//  if ([self.mySwitch isOn]){
//    NSLog(@"The switch is on.");
//  } else {
//    NSLog(@"The switch is off.");
//  }
//  
//}

/* 4 */
- (void) switchIsChanged:(UISwitch *)paramSender{
  
  NSLog(@"Sender is = %@", paramSender);
  
  if ([paramSender isOn]){
    NSLog(@"The switch is turned on.");
  } else {
    NSLog(@"The switch is turned off.");
  }
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  /* Make sure our view is white */
  self.view.backgroundColor = [UIColor whiteColor];
  
  /* Create the switch */
  self.mySwitch = [[UISwitch alloc] initWithFrame:
                   CGRectMake(100, 100, 0, 0)];  
  [self.mySwitch setOn:YES];
  [self.view addSubview:self.mySwitch];
  
  [self.mySwitch addTarget:self
                    action:@selector(switchIsChanged:)
          forControlEvents:UIControlEventValueChanged];
  
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
