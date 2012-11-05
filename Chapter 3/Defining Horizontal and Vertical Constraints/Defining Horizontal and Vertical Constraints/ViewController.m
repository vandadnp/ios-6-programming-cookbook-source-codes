//
//  ViewController.m
//  Defining Horizontal and Vertical Constraints
//
//  Created by Vandad Nahavandipoor on 16/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

/* Email Text Field Constraints */
NSString *const kEmailTextFieldHorizontal = @"H:|-[_textFieldEmail]-|";
NSString *const kEmailTextFieldVertical = @"V:|-[_textFieldEmail]";

/* Confirm Email Text Field Constraints */
NSString *const kConfirmEmailHorizontal = @"H:|-[_textFieldConfirmEmail]-|";
NSString *const kConfirmEmailVertical =
                @"V:[_textFieldEmail]-[_textFieldConfirmEmail]";

/* Register Button Constraint */
NSString *const kRegisterVertical =
                @"V:[_textFieldConfirmEmail]-[_registerButton]";


@interface ViewController ()
@property (nonatomic, strong) UITextField *textFieldEmail;
@property (nonatomic, strong) UITextField *textFieldConfirmEmail;
@property (nonatomic, strong) UIButton *registerButton;
@end


@implementation ViewController

- (UITextField *) textFieldWithPlaceholder:(NSString *)paramPlaceholder{
    
    UITextField *result = [[UITextField alloc] init];
    result.translatesAutoresizingMaskIntoConstraints = NO;
    result.borderStyle = UITextBorderStyleRoundedRect;
    result.placeholder = paramPlaceholder;
    return result;
    
}

- (void) constructUIComponents{
    
    self.textFieldEmail =
        [self textFieldWithPlaceholder:@"Email"];
    
    self.textFieldConfirmEmail =
        [self textFieldWithPlaceholder:@"Confirm Email"];
    
    self.registerButton = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    self.registerButton.translatesAutoresizingMaskIntoConstraints = NO;
    [self.registerButton setTitle:@"Register" forState:UIControlStateNormal];
    
}

- (void) addUIComponentsToView:(UIView *)paramView{
    
    [paramView addSubview:self.textFieldEmail];
    [paramView addSubview:self.textFieldConfirmEmail];
    [paramView addSubview:self.registerButton];
    
}

- (NSArray *) emailTextFieldConstraints{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSDictionary *viewsDictionary =
        NSDictionaryOfVariableBindings(_textFieldEmail);
    
    [result addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kEmailTextFieldHorizontal
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]
     ];
    
    [result addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kEmailTextFieldVertical
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]
     ];
    
    return [NSArray arrayWithArray:result];
    
}

- (NSArray *) confirmEmailTextFieldConstraints{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSDictionary *viewsDictionary =
        NSDictionaryOfVariableBindings(_textFieldConfirmEmail, _textFieldEmail);
    
    [result addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kConfirmEmailHorizontal
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]
     ];
    
    [result addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kConfirmEmailVertical
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]
     ];
    
    return [NSArray arrayWithArray:result];
    
}

- (NSArray *) registerButtonConstraints{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    NSDictionary *viewsDictionary =
        NSDictionaryOfVariableBindings(_registerButton, _textFieldConfirmEmail);
    
    [result addObject:
     
     [NSLayoutConstraint constraintWithItem:self.registerButton
                                  attribute:NSLayoutAttributeCenterX
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.view
                                  attribute:NSLayoutAttributeCenterX
                                 multiplier:1.0f
                                   constant:0.0f]
     
     ];
    
    [result addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kRegisterVertical
                                             options:0
                                             metrics:nil
                                               views:viewsDictionary]
     ];
    
    return [NSArray arrayWithArray:result];
}

- (NSArray *)constraints{
    
    NSMutableArray *result = [[NSMutableArray alloc] init];
    
    [result addObjectsFromArray:[self emailTextFieldConstraints]];
    [result addObjectsFromArray:[self confirmEmailTextFieldConstraints]];
    [result addObjectsFromArray:[self registerButtonConstraints]];
    return [NSArray arrayWithArray:result];
    
}

- (void)viewDidLoad{
    
    [super viewDidLoad];

    [self constructUIComponents];
    [self addUIComponentsToView:self.view];
    [self.view addConstraints:[self constraints]];
    
}

- (NSUInteger) supportedInterfaceOrientations{
    
    return UIInterfaceOrientationMaskAll;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
