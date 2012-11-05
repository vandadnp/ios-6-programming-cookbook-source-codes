//
//  Receiving_and_Handling_Table_View_EventsViewController.h
//  Receiving and Handling Table View Events
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Receiving_and_Handling_Table_View_EventsViewController
           : UIViewController <UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITableView *myTableView;

@end
