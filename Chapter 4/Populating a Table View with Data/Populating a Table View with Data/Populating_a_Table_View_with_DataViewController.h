//
//  Populating_a_Table_View_with_DataViewController.h
//  Populating a Table View with Data
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Populating_a_Table_View_with_DataViewController
           : UIViewController <UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end
