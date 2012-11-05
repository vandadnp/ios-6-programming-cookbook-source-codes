//
//  ViewController.m
//  Autolayout and the Visual Format Language Introduction
//
//  Created by Vandad Nahavandipoor on 14/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button1;
@property (nonatomic, strong) UIButton *button2;
@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.button1 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button1 setTitle:@"Button 1" forState:UIControlStateNormal];
    self.button2 = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    [self.button2 setTitle:@"Button 2" forState:UIControlStateNormal];
    self.button1.translatesAutoresizingMaskIntoConstraints = NO;
    self.button2.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:self.button1];
    [self.view addSubview:self.button2];
    
    NSLayoutConstraint *button1CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.button1
                                                                                attribute:NSLayoutAttributeCenterY
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeCenterY
                                                                               multiplier:1
                                                                                 constant:0];
    
    NSLayoutConstraint *button2CenterYConstraint = [NSLayoutConstraint constraintWithItem:self.button2
                                                                                attribute:NSLayoutAttributeCenterY
                                                                                relatedBy:NSLayoutRelationEqual
                                                                                   toItem:self.view
                                                                                attribute:NSLayoutAttributeCenterY
                                                                               multiplier:1
                                                                                 constant:0];
    
    NSLayoutConstraint *button1LeftEqualToButton2Right = [NSLayoutConstraint constraintWithItem:self.button1
                                                                                      attribute:NSLayoutAttributeLeft
                                                                                      relatedBy:NSLayoutRelationEqual
                                                                                         toItem:self.button2
                                                                                      attribute:NSLayoutAttributeRight
                                                                                     multiplier:1.0f
                                                                                       constant:0.0f];
    [button1LeftEqualToButton2Right setPriority:UILayoutPriorityDefaultLow];
    
    NSLayoutConstraint *horizontalDistanceBetweenButtonsConstraint = [NSLayoutConstraint constraintWithItem:self.button1
                                                                                                  attribute:NSLayoutAttributeRight
                                                                                                  relatedBy:NSLayoutRelationEqual
                                                                                                     toItem:self.button2
                                                                                                  attribute:NSLayoutAttributeLeft
                                                                                                 multiplier:1.0f
                                                                                                   constant:0.0f];
    
    [self.view addConstraints:@[button1CenterYConstraint, button2CenterYConstraint, horizontalDistanceBetweenButtonsConstraint, button1LeftEqualToButton2Right]];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
