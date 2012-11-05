//
//  Constructing_Headers_and_Footers_in_Table_ViewsViewController.h
//  Constructing Headers and Footers in Table Views
//
//  Created by Vandad Nahavandipoor on 30/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Constructing_Headers_and_Footers_in_Table_ViewsViewController
           : UIViewController <UITableViewDataSource, UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@end
