//
//  Passing_Data_From_One_Screen_to_the_Other_ViewController.m
//  Passing Data From One Screen to the Other<
//
//  Created by Vandad Nahavandipoor on 12/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Passing_Data_From_One_Screen_to_the_Other_ViewController.h"
#import "SecondViewController.h"

@implementation Passing_Data_From_One_Screen_to_the_Other_ViewController

/* 1 */
//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//  
//  NSLog(@"Source Controller = %@", [segue sourceViewController]);
//  NSLog(@"Destination Controller = %@", [segue destinationViewController]);
//  NSLog(@"Segue Identifier = %@", [segue identifier]);
//  
//}

/* 2 */
//- (void) prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
//  
//  NSLog(@"Source Controller = %@", [segue sourceViewController]);
//  NSLog(@"Destination Controller = %@", [segue destinationViewController]);
//  NSLog(@"Segue Identifier = %@", [segue identifier]);
//  
//  if ([[segue identifier] 
//       isEqualToString:@"SimpleSegueToSecondViewController"]){
//    
//    SecondViewController *viewController = [segue destinationViewController];
//    viewController.dataModel = ...
//    
//  }
//  
//}

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
