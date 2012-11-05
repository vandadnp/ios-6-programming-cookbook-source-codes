//
//  Detecting_Rotation_GesturesViewController.h
//  Detecting Rotation Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Detecting_Rotation_GesturesViewController : UIViewController

@property (nonatomic, strong)
  UIRotationGestureRecognizer *rotationGestureRecognizer;

@property (nonatomic, strong)
  UILabel *helloWorldLabel;

/* We can remove the nonatomic and the unsafe_unretained marks from this
 property declaration. On a float value, the compiler will generate both
 these for us automatically */
@property (nonatomic, unsafe_unretained)
  CGFloat rotationAngleInRadians;

@end
