//
//  Detecting_Panning_and_Dragging_GesturesViewController.h
//  Detecting Panning and Dragging Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detecting_Panning_and_Dragging_GesturesViewController
           : UIViewController

@property (nonatomic, strong) UIPanGestureRecognizer *panGestureRecognizer;
@property (nonatomic, strong) UILabel *helloWorldLabel;

@end
