//
//  Creating_Custom_Table_View_Cell_AccessoriesViewController.h
//  Creating Custom Table View Cell Accessories
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Creating_Custom_Table_View_Cell_AccessoriesViewController
           : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end
