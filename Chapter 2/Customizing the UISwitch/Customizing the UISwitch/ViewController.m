//
//  ViewController.m
//  Customizing the UISwitch
//
//  Created by Vandad NP on 22/07/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISwitch *mainSwitch;
@end

@implementation ViewController

/* This method makes sure that the x, y, width and height of a rectangle
 is rounded. Non-rounded rectangular frames of UI components can cause those
 components to appear blurry on iOS Simulator. This is not a problem on a
 real iOS device */
- (CGRect) roundedValuesInRect:(CGRect)paramRect{
    paramRect.origin.x = round(CGRectGetMinX(paramRect));
    paramRect.origin.y = round(CGRectGetMinY(paramRect));
    paramRect.size.width = round(CGRectGetWidth(paramRect));
    paramRect.size.height = round(CGRectGetHeight(paramRect));
    return paramRect;
}

/* 1 */
//- (void)viewDidLoad
//{
//    [super viewDidLoad];
//	// Do any additional setup after loading the view, typically from a nib.
//    
//    /* Create the switch */
//    self.view.backgroundColor = [UIColor whiteColor];
//    self.mainSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
//    self.mainSwitch.center = self.view.center;
//    /* Make sure the switch won't appear blurry on iOS Simulator */
//    self.mainSwitch.frame = [self roundedValuesInRect:self.mainSwitch.frame];
//    [self.view addSubview:self.mainSwitch];
//    
//    /* Customize the switch */
//    
//    /* Adjust the off-mode tint color */
//    self.mainSwitch.tintColor = [UIColor redColor];
//    /* Adjust the on-mode tint color */
//    self.mainSwitch.onTintColor = [UIColor brownColor];
//    /* Also change the knob's tint color */
//    self.mainSwitch.thumbTintColor = [UIColor greenColor];
//    
//}

/* 2 */
- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    /* Create the switch */
    self.view.backgroundColor = [UIColor whiteColor];
    self.mainSwitch = [[UISwitch alloc] initWithFrame:CGRectZero];
    self.mainSwitch.center = self.view.center;
    /* Make sure the switch won't appear blurry on iOS Simulator */
    self.mainSwitch.frame = [self roundedValuesInRect:self.mainSwitch.frame];
    [self.view addSubview:self.mainSwitch];
    
    /* Customize the switch */
    self.mainSwitch.onImage = [UIImage imageNamed:@"On"];
    self.mainSwitch.offImage = [UIImage imageNamed:@"Off"];
    
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
