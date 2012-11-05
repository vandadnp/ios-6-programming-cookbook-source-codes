//
//  ViewController.m
//  Customizing the UILabel
//
//  Created by Vandad Nahavandipoor on 23/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.label = [[UILabel alloc] init];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.text = @"iOS SDK";
    self.label.font = [UIFont boldSystemFontOfSize:70.0f];
    self.label.textColor = [UIColor blackColor];
    self.label.shadowColor = [UIColor lightGrayColor];
    self.label.shadowOffset = CGSizeMake(2.0f, 2.0f);
    [self.label sizeToFit];
    self.label.center = self.view.center;
    [self.view addSubview:self.label];
    
}

@end
