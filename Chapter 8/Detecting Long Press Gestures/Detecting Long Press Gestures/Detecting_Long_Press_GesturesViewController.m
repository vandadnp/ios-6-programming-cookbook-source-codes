//
//  Detecting_Long_Press_GesturesViewController.m
//  Detecting Long Press Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Detecting_Long_Press_GesturesViewController.h"

@implementation Detecting_Long_Press_GesturesViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void) handleLongPressGestures:(UILongPressGestureRecognizer *)paramSender{
  
  /* Here we want to find the mid point of the two fingers
   that caused the long press gesture to be recognized. We configured
   this number using the numberOfTouchesRequired property of the
   UILongPressGestureRecognizer that we instantiated in the
   viewDidLoad instance method of this View Controller. If we
   find that another long press gesture recognizer is using this
   method as its target, we will ignore it */
  
  if ([paramSender isEqual:self.longPressGestureRecognizer]){
    
    if (paramSender.numberOfTouchesRequired == 2){
      
      CGPoint touchPoint1 = 
      [paramSender locationOfTouch:0
                            inView:paramSender.view];
      
      CGPoint touchPoint2 = 
      [paramSender locationOfTouch:1
                            inView:paramSender.view];
      
      CGFloat midPointX = (touchPoint1.x + touchPoint2.x) / 2.0f;
      CGFloat midPointY = (touchPoint1.y + touchPoint2.y) / 2.0f;
      
      CGPoint midPoint = CGPointMake(midPointX, midPointY);
      
      self.dummyButton.center = midPoint;
      
    } else {
      /* This is a long press gesture recognizer with more 
       or less than 2 fingers */
      
    }
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.dummyButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  self.dummyButton.frame = CGRectMake(0.0f,
                                      0.0f, 
                                      72.0f,
                                      37.0f);
  self.dummyButton.center = self.view.center;
  [self.view addSubview:self.dummyButton];
  
  /* First create the gesture recognizer */
  self.longPressGestureRecognizer = 
  [[UILongPressGestureRecognizer alloc] 
   initWithTarget:self
   action:@selector(handleLongPressGestures:)];
  
  /* The number of fingers that must be present on the screen */
  self.longPressGestureRecognizer.numberOfTouchesRequired = 2;
  
  /* Maximum 100 points of movement allowed before the gesture
   is recognized */
  self.longPressGestureRecognizer.allowableMovement = 100.0f;
  
  /* The user must press 2 fingers (numberOfTouchesRequired) for
   at least 1 second for the gesture to be recognized */
  self.longPressGestureRecognizer.minimumPressDuration = 1.0;
  
  /* Add this gesture recognizer to our view */
  [self.view addGestureRecognizer:self.longPressGestureRecognizer];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
