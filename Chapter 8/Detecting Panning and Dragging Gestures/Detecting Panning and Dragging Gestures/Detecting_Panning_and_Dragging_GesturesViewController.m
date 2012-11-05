//
//  Detecting_Panning_and_Dragging_GesturesViewController.m
//  Detecting Panning and Dragging Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Detecting_Panning_and_Dragging_GesturesViewController.h"

@implementation Detecting_Panning_and_Dragging_GesturesViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void) handlePanGestures:(UIPanGestureRecognizer*)paramSender{
  
  if (paramSender.state != UIGestureRecognizerStateEnded &&
      paramSender.state != UIGestureRecognizerStateFailed){
    CGPoint location = [paramSender locationInView:paramSender.view.superview];
    paramSender.view.center = location;
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  /* Let's first create a label */
  CGRect labelFrame = CGRectMake(0.0f,    /* X */
                                 0.0f,    /* Y */
                                 150.0f,  /* Width */
                                 100.0f); /* Height */
  
  self.helloWorldLabel = [[UILabel alloc] initWithFrame:labelFrame];
  self.helloWorldLabel.text = @"Hello World";
  self.helloWorldLabel.backgroundColor = [UIColor blackColor];
  self.helloWorldLabel.textColor = [UIColor whiteColor];
  self.helloWorldLabel.textAlignment = UITextAlignmentCenter;
  
  /* Make sure to enable user interaction; otherwise, tap events
   won't be caught on this label */
  self.helloWorldLabel.userInteractionEnabled = YES;
  
  /* And now make sure this label gets displayed on our view */
  [self.view addSubview:self.helloWorldLabel];
  
  /* Create the Pan Gesture Recognizer */
  self.panGestureRecognizer = [[UIPanGestureRecognizer alloc] 
                               initWithTarget:self
                               action:@selector(handlePanGestures:)];
  
  /* At least and at most we need only one finger to activate
   the pan gesture recognizer */
  self.panGestureRecognizer.minimumNumberOfTouches = 1;
  self.panGestureRecognizer.maximumNumberOfTouches = 1;
  
  /* Add it to our view */
  [self.helloWorldLabel addGestureRecognizer:self.panGestureRecognizer];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
