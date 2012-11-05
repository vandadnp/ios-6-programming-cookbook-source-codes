//
//  Enabling_Swipe_Deletion_of_Table_View_CellsViewController.h
//  Enabling Swipe Deletion of Table View Cells
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Enabling_Swipe_Deletion_of_Table_View_CellsViewController
           : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;
@property (nonatomic, strong) NSMutableArray *arrayOfRows;

@end
