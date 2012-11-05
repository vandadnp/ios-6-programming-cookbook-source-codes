//
//  Moving_Cells_and_Sections_in_Table_ViewsViewController.h
//  Moving Cells and Sections in Table Views
//
//  Created by Vandad Nahavandipoor on 07/08/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Moving_Cells_and_Sections_in_Table_ViewsViewController
           : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

/* Each section is an array on its own, containing objects of type NSString */
@property (nonatomic, strong) NSMutableArray *arrayOfSections;

@end
