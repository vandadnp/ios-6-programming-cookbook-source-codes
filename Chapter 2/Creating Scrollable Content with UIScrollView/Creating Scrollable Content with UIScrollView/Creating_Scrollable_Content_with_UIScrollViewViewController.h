//
//  Creating_Scrollable_Content_with_UIScrollViewViewController.h
//  Creating Scrollable Content with UIScrollView
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//
//@interface Creating_Scrollable_Content_with_UIScrollViewViewController
//           : UIViewController
//
//@property (nonatomic, strong) UIImageView *myImageView;
//@property (nonatomic, strong) UIScrollView *myScrollView;
//
//@end

/* 2 */
#import <UIKit/UIKit.h>

@interface Creating_Scrollable_Content_with_UIScrollViewViewController
           : UIViewController <UIScrollViewDelegate>

@property (nonatomic, strong) UIImageView *myImageView;
@property (nonatomic, strong) UIScrollView *myScrollView;

@end