//
//  Scaling_Shapes_Drawn_on_Graphic_ContextsViewController.m
//  Scaling Shapes Drawn on Graphic Contexts
//
//  Created by Vandad Nahavandipoor on 17/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Scaling_Shapes_Drawn_on_Graphic_ContextsViewController.h"

@implementation Scaling_Shapes_Drawn_on_Graphic_ContextsViewController

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
  self.view.backgroundColor = [UIColor whiteColor];
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
  return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
}

@end
