//
//  ViewController.m
//  Constructing and Displaying Attributed Texts
//
//  Created by Vandad Nahavandipoor on 23/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UILabel *label;
@end

@implementation ViewController

- (NSAttributedString *) attributedText{
    
    NSString *string = @"iOS SDK";
    
    NSMutableAttributedString *result = [[NSMutableAttributedString alloc]
                                         initWithString:string];
    
    NSDictionary *attributesForFirstWord = @{
        NSFontAttributeName : [UIFont boldSystemFontOfSize:60.0f],
        NSForegroundColorAttributeName : [UIColor redColor],
        NSBackgroundColorAttributeName : [UIColor blackColor]
    };
    
    NSShadow *shadow = [[NSShadow alloc] init];
    shadow.shadowColor = [UIColor darkGrayColor];
    shadow.shadowOffset = CGSizeMake(4.0f, 4.0f);
    
    NSDictionary *attributesForSecondWord = @{
        NSFontAttributeName : [UIFont boldSystemFontOfSize:60.0f],
        NSForegroundColorAttributeName : [UIColor whiteColor],
        NSBackgroundColorAttributeName : [UIColor redColor],
        NSShadowAttributeName : shadow
    };
    
    /* Find the string "iOS" in the whole string and sets its attribute */
    [result setAttributes:attributesForFirstWord
                    range:[string rangeOfString:@"iOS"]];
    
    /* Do the same thing for the string "SDK" */
    [result setAttributes:attributesForSecondWord
                    range:[string rangeOfString:@"SDK"]];
    
    return [[NSAttributedString alloc] initWithAttributedString:result];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    self.label = [[UILabel alloc] init];
    self.label.backgroundColor = [UIColor clearColor];
    self.label.attributedText = [self attributedText];
    [self.label sizeToFit];
    self.label.center = self.view.center;
    [self.view addSubview:self.label];
    
}

@end