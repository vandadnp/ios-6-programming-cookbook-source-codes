//
//  ViewController.m
//  Listening and Reacting to Keyboard Notifications
//
//  Created by Vandad Nahavandipoor on 23/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import "ViewController.h"
//
//@implementation ViewController
//
//- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
//  return 1;
//}
//
//- (NSInteger) tableView:(UITableView *)tableView 
//  numberOfRowsInSection:(NSInteger)section{
//  return 100;
//}
//
//- (UITableViewCell *) tableView:(UITableView *)tableView 
//          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
//  
//  UITableViewCell *result = nil;
//  
//  static NSString *CellIdentifier = @"CellIdentifier";
//  
//  result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
//  
//  if (result == nil){
//    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
//                                    reuseIdentifier:CellIdentifier];
//  }
//  
//  result.textLabel.text = [NSString stringWithFormat:
//                           @"Cell %ld", (long)indexPath.row];
//  
//  CGRect accessoryRect = CGRectMake(0.0f,
//                                    0.0f,
//                                    150.0f,
//                                    31.0f);
//  
//  UITextField *accesssory = [[UITextField alloc] initWithFrame:accessoryRect];
//  accesssory.borderStyle = UITextBorderStyleRoundedRect;
//  accesssory.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
//  accesssory.placeholder = @"Enter Text";
//  result.accessoryView = accesssory;
//  
//  return result;
//  
//}
//
//- (void)viewDidLoad{
//  [super viewDidLoad];
//
//  self.myTableView = [[UITableView alloc] 
//                      initWithFrame:self.view.bounds
//                      style:UITableViewStyleGrouped];
//  
//  self.myTableView.delegate = self;
//  self.myTableView.dataSource = self;
//  [self.view addSubview:self.myTableView];
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
#import "ViewController.h"
//#import <CoreGraphics/CoreGraphics.h>

@implementation ViewController

- (BOOL)textFieldShouldReturn:(UITextField *)textField{
  /* Make sure the Done button on the keyboard for each text field
   (accessory views of each cell) dismisses the keyboard */
  [textField resignFirstResponder];
  return YES;
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
  return 1;
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  return 100;
}

- (UITableViewCell *) tableView:(UITableView *)tableView 
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *result = nil;
  
  static NSString *CellIdentifier = @"CellIdentifier";
  
  result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (result == nil){
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:CellIdentifier];
    result.selectionStyle = UITableViewCellSelectionStyleNone;
  }
  
  result.textLabel.text = [NSString stringWithFormat:
                           @"Cell %ld", (long)indexPath.row];
  
  CGRect accessoryRect = CGRectMake(0.0f,
                                    0.0f,
                                    150.0f,
                                    31.0f);
  
  UITextField *accesssory = [[UITextField alloc] initWithFrame:accessoryRect];
  accesssory.borderStyle = UITextBorderStyleRoundedRect;
  accesssory.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
  accesssory.placeholder = @"Enter Text";
  accesssory.delegate = self;
  result.accessoryView = accesssory;
  
  return result;
  
}

- (void) handleKeyboardWillHide:(NSNotification *)paramNotification{
  
  if (UIEdgeInsetsEqualToEdgeInsets(self.myTableView.contentInset, 
                                    UIEdgeInsetsZero)){
    /* Our table view's content inset is intact so no need to reset it */
    return;
  }
  
  NSDictionary *userInfo = [paramNotification userInfo];
  
  NSValue *animationCurveObject = 
  [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
  
  NSValue *animationDurationObject =
  [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
  
  NSValue *keyboardEndRectObject = 
  [userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
  
  NSUInteger animationCurve = 0;
  double animationDuration = 0.0f;
  CGRect keyboardEndRect = CGRectMake(0, 0, 0, 0);
  
  [animationCurveObject getValue:&animationCurve];
  [animationDurationObject getValue:&animationDuration];
  [keyboardEndRectObject getValue:&keyboardEndRect];
  
  [UIView beginAnimations:@"changeTableViewContentInset"
                  context:NULL];
  [UIView setAnimationDuration:animationDuration];
  [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
  
  self.myTableView.contentInset = UIEdgeInsetsZero;
  
  [UIView commitAnimations];
  
}

/* 1 */
//- (void) handleKeyboardWillShow:(NSNotification *)paramNotification{
//  
//  NSDictionary *userInfo = [paramNotification userInfo];
//  
//  NSValue *animationCurveObject = 
//    [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
//  
//  NSValue *animationDurationObject =
//    [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
//  
//  NSValue *keyboardEndRectObject = 
//    [userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
//  
//  NSUInteger animationCurve = 0;
//  double animationDuration = 0.0f;
//  CGRect keyboardEndRect = CGRectMake(0, 0, 0, 0);
//  
//  [animationCurveObject getValue:&animationCurve];
//  [animationDurationObject getValue:&animationDuration];
//  [keyboardEndRectObject getValue:&keyboardEndRect];
//  
//  [UIView beginAnimations:@"changeTableViewContentInset"
//                  context:NULL];
//  [UIView setAnimationDuration:animationDuration];
//  [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
//  
//  UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
//  
//  CGRect intersectionOfKeyboardRectAndWindowRect =
//    CGRectIntersection(window.frame, keyboardEndRect);
//  
//  CGFloat bottomInset = intersectionOfKeyboardRectAndWindowRect.size.height;
//  
//  self.myTableView.contentInset = UIEdgeInsetsMake(0.0f,
//                                                   0.0f,
//                                                   bottomInset,
//                                                   0.0f);
//  
//  NSIndexPath *indexPathOfOwnerCell = nil;
//  /* Also, make sure the selected text field is visible on the screen */
//  NSInteger numberOfCells = [self.myTableView.dataSource 
//                             tableView:self.myTableView
//                             numberOfRowsInSection:0];
//  
//  /* So let's go through all the cells and find their accessory text fields.
//   Once we have the refernece to those text fields, we can see which one of
//   them is the first responder (has the keyboard) and we will make a call
//   to the table view to make sure after the keyboard is displayed,
//   that specific cell is NOT obstructed by the keyboard */
//  for (NSInteger counter = 0;
//       counter < numberOfCells;
//       counter++){
//    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:counter
//                                                inSection:0];
//    UITableViewCell *cell = [self.myTableView cellForRowAtIndexPath:indexPath];
//    UITextField *textField = (UITextField *)cell.accessoryView;
//    if ([textField isKindOfClass:[UITextField class]] == NO){
//      continue;
//    }
//    if ([textField isFirstResponder]){
//      indexPathOfOwnerCell = indexPath;
//      break;
//    }
//  }
//  
//  [UIView commitAnimations];
//  
//  if (indexPathOfOwnerCell != nil){
//    [self.myTableView scrollToRowAtIndexPath:indexPathOfOwnerCell
//                            atScrollPosition:UITableViewScrollPositionMiddle
//                                    animated:YES];
//  }
//
//}

/* 2 */
- (void) handleKeyboardWillShow:(NSNotification *)paramNotification{
  
  NSDictionary *userInfo = [paramNotification userInfo];
  
  NSValue *animationCurveObject = 
  [userInfo valueForKey:UIKeyboardAnimationCurveUserInfoKey];
  
  NSValue *animationDurationObject =
  [userInfo valueForKey:UIKeyboardAnimationDurationUserInfoKey];
  
  NSValue *keyboardEndRectObject = 
  [userInfo valueForKey:UIKeyboardFrameEndUserInfoKey];
  
  NSUInteger animationCurve = 0;
  double animationDuration = 0.0f;
  CGRect keyboardEndRect = CGRectMake(0, 0, 0, 0);
  
  [animationCurveObject getValue:&animationCurve];
  [animationDurationObject getValue:&animationDuration];
  [keyboardEndRectObject getValue:&keyboardEndRect];
  
  UIWindow *window = [[[UIApplication sharedApplication] delegate] window];
  
  /* Convert the frame from window's coordinate system to
   our view's coordinate system */
  keyboardEndRect = [self.view convertRect:keyboardEndRect
                                  fromView:window];
  
  [UIView beginAnimations:@"changeTableViewContentInset"
                  context:NULL];
  [UIView setAnimationDuration:animationDuration];
  [UIView setAnimationCurve:(UIViewAnimationCurve)animationCurve];
  
  CGRect intersectionOfKeyboardRectAndWindowRect =
  CGRectIntersection(window.frame, keyboardEndRect);
  
  CGFloat bottomInset = intersectionOfKeyboardRectAndWindowRect.size.height;
  
  self.myTableView.contentInset = UIEdgeInsetsMake(0.0f,
                                                   0.0f,
                                                   bottomInset,
                                                   0.0f);
  
  NSIndexPath *indexPathOfOwnerCell = nil;
  /* Also, make sure the selected text field is visible on the screen */
  NSInteger numberOfCells = [self.myTableView.dataSource 
                             tableView:self.myTableView
                             numberOfRowsInSection:0];
  
  /* So let's go through all the cells and find their accessory text fields.
   Once we have the refernece to those text fields, we can see which one of
   them is the first responder (has the keyboard) and we will make a call
   to the table view to make sure after the keyboard is displayed,
   that specific cell is NOT obstructed by the keyboard */
  for (NSInteger counter = 0;
       counter < numberOfCells;
       counter++){
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:counter
                                                inSection:0];
    UITableViewCell *cell = [self.myTableView cellForRowAtIndexPath:indexPath];
    UITextField *textField = (UITextField *)cell.accessoryView;
    if ([textField isKindOfClass:[UITextField class]] == NO){
      continue;
    }
    if ([textField isFirstResponder]){
      indexPathOfOwnerCell = indexPath;
      break;
    }
  }
  
  [UIView commitAnimations];
  
  if (indexPathOfOwnerCell != nil){
    [self.myTableView scrollToRowAtIndexPath:indexPathOfOwnerCell
                            atScrollPosition:UITableViewScrollPositionMiddle
                                    animated:YES];
  }
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.myTableView = [[UITableView alloc] 
                      initWithFrame:self.view.bounds
                      style:UITableViewStyleGrouped];
  
  self.myTableView.delegate = self;
  self.myTableView.dataSource = self;
  self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                      UIViewAutoresizingFlexibleHeight;
  [self.view addSubview:self.myTableView];
  
}

- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
  
  NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
  
  [center addObserver:self
             selector:@selector(handleKeyboardWillShow:)
                 name:UIKeyboardWillShowNotification
               object:nil];
  [center addObserver:self
             selector:@selector(handleKeyboardWillHide:)
                 name:UIKeyboardWillHideNotification
               object:nil];
  
}

- (void) viewDidDisappear:(BOOL)paramAnimated{
  [super viewDidDisappear:paramAnimated];
  [[NSNotificationCenter defaultCenter] removeObserver:self];
}

- (BOOL)shouldAutorotateToInterfaceOrientation
  :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
