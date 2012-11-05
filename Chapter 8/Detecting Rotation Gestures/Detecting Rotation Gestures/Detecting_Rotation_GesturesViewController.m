//
//  Detecting_Rotation_GesturesViewController.m
//  Detecting Rotation Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Detecting_Rotation_GesturesViewController.h"

@implementation Detecting_Rotation_GesturesViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void) handleRotations:(UIRotationGestureRecognizer *)paramSender{
  
  if (self.helloWorldLabel == nil){
    return;
  }
  
  /* Take the previous rotation and add the current rotation to it */
  self.helloWorldLabel.transform = 
  CGAffineTransformMakeRotation(self.rotationAngleInRadians +
                                paramSender.rotation);
  
  /* At the end of the rotation, keep the angle for later use */
  if (paramSender.state == UIGestureRecognizerStateEnded){
    self.rotationAngleInRadians += paramSender.rotation;
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.helloWorldLabel = [[UILabel alloc] initWithFrame:CGRectZero];
  self.helloWorldLabel.text = @"Hello, World!";
  self.helloWorldLabel.font = [UIFont systemFontOfSize:16.0f];
  [self.helloWorldLabel sizeToFit];
  self.helloWorldLabel.center = self.view.center;
  [self.view addSubview:self.helloWorldLabel];
  
  self.rotationGestureRecognizer = [[UIRotationGestureRecognizer alloc] 
                                    initWithTarget:self
                                    action:@selector(handleRotations:)];
  
  [self.view addGestureRecognizer:self.rotationGestureRecognizer];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
