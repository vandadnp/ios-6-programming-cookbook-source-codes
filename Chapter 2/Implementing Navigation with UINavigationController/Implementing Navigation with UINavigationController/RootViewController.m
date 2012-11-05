//
//  RootViewController.m
//  Implementing Navigation with UINavigationController
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "RootViewController.h"
#import "SecondViewController.h"

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
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.title = @"First Controller";
//}

/* 2 */
- (void) pushSecondController{
  SecondViewController *secondController = [[SecondViewController alloc]
                                            initWithNibName:nil
                                            bundle:NULL];
  [self.navigationController pushViewController:secondController
                                       animated:YES];
}
   
- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
  [self performSelector:@selector(pushSecondController)
             withObject:nil
             afterDelay:5.0f];
}

- (void)viewDidLoad{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"First Controller";
}


- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
