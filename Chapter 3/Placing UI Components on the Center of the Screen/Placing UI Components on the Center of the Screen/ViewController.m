//
//  ViewController.m
//  Placing UI Components on the Center of the Screen
//
//  Created by Vandad Nahavandipoor on 15/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

/* 1 */
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];

    /* 1) Create our button */
    self.button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.button.translatesAutoresizingMaskIntoConstraints = NO;
    [self.button setTitle:@"Button" forState:UIControlStateNormal];
    [self.view addSubview:self.button];
    
    UIView *superview = self.button.superview;
    
    /* 2) Create the constraint to put the button horizontally in the center */
    NSLayoutConstraint *centerXConstraint =
    [NSLayoutConstraint constraintWithItem:self.button
                                 attribute:NSLayoutAttributeCenterX
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:superview
                                 attribute:NSLayoutAttributeCenterX
                                multiplier:1.0f
                                  constant:0.0f];
    
    /* 3) Create the constraint to put the button vertically in the center */
    NSLayoutConstraint *centerYConstraint =
    [NSLayoutConstraint constraintWithItem:self.button
                                 attribute:NSLayoutAttributeCenterY
                                 relatedBy:NSLayoutRelationEqual
                                    toItem:superview
                                 attribute:NSLayoutAttributeCenterY
                                multiplier:1.0f
                                  constant:0.0f];
    
    
    /* Add the constraints to the superview of the button */
    [superview addConstraints:@[centerXConstraint, centerYConstraint]];
    
}

/* Suport rotation of device to all orientations */
- (NSUInteger) supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end
