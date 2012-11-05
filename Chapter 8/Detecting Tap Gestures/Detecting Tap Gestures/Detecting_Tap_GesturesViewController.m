//
//  Detecting_Tap_GesturesViewController.m
//  Detecting Tap Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Detecting_Tap_GesturesViewController.h"

@implementation Detecting_Tap_GesturesViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void) handleTaps:(UITapGestureRecognizer*)paramSender{
  
  NSUInteger touchCounter = 0;
  for (touchCounter = 0;
       touchCounter < paramSender.numberOfTouchesRequired;
       touchCounter++){
    CGPoint touchPoint = 
    [paramSender locationOfTouch:touchCounter 
                          inView:paramSender.view];
    NSLog(@"Touch #%lu: %@", 
          (unsigned long)touchCounter+1,
          NSStringFromCGPoint(touchPoint));
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  /* Create the Tap Gesture Recognizer */
  self.tapGestureRecognizer = [[UITapGestureRecognizer alloc] 
                               initWithTarget:self
                               action:@selector(handleTaps:)];
  
  /* The number of fingers that must be on the screen */
  self.tapGestureRecognizer.numberOfTouchesRequired = 2;
  
  /* The total number of taps to be performed before the 
   gesture is recognized */
  self.tapGestureRecognizer.numberOfTapsRequired = 3;
  
  /* Add this gesture recognizer to our view */
  [self.view addGestureRecognizer:self.tapGestureRecognizer];
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
