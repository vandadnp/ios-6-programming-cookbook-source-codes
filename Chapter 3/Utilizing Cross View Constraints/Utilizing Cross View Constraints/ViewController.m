//
//  ViewController.m
//  Utilizing Cross View Constraints
//
//  Created by Vandad Nahavandipoor on 17/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, strong) UIView *topGrayView;
@property (nonatomic, strong) UIButton *topButton;

@property (nonatomic, strong) UIView *bottomGrayView;
@property (nonatomic, strong) UIButton *bottomButton;

@end

@implementation ViewController

- (UIView *) newGrayView{
    
    UIView *result = [[UIView alloc] init];
    result.backgroundColor = [UIColor lightGrayColor];
    result.translatesAutoresizingMaskIntoConstraints = NO;
    [self.view addSubview:result];
    return result;
    
}

- (void) createGrayViews{
    
    self.topGrayView = [self newGrayView];
    self.bottomGrayView = [self newGrayView];
    
}

- (UIButton *) newButtonPlacedOnView:(UIView *)paramView{
    
    UIButton *result = [UIButton buttonWithType:UIButtonTypeRoundedRect];
    result.translatesAutoresizingMaskIntoConstraints = NO;
    [result setTitle:@"Button" forState:UIControlStateNormal];
    [paramView addSubview:result];
    return result;
    
}

- (void) createButtons{
    self.topButton = [self newButtonPlacedOnView:self.topGrayView];
    self.bottomButton = [self newButtonPlacedOnView:self.bottomGrayView];
}

- (void) applyConstraintsToTopGrayView{
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_topGrayView);
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    NSString *const kHConstraint = @"H:|-[_topGrayView]-|";
    NSString *const kVConstraint = @"V:|-[_topGrayView(==100)]";
    
    /* Horizontal constraint(s) */
    [constraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kHConstraint
                                             options:0
                                             metrics:nil
                                               views:views]
     ];
    
    /* Vertical constraint(s) */
    [constraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kVConstraint
                                             options:0
                                             metrics:nil
                                               views:views]
     ];
    
    [self.topGrayView.superview addConstraints:constraints];
    
}

- (void) applyConstraintsToButtonOnTopGrayView{
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_topButton);
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    NSString *const kHConstraint = @"H:|-[_topButton]";
    
    /* Horizontal constraint(s) */
    [constraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kHConstraint
                                             options:0
                                             metrics:nil
                                               views:views]
     ];
    
    /* Vertical constraint(s) */
    [constraints addObject:
     [NSLayoutConstraint constraintWithItem:self.topButton
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.topGrayView
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0f
                                   constant:0.0f]
     ];
    
    [self.topButton.superview addConstraints:constraints];
    
}

- (void) applyConstraintsToBottomGrayView{
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_topGrayView,
                                                         _bottomGrayView);
    
    NSMutableArray *constraints = [[NSMutableArray alloc] init];
    
    NSString *const kHConstraint = @"H:|-[_bottomGrayView]-|";
    NSString *const kVConstraint =
        @"V:|-[_topGrayView]-[_bottomGrayView(==100)]";
    
    /* Horizontal constraint(s) */
    [constraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kHConstraint
                                             options:0
                                             metrics:nil
                                               views:views]
     ];
    
    /* Vertical constraint(s) */
    [constraints addObjectsFromArray:
     [NSLayoutConstraint constraintsWithVisualFormat:kVConstraint
                                             options:0
                                             metrics:nil
                                               views:views]
     ];
    
    [self.bottomGrayView.superview addConstraints:constraints];
    
}

- (void) applyConstraintsToButtonOnBottomGrayView{
    
    NSDictionary *views = NSDictionaryOfVariableBindings(_topButton,
                                                         _bottomButton);
    
    NSString *const kHConstraint = @"H:[_topButton][_bottomButton]";
    
    /* Horizontal constraint(s) */
    [self.bottomGrayView.superview addConstraints:
     [NSLayoutConstraint constraintsWithVisualFormat:kHConstraint
                                             options:0
                                             metrics:nil
                                               views:views]
     ];
    
    /* Vertical constraint(s) */
    [self.bottomButton.superview addConstraint:
     [NSLayoutConstraint constraintWithItem:self.bottomButton
                                  attribute:NSLayoutAttributeCenterY
                                  relatedBy:NSLayoutRelationEqual
                                     toItem:self.bottomGrayView
                                  attribute:NSLayoutAttributeCenterY
                                 multiplier:1.0f
                                   constant:0.0f]
     ];
    
}

- (void)viewDidLoad{
    [super viewDidLoad];
	
    [self createGrayViews];
    
    [self createButtons];
    
    [self applyConstraintsToTopGrayView];
    [self applyConstraintsToButtonOnTopGrayView];
    
    [self applyConstraintsToBottomGrayView];
    [self applyConstraintsToButtonOnBottomGrayView];
    
}

- (NSUInteger) supportedInterfaceOrientations{
    return UIInterfaceOrientationMaskAll;
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
