//
//  Detecting_Pinch_GesturesViewController.h
//  Detecting Pinch Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detecting_Pinch_GesturesViewController : UIViewController

@property (nonatomic, strong) 
  UIPinchGestureRecognizer *pinchGestureRecognizer;

@property (nonatomic, strong) UILabel *myBlackLabel;

@property (nonatomic, unsafe_unretained) CGFloat currentScale;

@end
