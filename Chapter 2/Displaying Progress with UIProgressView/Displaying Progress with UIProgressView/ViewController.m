//
//  ViewController.m
//  Displaying Progress with UIProgressView
//
//  Created by Vandad Nahavandipoor on 30/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad{
  
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.progressView = [[UIProgressView alloc] 
                       initWithProgressViewStyle:UIProgressViewStyleBar];
  self.progressView.center = self.view.center;
  
  self.progressView.progress = 20.0f / 30.0f;
  
  [self.view addSubview:self.progressView];

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
