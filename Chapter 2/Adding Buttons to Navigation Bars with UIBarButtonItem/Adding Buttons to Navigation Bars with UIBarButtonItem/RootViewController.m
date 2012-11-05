//
//  RootViewController.m
//  Adding Buttons to Navigation Bars with UIBarButtonItem
//
//  Created by Vandad Nahavandipoor on 09/07/2011.
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
//- (void) performAdd:(id)paramSender{
//  NSLog(@"Action method got called.");
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.title = @"First Controller";
//  
//  self.navigationItem.rightBarButtonItem = 
//  [[UIBarButtonItem alloc] initWithTitle:@"Add"
//                                   style:UIBarButtonItemStylePlain
//                                  target:self
//                                  action:@selector(performAdd:)];
//}

/* 2 */
//- (void) performAdd:(id)paramSender{
//  NSLog(@"Action method got called.");
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.title = @"First Controller";
//  
//  self.navigationItem.rightBarButtonItem = 
//  [[UIBarButtonItem alloc] 
//   initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
//                        target:self
//                        action:@selector(performAdd:)];
//}

/* 3 */
//- (void) switchIsChanged:(UISwitch *)paramSender{
//  if ([paramSender isOn]){
//    NSLog(@"Switch is on.");
//  } else {
//    NSLog(@"Switch is off.");
//  }
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.title = @"First Controller";
//  
//  UISwitch *simpleSwitch = [[UISwitch alloc] init];
//  simpleSwitch.on = YES;
//  [simpleSwitch addTarget:self
//                   action:@selector(switchIsChanged:)
//         forControlEvents:UIControlEventValueChanged];
//  
//  self.navigationItem.rightBarButtonItem = 
//  [[UIBarButtonItem alloc] initWithCustomView:simpleSwitch];
//}

/* 4 */
//- (void) segmentedControlTapped:(UISegmentedControl *)paramSender{
//  
//  if ([paramSender selectedSegmentIndex] == 0){
//    /* Up button */
//    NSLog(@"Up");
//  } else  if ([paramSender selectedSegmentIndex] == 1){
//    /* Down button */
//    NSLog(@"Down");
//  }
//  
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.title = @"First Controller";
//  
//  NSArray *items = [[NSArray alloc] initWithObjects:
//                    [UIImage imageNamed:@"UpArrow.png"],
//                    [UIImage imageNamed:@"DownArrow.png"], nil];
//  
//  UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
//                                          initWithItems:items];
//  
//  segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
//  segmentedControl.momentary = YES;
//  
//  [segmentedControl addTarget:self
//                       action:@selector(segmentedControlTapped:)
//             forControlEvents:UIControlEventValueChanged];
//  
//  self.navigationItem.rightBarButtonItem = 
//  [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
//  
//}

/* 5 */
- (void) segmentedControlTapped:(UISegmentedControl *)paramSender{
  
  if ([paramSender selectedSegmentIndex] == 0){
    /* Up button */
    NSLog(@"Up");
  } else  if ([paramSender selectedSegmentIndex] == 1){
    /* Down button */
    NSLog(@"Down");
  }
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  self.title = @"First Controller";
  
  NSArray *items = [[NSArray alloc] initWithObjects:
                    [UIImage imageNamed:@"UpArrow.png"],
                    [UIImage imageNamed:@"DownArrow.png"], nil];
  
  UISegmentedControl *segmentedControl = [[UISegmentedControl alloc]
                                          initWithItems:items];
  
  segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
  segmentedControl.momentary = YES;
  
  [segmentedControl addTarget:self
                       action:@selector(segmentedControlTapped:)
             forControlEvents:UIControlEventValueChanged];
  
  UIBarButtonItem *rightBarButton = 
  [[UIBarButtonItem alloc] initWithCustomView:segmentedControl];
  
  [self.navigationItem setRightBarButtonItem:rightBarButton
                                    animated:YES];
  
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
