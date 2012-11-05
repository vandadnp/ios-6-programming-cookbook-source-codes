//
//  ViewController.m
//  Constructing Resizable Images
//
//  Created by Vandad Nahavandipoor on 20/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UIButton *button;
@end

@implementation ViewController

- (void)viewDidLoad{
    [super viewDidLoad];
    
    /* Instantiate the button */
    self.button = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.button setFrame:CGRectMake(0.0f, 0.0f, 200.0f, 44.0f)];
    
    /* Set the title of the button */
    [self.button setTitle:@"Stretched Image on Button"
                 forState:UIControlStateNormal];
    
    /* Adjust the font for our text */
    self.button.titleLabel.font = [UIFont systemFontOfSize:15.0f];
    
    /* Construct the stretchable image */
    UIImage *image = [UIImage imageNamed:@"Button"];
    UIEdgeInsets edgeInsets;
    edgeInsets.left = 14.0f;
    edgeInsets.top = 0.0f;
    edgeInsets.right = 14.0f;
    edgeInsets.bottom = 0.0f;
    image = [image resizableImageWithCapInsets:edgeInsets];
    
    /* Set the background image of the button */
    [self.button setBackgroundImage:image forState:UIControlStateNormal];
    
    [self.view addSubview:self.button];
    self.button.center = self.view.center;
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}



@end
