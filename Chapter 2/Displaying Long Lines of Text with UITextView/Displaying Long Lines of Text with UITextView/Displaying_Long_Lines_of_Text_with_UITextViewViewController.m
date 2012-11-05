//
//  Displaying_Long_Lines_of_Text_with_UITextViewViewController.m
//  Displaying Long Lines of Text with UITextView
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Long_Lines_of_Text_with_UITextViewViewController.h"

@implementation Displaying_Long_Lines_of_Text_with_UITextViewViewController

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
//  self.myTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
//  self.myTextView.text = @"Some text here...";
//  self.myTextView.font = [UIFont systemFontOfSize:16.0f];
//  [self.view addSubview:self.myTextView];
//  
//}

/* 2 */
- (void) handleKeyboardDidShow:(NSNotification *)paramNotification{
  
  /* Get the frame of the keyboard */
  NSValue *keyboardRectAsObject = 
    [[paramNotification userInfo]
     objectForKey:UIKeyboardFrameEndUserInfoKey];
  
  /* Place it in a CGRect */
  CGRect keyboardRect;
  
  [keyboardRectAsObject getValue:&keyboardRect];
  
  /* Give a bottom margin to our text view that makes it 
   reach to the top of the keyboard */
  self.myTextView.contentInset = 
    UIEdgeInsetsMake(0.0f,
                     0.0f, 
                     keyboardRect.size.height,
                     0.0f);
}

- (void) handleKeyboardWillHide:(NSNotification *)paramNotification{
  /* Make the text view as big as the whole view again */
  self.myTextView.contentInset = UIEdgeInsetsZero;
}

- (void) viewWillAppear:(BOOL)paramAnimated{
  [super viewWillAppear:paramAnimated];
  
  [[NSNotificationCenter defaultCenter] 
    addObserver:self
       selector:@selector(handleKeyboardDidShow:)
           name:UIKeyboardDidShowNotification
         object:nil];
  
  [[NSNotificationCenter defaultCenter]
    addObserver:self
       selector:@selector(handleKeyboardWillHide:)
           name:UIKeyboardWillHideNotification
         object:nil];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.myTextView = [[UITextView alloc] initWithFrame:self.view.bounds];
  self.myTextView.text = @"Some text here...";
  self.myTextView.font = [UIFont systemFontOfSize:16.0f];
  [self.view addSubview:self.myTextView];
  
}

- (void) viewWillDisappear:(BOOL)paramAnimated{
  [super viewWillDisappear:paramAnimated];
  
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
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
