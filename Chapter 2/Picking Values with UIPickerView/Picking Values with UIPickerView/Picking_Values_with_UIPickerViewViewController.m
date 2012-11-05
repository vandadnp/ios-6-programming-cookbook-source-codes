//
//  Picking_Values_with_UIPickerViewViewController.m
//  Picking Values with UIPickerView
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Picking_Values_with_UIPickerViewViewController.h"

@implementation Picking_Values_with_UIPickerViewViewController

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
//	
//  self.myPicker = [[UIPickerView alloc] init];
//  self.myPicker.center = self.view.center;
//  [self.view addSubview:self.myPicker];
//  
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//	
//  self.myPicker = [[UIPickerView alloc] init];
//  self.myPicker.dataSource = self;
//  self.myPicker.center = self.view.center;
//  [self.view addSubview:self.myPicker];
//  
//}

/* 3 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//	
//  self.myPicker = [[UIPickerView alloc] init];
//  self.myPicker.dataSource = self;
//  self.myPicker.center = self.view.center;
//  [self.view addSubview:self.myPicker];
//  
//}
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//  
//  NSInteger result = 0;
//  if ([pickerView isEqual:self.myPicker]){
//    result = 1;
//  }
//  return result;
//  
//}
//
//- (NSInteger)   pickerView:(UIPickerView *)pickerView 
//   numberOfRowsInComponent:(NSInteger)component{
//  
//  NSInteger result = 0;
//  if ([pickerView isEqual:self.myPicker]){
//    result = 10;
//  }
//  return result;
//  
//}

/* 4 */
//- (NSString *)pickerView:(UIPickerView *)pickerView 
//             titleForRow:(NSInteger)row
//            forComponent:(NSInteger)component{
//  
//  NSString *result = nil;
//  if ([pickerView isEqual:self.myPicker]){
//    
//    /* Row is zero-based and we want the first row (with index 0)
//     to be rendered as Row 1 so we have to +1 every row index */
//    result = [NSString stringWithFormat:@"Row %ld", (long)row + 1];
//    
//  }
//  return result;
//  
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//	
//  self.myPicker = [[UIPickerView alloc] init];
//  self.myPicker.dataSource = self;
//  self.myPicker.delegate = self;
//  self.myPicker.center = self.view.center;
//  [self.view addSubview:self.myPicker];
//  
//}
//
//- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
//  
//  NSInteger result = 0;
//  if ([pickerView isEqual:self.myPicker]){
//    result = 1;
//  }
//  return result;
//  
//}
//
//- (NSInteger)   pickerView:(UIPickerView *)pickerView 
//   numberOfRowsInComponent:(NSInteger)component{
//  
//  NSInteger result = 0;
//  if ([pickerView isEqual:self.myPicker]){
//    result = 10;
//  }
//  return result;
//  
//}

/* 5 */
- (NSString *)pickerView:(UIPickerView *)pickerView 
             titleForRow:(NSInteger)row
            forComponent:(NSInteger)component{
  
  NSString *result = nil;
  if ([pickerView isEqual:self.myPicker]){
    
    /* Row is zero-based and we want the first row (with index 0)
     to be rendered as Row 1 so we have to +1 every row index */
    result = [NSString stringWithFormat:@"Row %ld", (long)row + 1];
    
  }
  return result;
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
	
  self.myPicker = [[UIPickerView alloc] init];
  self.myPicker.showsSelectionIndicator = YES;
  self.myPicker.dataSource = self;
  self.myPicker.delegate = self;
  self.myPicker.center = self.view.center;
  [self.view addSubview:self.myPicker];
  
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
  
  NSInteger result = 0;
  if ([pickerView isEqual:self.myPicker]){
    result = 1;
  }
  return result;
  
}

- (NSInteger)   pickerView:(UIPickerView *)pickerView 
   numberOfRowsInComponent:(NSInteger)component{
  
  NSInteger result = 0;
  if ([pickerView isEqual:self.myPicker]){
    result = 10;
  }
  return result;
  
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
