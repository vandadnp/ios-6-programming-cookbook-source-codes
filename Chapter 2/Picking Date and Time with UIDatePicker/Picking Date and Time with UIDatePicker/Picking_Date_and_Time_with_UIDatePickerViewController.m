//
//  Picking_Date_and_Time_with_UIDatePickerViewController.m
//  Picking Date and Time with UIDatePicker
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Picking_Date_and_Time_with_UIDatePickerViewController.h"

@implementation Picking_Date_and_Time_with_UIDatePickerViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.myDatePicker = [[UIDatePicker alloc] init];
//  self.myDatePicker.center = self.view.center;
//  [self.view addSubview:self.myDatePicker];  
//}

/* 2 */
//NSDate *currentDate = self.myDatePicker.date;
//NSLog(@"Date = %@", currentDate);

/* 3 */
//- (void) datePickerDateChanged:(UIDatePicker *)paramDatePicker{
//  
//  if ([paramDatePicker isEqual:self.myDatePicker]){
//    NSLog(@"Selected date = %@", paramDatePicker.date);
//  }
//  
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.myDatePicker = [[UIDatePicker alloc] init];
//  self.myDatePicker.center = self.view.center;
//  [self.view addSubview:self.myDatePicker];
//  
//  [self.myDatePicker addTarget:self
//                        action:@selector(datePickerDateChanged:)
//              forControlEvents:UIControlEventValueChanged];
//  
//}

/* 4 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.myDatePicker = [[UIDatePicker alloc] init];
//  self.myDatePicker.center = self.view.center;
//  self.myDatePicker.datePickerMode = UIDatePickerModeDate;
//  [self.view addSubview:self.myDatePicker];
//  
//  
//  NSTimeInterval oneYearTime = 365 * 24 * 60 * 60;
//  NSDate *todayDate = [NSDate date];
//  
//  NSDate *oneYearFromToday = [todayDate 
//                              dateByAddingTimeInterval:oneYearTime];
//  
//  NSDate *twoYearsFromToday = [todayDate 
//                               dateByAddingTimeInterval:2 * oneYearTime];
//
//  self.myDatePicker.minimumDate = oneYearFromToday;
//  self.myDatePicker.maximumDate = twoYearsFromToday;
//}

/* 5 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.myDatePicker = [[UIDatePicker alloc] init];
//  self.myDatePicker.center = self.view.center;
//  self.myDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
//  [self.view addSubview:self.myDatePicker];
//  
//  NSTimeInterval twoMinutes = 2 * 60;
//  [self.myDatePicker setCountDownDuration:twoMinutes];
//}

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
