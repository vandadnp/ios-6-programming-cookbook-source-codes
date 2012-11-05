//
//  Loading_Web_Pages_with_UIWebViewViewController.h
//  Loading Web Pages with UIWebView
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//
//@interface Loading_Web_Pages_with_UIWebViewViewController 
//           : UIViewController
//
//@property (nonatomic, strong) UIWebView *myWebView;
//
//@end

/* 2 */
#import <UIKit/UIKit.h>

@interface Loading_Web_Pages_with_UIWebViewViewController 
           : UIViewController <UIWebViewDelegate>

@property (nonatomic, strong) UIWebView *myWebView;

@end
