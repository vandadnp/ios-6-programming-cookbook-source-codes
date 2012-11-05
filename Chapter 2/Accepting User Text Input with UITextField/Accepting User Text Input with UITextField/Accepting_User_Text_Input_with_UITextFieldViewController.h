//
//  Accepting_User_Text_Input_with_UITextFieldViewController.h
//  Accepting User Text Input with UITextField
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//
//@interface Accepting_User_Text_Input_with_UITextFieldViewController 
//           : UIViewController
//
//@property (nonatomic, strong) UITextField *myTextField;
//
//@end

/* 2 */
//#import <UIKit/UIKit.h>
//
//@interface Accepting_User_Text_Input_with_UITextFieldViewController 
//           : UIViewController <UITextFieldDelegate>
//
//@property (nonatomic, strong) UITextField *myTextField;
//
//@end

/* 3 */
#import <UIKit/UIKit.h>

@interface Accepting_User_Text_Input_with_UITextFieldViewController 
           : UIViewController <UITextFieldDelegate>

@property (nonatomic, strong) UITextField *myTextField;
@property (nonatomic, strong) UILabel *labelCounter;

@end
