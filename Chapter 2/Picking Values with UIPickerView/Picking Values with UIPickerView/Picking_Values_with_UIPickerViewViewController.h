//
//  Picking_Values_with_UIPickerViewViewController.h
//  Picking Values with UIPickerView
//
//  Created by Vandad Nahavandipoor on 08/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Picking_Values_with_UIPickerViewViewController 
           : UIViewController 
             <UIPickerViewDataSource, UIPickerViewDelegate>

@property (nonatomic, strong) UIPickerView *myPicker;

@end
