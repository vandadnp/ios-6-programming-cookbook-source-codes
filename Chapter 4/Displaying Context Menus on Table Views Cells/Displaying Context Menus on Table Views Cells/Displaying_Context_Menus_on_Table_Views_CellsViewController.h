//
//  Displaying_Context_Menus_on_Table_Views_CellsViewController.h
//  Displaying Context Menus on Table Views Cells
//
//  Created by Vandad Nahavandipoor on 31/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Displaying_Context_Menus_on_Table_Views_CellsViewController
           : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end
