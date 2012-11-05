//
//  Displaying_Images_with_UIImageViewViewController.m
//  Displaying Images with UIImageView
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Images_with_UIImageViewViewController.h"

@implementation Displaying_Images_with_UIImageViewViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir.png"];
//  self.myImageView = [[UIImageView alloc] initWithImage:macBookAir];
//  self.myImageView.center = self.view.center;
//  [self.view addSubview:self.myImageView];
//  
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir.png"];
//  self.myImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
//  self.myImageView.image = macBookAir;
//  self.myImageView.center = self.view.center;
//  [self.view addSubview:self.myImageView];
//  
//}

/* 3 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir.png"];
  self.myImageView = [[UIImageView alloc] initWithFrame:self.view.bounds];
  self.myImageView.contentMode = UIViewContentModeScaleAspectFit;
  self.myImageView.image = macBookAir;
  self.myImageView.center = self.view.center;
  [self.view addSubview:self.myImageView];  
}

- (void)viewWillAppear:(BOOL)animated{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated{
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated{
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation{
  // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
