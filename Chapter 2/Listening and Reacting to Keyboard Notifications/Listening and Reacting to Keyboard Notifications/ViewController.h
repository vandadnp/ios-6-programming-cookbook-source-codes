//
//  ViewController.h
//  Listening and Reacting to Keyboard Notifications
//
//  Created by Vandad Nahavandipoor on 23/08/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController 
           <UITableViewDelegate, UITableViewDataSource, UITextFieldDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@end
