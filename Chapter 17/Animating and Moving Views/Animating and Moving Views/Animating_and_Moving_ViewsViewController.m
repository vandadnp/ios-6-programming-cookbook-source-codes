//
//  Animating_and_Moving_ViewsViewController.m
//  Animating and Moving Views
//
//  Created by Vandad Nahavandipoor on 17/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import "Animating_and_Moving_ViewsViewController.h"
//
//@implementation Animating_and_Moving_ViewsViewController
//
//- (void) viewDidLoad{
//  [super viewDidLoad];
//  
//  UIImage *xcodeImage = [UIImage imageNamed:@"Xcode.png"];
//  
//  self.xcodeImageView = [[UIImageView alloc]
//                         initWithImage:xcodeImage];
//  
//  /* Just set the size to make the image smaller */
//  [self.xcodeImageView setFrame:CGRectMake(0.0f,
//                                           0.0f,
//                                           100.0f,
//                                           100.0f)];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  [self.view addSubview:self.xcodeImageView];
//  
//}
//
//- (void)imageViewDidStop:(NSString *)paramAnimationID
//                finished:(NSNumber *)paramFinished
//                 context:(void *)paramContext{
//  
//  NSLog(@"Animation finished.");
//  
//  NSLog(@"Animation ID = %@", paramAnimationID);
//  
//  UIImageView *contextImageView = (__bridge UIImageView *)paramContext;
//  NSLog(@"Image View = %@", contextImageView);
//  
//}
//
//- (void) viewDidAppear:(BOOL)paramAnimated{
//  
//  [super viewDidAppear:paramAnimated];
//  
//  /* Start from top left corner */
//  [self.xcodeImageView setFrame:CGRectMake(0.0f,
//                                           0.0f,
//                                           100.0f,
//                                           100.0f)];
//  
//  [UIView beginAnimations:@"xcodeImageViewAnimation"
//                  context:(__bridge void *)self.xcodeImageView];
//  
//  /* 5 seconds animation */
//  [UIView setAnimationDuration:5.0f];
//  
//  /* Receive animation delegates */
//  [UIView setAnimationDelegate:self];
//  
//  [UIView setAnimationDidStopSelector:
//   @selector(imageViewDidStop:finished:context:)];
//  
//  /* End at the bottom right corner */
//  [self.xcodeImageView setFrame:CGRectMake(200.0f,
//                                           350.0f,
//                                           100.0f,
//                                           100.0f)];
//  
//  [UIView commitAnimations];
//  
//}
//
//- (BOOL)shouldAutorotateToInterfaceOrientation
//        :(UIInterfaceOrientation)interfaceOrientation{
//  return YES;
//}
//
//@end

/* 2 */
#import "Animating_and_Moving_ViewsViewController.h"

@implementation Animating_and_Moving_ViewsViewController

- (void)imageViewDidStop:(NSString *)paramAnimationID
                finished:(NSNumber *)paramFinished
                 context:(void *)paramContext{
  
  UIImageView *contextImageView = (__bridge UIImageView *)paramContext;
  [contextImageView removeFromSuperview];
  
}

- (void) startBottomRightViewAnimationAfterDelay:(CGFloat)paramDelay{
  
  /* Start from bottom right corner */
  [self.xcodeImageView2 setFrame:CGRectMake(220.0f,
                                            350.0f,
                                            100.0f,
                                            100.0f)];
  
  [self.xcodeImageView2 setAlpha:1.0f];
  
  [UIView beginAnimations:@"xcodeImageView2Animation"
                  context:(__bridge void *)self.xcodeImageView2];
  
  /* 3 seconds animation */
  [UIView setAnimationDuration:3.0f];
  
  [UIView setAnimationDelay:paramDelay];
  
  /* Receive animation delegates */
  [UIView setAnimationDelegate:self];
  
  [UIView setAnimationDidStopSelector:
   @selector(imageViewDidStop:finished:context:)];
  
  /* End at the top left corner */
  [self.xcodeImageView2 setFrame:CGRectMake(0.0f,
                                            0.0f,
                                            100.0f,
                                            100.0f)];
  
  [self.xcodeImageView2 setAlpha:0.0f];
  
  [UIView commitAnimations];
  
}

- (void) startTopLeftImageViewAnimation{
  
  /* Start from top left corner */
  [self.xcodeImageView1 setFrame:CGRectMake(0.0f,
                                            0.0f,
                                            100.0f,
                                            100.0f)];
  
  [self.xcodeImageView1 setAlpha:1.0f];
  
  [UIView beginAnimations:@"xcodeImageView1Animation"
                  context:(__bridge void *)self.xcodeImageView1];
  
  /* 3 seconds animation */
  [UIView setAnimationDuration:3.0f];
  
  /* Receive animation delegates */
  [UIView setAnimationDelegate:self];
  
  [UIView setAnimationDidStopSelector:
   @selector(imageViewDidStop:finished:context:)];
  
  /* End at the bottom right corner */
  [self.xcodeImageView1 setFrame:CGRectMake(220.0f,
                                            350.0f,
                                            100.0f,
                                            100.0f)];
  
  [self.xcodeImageView1 setAlpha:0.0f];
  
  [UIView commitAnimations];
  
}

- (void) viewDidLoad{
  [super viewDidLoad];
  
  UIImage *xcodeImage = [UIImage imageNamed:@"Xcode.png"];
  
  self.xcodeImageView1 = [[UIImageView alloc]
                          initWithImage:xcodeImage];
  
  self.xcodeImageView2 = [[UIImageView alloc]
                          initWithImage:xcodeImage];
  
  /* Just set the size to make the images smaller */
  [xcodeImageView1 setFrame:CGRectMake(0.0f,
                                       0.0f,
                                       100.0f,
                                       100.0f)];
  
  [xcodeImageView2 setFrame:CGRectMake(220.0f,
                                       350.0f,
                                       100.0f,
                                       100.0f)];
  
  
  self.view.backgroundColor = [UIColor whiteColor];
  [self.view addSubview:self.xcodeImageView1];
  [self.view addSubview:self.xcodeImageView2];
  
}

- (void) viewDidAppear:(BOOL)paramAnimated{
  
  [super viewDidAppear:paramAnimated];
  [self startTopLeftImageViewAnimation];
  [self startBottomRightViewAnimationAfterDelay:2.0f];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
:(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end