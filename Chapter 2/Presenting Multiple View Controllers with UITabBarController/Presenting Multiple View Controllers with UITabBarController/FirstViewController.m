//
//  FirstViewController.m
//  Presenting Multiple View Controllers with UITabBar
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "FirstViewController.h"

@implementation FirstViewController

- (id)initWithNibName:(NSString *)nibNameOrNil 
               bundle:(NSBundle *)nibBundleOrNil{
  
  self = [super initWithNibName:nibNameOrNil 
                         bundle:nibBundleOrNil];
  if (self != nil) {
    self.title = @"First";
    self.tabBarItem.image = [UIImage imageNamed:@"FirstTab.png"];
  }
  return self;
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
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
- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
