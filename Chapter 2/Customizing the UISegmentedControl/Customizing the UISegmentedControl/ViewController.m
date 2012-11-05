//
//  ViewController.m
//  Customizing the UISegmentedControl
//
//  Created by Vandad Nahavandipoor on 21/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

/* 2 */
#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@end

NSString *const DividerImageTypeUnselectedUnselected = @"Unselected-Unselected";
NSString *const DividerImageTypeSelectedUnselected =   @"Selected-Unselected";
NSString *const DividerImageTypeUnselectedSelected =   @"Unselected-Selected";
typedef NSString *DividerImageType;

@implementation ViewController

- (UIImage *) segmentImageInSelectedMode:(BOOL)paramInSelectedMode{
    
    UIImage *result;
    if (paramInSelectedMode){
        result = [UIImage imageNamed:@"Selected"];
    } else {
        result = [UIImage imageNamed:@"Unselected"];
    }
    UIEdgeInsets edgeInsets;
    edgeInsets.left = 8.0f;
    edgeInsets.top = 0.0f;
    edgeInsets.right = 8.0f;
    edgeInsets.bottom = 0.0f;
    result = [result resizableImageWithCapInsets:edgeInsets];
    return result;
    
}

- (UIImage *) dividerImageOfType:(DividerImageType)paramType{
    
    UIImage *result = [UIImage imageNamed:paramType];
    UIEdgeInsets edgeInsets;
    edgeInsets.left = 25.0f;
    edgeInsets.top = 0.0f;
    edgeInsets.right = 25.0f;
    edgeInsets.bottom = 0.0f;
    result = [result resizableImageWithCapInsets:edgeInsets];
    return result;
    
}

- (UIImage *) normalImage{
    return [self segmentImageInSelectedMode:NO];
}

- (UIImage *) selectedImage{
    return [self segmentImageInSelectedMode:YES];
    
}

- (UIImage *) dividerUnselectedUnselected{
    return [self dividerImageOfType:DividerImageTypeUnselectedUnselected];
}

- (UIImage *) dividerSelectedUnselected{
    return [self dividerImageOfType:DividerImageTypeSelectedUnselected];
}

- (UIImage *) dividerUnselectedSelected{
    return [self dividerImageOfType:DividerImageTypeUnselectedSelected];
}

- (void) setBackgroundImages{
    [self.segmentedControl setBackgroundImage:[self normalImage]
                                     forState:UIControlStateNormal
                                   barMetrics:UIBarMetricsDefault];
    
    [self.segmentedControl setBackgroundImage:[self selectedImage]
                                     forState:UIControlStateSelected
                                   barMetrics:UIBarMetricsDefault];
}

- (void) setDividerImages{
    [self.segmentedControl setDividerImage:[self dividerUnselectedUnselected]
                       forLeftSegmentState:UIControlStateNormal
                         rightSegmentState:UIControlStateNormal
                                barMetrics:UIBarMetricsDefault];
    
    [self.segmentedControl setDividerImage:[self dividerSelectedUnselected]
                       forLeftSegmentState:UIControlStateSelected
                         rightSegmentState:UIControlStateNormal
                                barMetrics:UIBarMetricsDefault];
    
    [self.segmentedControl setDividerImage:[self dividerUnselectedSelected]
                       forLeftSegmentState:UIControlStateNormal
                         rightSegmentState:UIControlStateSelected
                                barMetrics:UIBarMetricsDefault];
}

- (void)viewDidLoad{
    [super viewDidLoad];
    
    NSArray *items = @[@"Item 1", @"Item 2", @"Item 3"];
    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
    [self.view addSubview:self.segmentedControl];
    self.segmentedControl.center = CGPointMake(self.view.center.x - 50.0f,
                                               self.view.center.y);
    
    
    [self setBackgroundImages];
    [self setDividerImages];
    
    /* Make sure in the normal state of the control that the text is light
     gray color and there is no shadow for the font */
    [self.segmentedControl
     setTitleTextAttributes:
     @{
     UITextAttributeTextColor:[UIColor lightGrayColor],
     UITextAttributeTextShadowColor: [UIColor clearColor],
     }
     forState:UIControlStateNormal];
    
    
    /* In the selected state of the segmented control, make sure the text
     is rendered in white */
    [self.segmentedControl
     setTitleTextAttributes:@{UITextAttributeTextColor:[UIColor whiteColor]}
     forState:UIControlStateSelected];
    
}

- (void)didReceiveMemoryWarning{
    [super didReceiveMemoryWarning];
}

@end

/* 1 */
//#import "ViewController.h"
//
//@interface ViewController ()
//@property (nonatomic, strong) UISegmentedControl *segmentedControl;
//@end
//
//@implementation ViewController
//
//- (void)viewDidLoad{
//    [super viewDidLoad];
//    
//    NSArray *items = @[@"Item 1", @"Item 2", @"Item 3"];
//    self.segmentedControl = [[UISegmentedControl alloc] initWithItems:items];
//    /* We have to do this if we want to change the tint color */
//    self.segmentedControl.segmentedControlStyle = UISegmentedControlStyleBar;
//    [self.view addSubview:self.segmentedControl];
//    self.segmentedControl.center = CGPointMake(self.view.center.x + 25.0f,
//                                               self.view.center.y);
//    
//    /* Change the tint color now */
//    self.segmentedControl.tintColor = [UIColor blueColor];
//    
//}
//
//- (void)didReceiveMemoryWarning{
//    [super didReceiveMemoryWarning];
//}
//
//@end
