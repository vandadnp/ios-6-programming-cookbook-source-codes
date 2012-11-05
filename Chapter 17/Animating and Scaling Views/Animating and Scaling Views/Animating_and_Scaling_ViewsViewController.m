//
//  Animating_and_Scaling_ViewsViewController.m
//  Animating and Scaling Views
//
//  Created by Vandad Nahavandipoor on 17/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Animating_and_Scaling_ViewsViewController.h"

@implementation Animating_and_Scaling_ViewsViewController

@synthesize xcodeImageView;

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

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

- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
  
  /* Place the image view at the center of the view of this view controller */
  self.xcodeImageView.center = self.view.center;
  
  /* Make sure no translation is applied to this image view */
  self.xcodeImageView.transform = CGAffineTransformIdentity;
  
  /* Begin the animation */
  [UIView beginAnimations:nil
                  context:NULL];
  
  /* Make the animation 5 seconds long */
  [UIView setAnimationDuration:5.0f];
  
  /* Make the image view twice as large in
   width and height */
  self.xcodeImageView.transform = CGAffineTransformMakeScale(2.0f,
                                                             2.0f);
  
  /* Commit the animation */
  [UIView commitAnimations];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
