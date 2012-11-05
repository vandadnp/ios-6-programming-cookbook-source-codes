//
//  ViewController.m
//  Customizing the UISlider
//
//  Created by Vandad Nahavandipoor on 20/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

/* 2 */
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISlider *slider;
@end

@implementation ViewController

/*
 This method returns a resizable image for the
 minimum track component of the slider
 */
- (UIImage *) minimumTrackImage{
    UIImage *result = [UIImage imageNamed:@"MinimumTrack"];
    UIEdgeInsets edgeInsets;
    edgeInsets.left = 4.0f;
    edgeInsets.top = 0.0f;
    edgeInsets.right = 0.0f;
    edgeInsets.bottom = 0.0f;
    result = [result resizableImageWithCapInsets:edgeInsets];
    return result;
}

/*
 Similar to the previous method, this one returns the resizable maximum
 track image for the slider
 */
- (UIImage *) maximumTrackImage{
    UIImage *result = [UIImage imageNamed:@"MaximumTrack"];
    UIEdgeInsets edgeInsets;
    edgeInsets.left = 0.0f;
    edgeInsets.top = 0.0f;
    edgeInsets.right = 3.0f;
    edgeInsets.bottom = 0.0f;
    result = [result resizableImageWithCapInsets:edgeInsets];
    return result;
}

- (void)viewDidLoad{
    [super viewDidLoad];
	
    /* Create  the slider */
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
                                                             0.0f,
                                                             218.0f,
                                                             23.0f)];
    self.slider.value = 0.5;
    self.slider.minimumValue = 0.0f;
    self.slider.maximumValue = 1.0f;
    self.slider.center = self.view.center;
    [self.view addSubview:self.slider];
    
    /* Change the minimum value image */
    [self.slider setMinimumValueImage:[UIImage imageNamed:@"MinimumValue"]];
    
    /* Change the minimum track image */
    [self.slider setMinimumTrackImage:[self minimumTrackImage]
                             forState:UIControlStateNormal];
    
    /* Change the thumb image for both untouched and touched states */
    [self.slider setThumbImage:[UIImage imageNamed:@"Thumb"]
                      forState:UIControlStateNormal];
    [self.slider setThumbImage:[UIImage imageNamed:@"Thumb"]
                      forState:UIControlStateHighlighted];
    
    /* Change the maximum track image */
    [self.slider setMaximumTrackImage:[self maximumTrackImage]
                             forState:UIControlStateNormal];
    
    /* Change the maximum value image */
    [self.slider setMaximumValueImage:[UIImage imageNamed:@"MaximumValue"]];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end


/* 1 */
//#import "ViewController.h"
//
//@interface ViewController ()
//@property (nonatomic, strong) UISlider *slider;
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//	
//    /* Create  the slider */
//    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(0.0f,
//                                                             0.0f,
//                                                             118.0f,
//                                                             23.0f)];
//    self.slider.value = 0.5;
//    self.slider.minimumValue = 0.0f;
//    self.slider.maximumValue = 1.0f;
//    self.slider.center = self.view.center;
//    [self.view addSubview:self.slider];
//    
//    /* Set the tint color of the minimum value */
//    self.slider.minimumTrackTintColor = [UIColor redColor];
//    
//    /* Set the tint color of the thumb */
//    self.slider.maximumTrackTintColor = [UIColor greenColor];
//    
//    /* Set the tint color of the maximum value */
//    self.slider.thumbTintColor = [UIColor blackColor];
//    
//}
//
//- (void)didReceiveMemoryWarning{
//    [super didReceiveMemoryWarning];
//}
//
//@end
