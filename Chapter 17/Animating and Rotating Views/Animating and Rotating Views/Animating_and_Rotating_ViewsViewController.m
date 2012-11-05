//
//  Animating_and_Rotating_ViewsViewController.m
//  Animating and Rotating Views
//
//  Created by Vandad Nahavandipoor on 17/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Animating_and_Rotating_ViewsViewController.h"

@implementation Animating_and_Rotating_ViewsViewController

- (void) viewDidLoad{
  [super viewDidLoad];
  
  UIImage *xcodeImage = [UIImage imageNamed:@"Xcode.png"];
  
  self.xcodeImageView = [[UIImageView alloc]
                         initWithImage:xcodeImage];
  
  /* Just set the size to make the image smaller */
  [self.xcodeImageView setFrame:CGRectMake(0.0f,
                                           0.0f,
                                           100.0f,
                                           100.0f)];
  
  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.xcodeImageView];
  
}

- (void)clockwiseRotationStopped:(NSString *)paramAnimationID
                        finished:(NSNumber *)paramFinished
                         context:(void *)paramContext{
  
  [UIView beginAnimations:@"counterclockwiseAnimation"
                  context:NULL];
  
  /* 5 seconds long */
  [UIView setAnimationDuration:5.0f];
  
  /* Back to original rotation */
  self.xcodeImageView.transform = CGAffineTransformIdentity;
  
  [UIView commitAnimations];
  
}

- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
  
  self.xcodeImageView.center = self.view.center;
  
  /* Begin the animation */
  [UIView beginAnimations:@"clockwiseAnimation"
                  context:NULL];
  
  /* Make the animation 5 seconds long */
  [UIView setAnimationDuration:5.0f];
  
  [UIView setAnimationDelegate:self];
  
  [UIView setAnimationDidStopSelector:
   @selector(clockwiseRotationStopped:finished:context:)];
  
  /* Rotate the image view 90 degrees */
  self.xcodeImageView.transform =
  CGAffineTransformMakeRotation((90.0f * M_PI) / 180.0f);
  
  /* Commit the animation */
  [UIView commitAnimations];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
