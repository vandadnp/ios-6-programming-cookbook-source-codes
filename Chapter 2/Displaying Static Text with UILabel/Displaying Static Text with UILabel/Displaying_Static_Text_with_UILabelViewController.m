//
//  Displaying_Static_Text_with_UILabelViewController.m
//  Displaying Static Text with UILabel
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Static_Text_with_UILabelViewController.h"

@implementation Displaying_Static_Text_with_UILabelViewController

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
//  CGRect labelFrame = CGRectMake(0.0f, 
//                                 0.0f,
//                                 100.0f,
//                                 23.0f);
//  self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
//  self.myLabel.text = @"iOS 6 Programming Cookbook";
//  self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
//  self.myLabel.center = self.view.center;
//  [self.view addSubview:self.myLabel];
//  
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  CGRect labelFrame = CGRectMake(0.0f, 
//                                 0.0f,
//                                 100.0f,
//                                 50.0f);
//  self.myLabel.numberOfLines
//  self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
//  self.myLabel.text = @"iOS 6 Programming Cookbook";
//  self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
//  self.myLabel.center = self.view.center;
//  [self.view addSubview:self.myLabel];
//  
//}

/* 3 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  CGRect labelFrame = CGRectMake(0.0f, 
//                                 0.0f,
//                                 100.0f,
//                                 50.0f);
//  self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
//  self.myLabel.numberOfLines = 3;
//  self.myLabel.text = @"iOS 6 Programming Cookbook";
//  self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
//  self.myLabel.center = self.view.center;
//  [self.view addSubview:self.myLabel];
//  
//}

/* 4 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  CGRect labelFrame = CGRectMake(0.0f, 
                                 0.0f,
                                 100.0f,
                                 23.0f);
  self.myLabel = [[UILabel alloc] initWithFrame:labelFrame];
  self.myLabel.adjustsFontSizeToFitWidth = YES;
  self.myLabel.text = @"iOS 6 Programming Cookbook";
  self.myLabel.font = [UIFont boldSystemFontOfSize:14.0f];
  self.myLabel.center = self.view.center;
  [self.view addSubview:self.myLabel];
  
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
