//
//  Displaying_Hierarchical_Data_in_Table_ViewsViewController.h
//  Displaying Hierarchical Data in Table Views
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Displaying_Hierarchical_Data_in_Table_ViewsViewController
           : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end
