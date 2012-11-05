//
//  Implementing_Range_Pickers_with_UISliderViewController.m
//  Implementing Range Pickers with UISlider
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Implementing_Range_Pickers_with_UISliderViewController.h"

@implementation Implementing_Range_Pickers_with_UISliderViewController

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
//  self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
//                                                             0.0f,
//                                                             200.0f,
//                                                             23.0f)];
//  self.mySlider.center = self.view.center;
//  self.mySlider.minimumValue = 0.0f;
//  self.mySlider.maximumValue = 100.0f;
//  self.mySlider.value = self.mySlider.maximumValue / 2.0;
//  [self.view addSubview:self.mySlider];
//}

/* 2 */
//- (void) sliderValueChanged:(UISlider *)paramSender{
//  
//  if ([paramSender isEqual:self.mySlider]){
//    NSLog(@"New value = %f", paramSender.value);
//  }
//  
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  self.view.backgroundColor = [UIColor whiteColor];
//  self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
//                                                             0.0f,
//                                                             200.0f,
//                                                             23.0f)];
//  self.mySlider.center = self.view.center;
//  self.mySlider.minimumValue = 0.0f;
//  self.mySlider.maximumValue = 100.0f;
//  self.mySlider.value = self.mySlider.maximumValue / 2.0;
//  [self.view addSubview:self.mySlider];
//  
//  [self.mySlider addTarget:self
//                    action:@selector(sliderValueChanged:)
//          forControlEvents:UIControlEventValueChanged];
//}

/* 3 */
- (void)viewDidLoad{
  [super viewDidLoad];
  self.view.backgroundColor = [UIColor whiteColor];
  self.mySlider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
                                                             0.0f,
                                                             200.0f,
                                                             23.0f)];
  self.mySlider.center = self.view.center;
  self.mySlider.minimumValue = 0.0f;
  self.mySlider.maximumValue = 100.0f;
  self.mySlider.value = self.mySlider.maximumValue / 2.0;
  [self.view addSubview:self.mySlider];
  
  [self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbNormal.png"]
                      forState:UIControlStateNormal];
  [self.mySlider setThumbImage:[UIImage imageNamed:@"ThumbHighlighted.png"]
                      forState:UIControlStateHighlighted];
  
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
