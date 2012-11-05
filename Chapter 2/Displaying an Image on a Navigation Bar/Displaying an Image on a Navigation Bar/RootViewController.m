//
//  RootViewController.m
//  Displaying an Image on a Navigation Bar
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "RootViewController.h"

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/*
 // Implement loadView to create a view hierarchy programmatically, without using a nib.
 - (void)loadView
 {
 }
 */

/* 1 */
- (void)viewDidLoad{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  
  /* Create an Image View to replace the Title View */
  UIImageView *imageView =
  [[UIImageView alloc]
   initWithFrame:CGRectMake(0.0f, 0.0f, 100.0f, 40.0f)];
  
  imageView.contentMode = UIViewContentModeScaleAspectFit;
  
  /* Load an image. Be careful, this image will be cached */
  UIImage *image = [UIImage imageNamed:@"FullSizeLogo.png"];
  
  /* Set the image of the Image View */
  [imageView setImage:image];
  
  /* Set the Title View */
  self.navigationItem.titleView = imageView;
  
}


- (void)viewDidUnload
{
  [super viewDidUnload];
  // Release any retained subviews of the main view.
  // e.g. self.myOutlet = nil;
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
