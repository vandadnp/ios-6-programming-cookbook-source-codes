//
//  Detecting_Long_Press_GesturesViewController.h
//  Detecting Long Press Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detecting_Long_Press_GesturesViewController : UIViewController

@property (nonatomic, strong)
  UILongPressGestureRecognizer *longPressGestureRecognizer;

@property (nonatomic, strong) UIButton *dummyButton;

@end
