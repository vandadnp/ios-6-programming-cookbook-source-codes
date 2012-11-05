//
//  AddPersonViewController.h
//  Boosting Data Access in Table Views
//
//  Created by Vandad Nahavandipoor on 23/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface AddPersonViewController : UIViewController

@property (nonatomic, strong) UITextField *textFieldFirstName;
@property (nonatomic, strong) UITextField *textFieldLastName;
@property (nonatomic, strong) UITextField *textFieldAge;
@property (nonatomic, strong) UIBarButtonItem *barButtonAdd;

@end
