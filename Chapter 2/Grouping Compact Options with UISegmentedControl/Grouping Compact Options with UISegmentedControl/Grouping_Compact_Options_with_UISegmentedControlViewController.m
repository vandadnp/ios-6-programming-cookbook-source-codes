//
//  Grouping_Compact_Options_with_UISegmentedControlViewController.m
//  Grouping Compact Options with UISegmentedControl
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Grouping_Compact_Options_with_UISegmentedControlViewController.h"

@implementation 
  Grouping_Compact_Options_with_UISegmentedControlViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//	self.view.backgroundColor = [UIColor whiteColor];
//  NSArray *segments = [[NSArray alloc] initWithObjects:
//                       @"iPhone",
//                       @"iPad",
//                       @"iPod",
//                       @"iMac", nil];
//  
//  self.mySegmentedControl = [[UISegmentedControl alloc]
//                             initWithItems:segments];
//  self.mySegmentedControl.center = self.view.center;
//  [self.view addSubview:self.mySegmentedControl];
//  
//}

/* 2 */
//- (void) segmentChanged:(UISegmentedControl *)paramSender{
//  if ([paramSender isEqual:self.mySegmentedControl]){
//    NSInteger selectedSegmentIndex = [paramSender selectedSegmentIndex]; 
//    
//    NSString  *selectedSegmentText = 
//      [paramSender titleForSegmentAtIndex:selectedSegmentIndex];
//    
//    NSLog(@"Segment %ld with %@ text is selected",
//          (long)selectedSegmentIndex,
//          selectedSegmentText);
//  }
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//	self.view.backgroundColor = [UIColor whiteColor];
//  NSArray *segments = [[NSArray alloc] initWithObjects:
//                       @"iPhone",
//                       @"iPad",
//                       @"iPod",
//                       @"iMac", nil];
//  
//  self.mySegmentedControl = [[UISegmentedControl alloc]
//                             initWithItems:segments];
//  self.mySegmentedControl.center = self.view.center;
//  [self.view addSubview:self.mySegmentedControl];
//  
//  [self.mySegmentedControl addTarget:self
//                              action:@selector(segmentChanged:)
//                    forControlEvents:UIControlEventValueChanged];
//}

/* 3 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//	self.view.backgroundColor = [UIColor whiteColor];
//  NSArray *segments = [[NSArray alloc] initWithObjects:
//                       @"iPhone",
//                       @"iPad",
//                       @"iPod",
//                       @"iMac", nil];
//  
//  self.mySegmentedControl = [[UISegmentedControl alloc]
//                             initWithItems:segments];
//  self.mySegmentedControl.center = self.view.center;
//  self.mySegmentedControl.momentary = YES;
//  [self.view addSubview:self.mySegmentedControl];
//}

/* 4 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//	self.view.backgroundColor = [UIColor whiteColor];
//  NSArray *segments = [[NSArray alloc] initWithObjects:
//                       @"iPhone",
//                       [UIImage imageNamed:@"iPad.png"],
//                       @"iPod",
//                       @"iMac", nil];
//  
//  self.mySegmentedControl = [[UISegmentedControl alloc]
//                             initWithItems:segments];
//  
//  CGRect segmentedFrame = self.mySegmentedControl.frame;
//  segmentedFrame.size.height = 64.0f;
//  segmentedFrame.size.width = 300.0f;
//  self.mySegmentedControl.frame = segmentedFrame;
//  
//  self.mySegmentedControl.center = self.view.center;
//    
//  [self.view addSubview:self.mySegmentedControl];
//}

/* 5 */
- (void)viewDidLoad{
  [super viewDidLoad];
	self.view.backgroundColor = [UIColor whiteColor];
  NSArray *segments = [[NSArray alloc] initWithObjects:
                       @"iPhone",
                       [UIImage imageNamed:@"iPad.png"],
                       @"iPod",
                       @"iMac", nil];
  
  self.mySegmentedControl = [[UISegmentedControl alloc]
                             initWithItems:segments];
  
  self.mySegmentedControl.segmentedControlStyle = 
    UISegmentedControlStyleBezeled;
  
  CGRect segmentedFrame = self.mySegmentedControl.frame;
  segmentedFrame.size.height = 64.0f;
  segmentedFrame.size.width = 300.0f;
  self.mySegmentedControl.frame = segmentedFrame;
  
  self.mySegmentedControl.center = self.view.center;
  
  [self.view addSubview:self.mySegmentedControl];
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
