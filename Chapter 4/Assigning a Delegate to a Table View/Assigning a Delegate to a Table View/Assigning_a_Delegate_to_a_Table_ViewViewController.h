//
//  Assigning_a_Delegate_to_a_Table_ViewViewController.h
//  Assigning a Delegate to a Table View
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface Assigning_a_Delegate_to_a_Table_ViewViewController
           : UIViewController <UITableViewDelegate>

@property (nonatomic, strong) UITableView *myTableView;

@end
