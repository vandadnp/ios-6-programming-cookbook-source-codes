//
//  Detecting_Swipe_GesturesViewController.m
//  Detecting Swipe Gestures
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Detecting_Swipe_GesturesViewController.h"

@implementation Detecting_Swipe_GesturesViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void) handleSwipes:(UISwipeGestureRecognizer *)paramSender{
  
  if (paramSender.direction & UISwipeGestureRecognizerDirectionDown){
    NSLog(@"Swiped Down.");
  }
  if (paramSender.direction & UISwipeGestureRecognizerDirectionLeft){
    NSLog(@"Swiped Left.");
  }
  if (paramSender.direction & UISwipeGestureRecognizerDirectionRight){
    NSLog(@"Swiped Right.");
  }
  if (paramSender.direction & UISwipeGestureRecognizerDirectionUp){
    NSLog(@"Swiped Up.");
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  /* Instantiate our object */
  self.swipeGestureRecognizer = [[UISwipeGestureRecognizer alloc] 
                                 initWithTarget:self 
                                 action:@selector(handleSwipes:)];
  
  /* Swipes that are performed from right to 
   left are to be detected */
  self.swipeGestureRecognizer.direction = 
    UISwipeGestureRecognizerDirectionLeft;
  
  /* Just one finger needed */
  self.swipeGestureRecognizer.numberOfTouchesRequired = 1;
  
  /* Add it to the view */
  [self.view addGestureRecognizer:self.swipeGestureRecognizer];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
