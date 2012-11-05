//
//  Loading_Web_Pages_with_UIWebViewViewController.m
//  Loading Web Pages with UIWebView
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Loading_Web_Pages_with_UIWebViewViewController.h"

@implementation Loading_Web_Pages_with_UIWebViewViewController

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
//  self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//  [self.view addSubview:self.myWebView];
//  
//  NSString *htmlString = @"iOS 6 Programming <strong>Cookbook</strong>";
//  
//  [self.myWebView loadHTMLString:htmlString
//                         baseURL:nil];  
//}

/* 2 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//  
//  self.view.backgroundColor = [UIColor whiteColor];
//  
//  self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
//  self.myWebView.scalesPageToFit = YES;
//  [self.view addSubview:self.myWebView];
//  
//  NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
//  NSURLRequest *request = [NSURLRequest requestWithURL:url];
//  
//  [self.myWebView loadRequest:request];
//  
//}

/* 3 */

- (void)webViewDidStartLoad:(UIWebView *)webView{
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
}

- (void)webViewDidFinishLoad:(UIWebView *)webView{
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error{
  [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.myWebView = [[UIWebView alloc] initWithFrame:self.view.bounds];
  self.myWebView.delegate = self;
  self.myWebView.scalesPageToFit = YES;
  [self.view addSubview:self.myWebView];
  
  NSURL *url = [NSURL URLWithString:@"http://www.apple.com"];
  NSURLRequest *request = [NSURLRequest requestWithURL:url];
  
  [self.myWebView loadRequest:request];
  
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
