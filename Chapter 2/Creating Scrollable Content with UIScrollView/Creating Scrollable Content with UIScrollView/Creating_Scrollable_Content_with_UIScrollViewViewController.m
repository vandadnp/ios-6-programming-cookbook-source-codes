//
//  Creating_Scrollable_Content_with_UIScrollViewViewController.m
//  Creating Scrollable Content with UIScrollView
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Creating_Scrollable_Content_with_UIScrollViewViewController.h"

@implementation Creating_Scrollable_Content_with_UIScrollViewViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir.png"];
//  self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//  self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//  [self.myScrollView addSubview:self.myImageView];
//  self.myScrollView.contentSize = self.myImageView.bounds.size;
//  [self.view addSubview:self.myScrollView];
//  
//}

/* 2 */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//  /* Gets called when user scrolls or drags */
//  self.myScrollView.alpha = 0.50f;
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//  /* Gets called only after scrolling */
//  self.myScrollView.alpha = 1.0f;
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView 
//                  willDecelerate:(BOOL)decelerate{
//  /* Make sure the alpha is reset even if the user is dragging */
//  self.myScrollView.alpha = 1.0f;
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir.png"];
//  self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//  self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//  [self.myScrollView addSubview:self.myImageView];
//  self.myScrollView.contentSize = self.myImageView.bounds.size;
//  self.myScrollView.delegate = self;
//  [self.view addSubview:self.myScrollView];
//  
//}

/* 3 */
//- (void)scrollViewDidScroll:(UIScrollView *)scrollView{
//  /* Gets called when user scrolls or drags */
//  self.myScrollView.alpha = 0.50f;
//}
//
//- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
//  /* Gets called only after scrolling */
//  self.myScrollView.alpha = 1.0f;
//}
//
//- (void)scrollViewDidEndDragging:(UIScrollView *)scrollView 
//                  willDecelerate:(BOOL)decelerate{
//  /* Make sure the alpha is reset even if the user is dragging */
//  self.myScrollView.alpha = 1.0f;
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  UIImage *imageToLoad = [UIImage imageNamed:@"MacBookAir.png"];
//  self.myImageView = [[UIImageView alloc] initWithImage:imageToLoad];
//  self.myScrollView = [[UIScrollView alloc] initWithFrame:self.view.bounds];
//  [self.myScrollView addSubview:self.myImageView];
//  self.myScrollView.contentSize = self.myImageView.bounds.size;
//  self.myScrollView.delegate = self;
//  self.myScrollView.indicatorStyle = UIScrollViewIndicatorStyleWhite;
//  [self.view addSubview:self.myScrollView];
//  
//}

- (UIImageView *) newImageViewWithImage:(UIImage *)paramImage
                                  frame:(CGRect)paramFrame{
  
  UIImageView *result = [[UIImageView alloc] initWithFrame:paramFrame];
  result.contentMode = UIViewContentModeScaleAspectFit;
  result.image = paramImage;
  return result;
  
}

/* 4 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  UIImage *iPhone = [UIImage imageNamed:@"iPhone.png"];
  UIImage *iPad = [UIImage imageNamed:@"iPad.png"];
  UIImage *macBookAir = [UIImage imageNamed:@"MacBookAir.png"];
  
  CGRect scrollViewRect = self.view.bounds;
  
  self.myScrollView = [[UIScrollView alloc] initWithFrame:scrollViewRect];
  self.myScrollView.pagingEnabled = YES;
  self.myScrollView.contentSize = CGSizeMake(scrollViewRect.size.width * 3.0f,
                                             scrollViewRect.size.height);
  [self.view addSubview:self.myScrollView];
  
  CGRect imageViewRect = self.view.bounds;
  UIImageView *iPhoneImageView = [self newImageViewWithImage:iPhone
                                                       frame:imageViewRect];
  [self.myScrollView addSubview:iPhoneImageView];
  
  /* Go to next page by moving the x position of the next image view */
  imageViewRect.origin.x += imageViewRect.size.width;
  UIImageView *iPadImageView = [self newImageViewWithImage:iPad
                                                     frame:imageViewRect];
  [self.myScrollView addSubview:iPadImageView];
  
  /* Go to next page by moving the x position of the next image view */
  imageViewRect.origin.x += imageViewRect.size.width;
  UIImageView *macBookAirImageView = 
    [self newImageViewWithImage:macBookAir
                          frame:imageViewRect];
  [self.myScrollView addSubview:macBookAirImageView];
  
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
  [super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
  [super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
