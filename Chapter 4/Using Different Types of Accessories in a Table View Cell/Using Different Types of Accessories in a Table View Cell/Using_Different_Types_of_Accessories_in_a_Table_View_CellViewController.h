//
//  Using_Different_Types_of_Accessories_in_a_Table_View_CellViewController.h
//  Using Different Types of Accessories in a Table View Cell
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface 
  Using_Different_Types_of_Accessories_in_a_Table_View_CellViewController 
  : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@end
