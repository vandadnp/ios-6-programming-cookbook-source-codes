//
//  Detecting_Pinch_GesturesViewController.m
//  Detecting Pinch Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Detecting_Pinch_GesturesViewController.h"

@implementation Detecting_Pinch_GesturesViewController

- (void) handlePinches:(UIPinchGestureRecognizer*)paramSender{
  
  if (paramSender.state == UIGestureRecognizerStateEnded){
    self.currentScale = paramSender.scale;
  } else if (paramSender.state == UIGestureRecognizerStateBegan &&
             self.currentScale != 0.0f){
    paramSender.scale = self.currentScale;
  }
  
  if (paramSender.scale != NAN &&
      paramSender.scale != 0.0){
    paramSender.view.transform = 
    CGAffineTransformMakeScale(paramSender.scale, 
                               paramSender.scale);
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  CGRect labelRect = CGRectMake(0.0f,     /* X */
                                0.0f,     /* Y */
                                200.0f,   /* Width */
                                200.0f);  /* Height */  
  
  self.myBlackLabel = [[UILabel alloc] initWithFrame:labelRect];
  self.myBlackLabel.center = self.view.center;
  self.myBlackLabel.backgroundColor = [UIColor blackColor];
  
  /* Without this line, our pinch gesture recognizer
   will not work */
  self.myBlackLabel.userInteractionEnabled = YES;
  [self.view addSubview:self.myBlackLabel];
  
  /* Create the Pinch Gesture Recognizer */
  self.pinchGestureRecognizer =  [[UIPinchGestureRecognizer alloc] 
                                  initWithTarget:self
                                  action:@selector(handlePinches:)];
  
  /* Add this gesture recognizer to our view */
  [self.myBlackLabel 
   addGestureRecognizer:self.pinchGestureRecognizer];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
