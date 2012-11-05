//
//  ConflictViewController.h
//  Handling Conflicts in iCloud Documents
//
//  Created by Vandad NP on 16/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ConflictViewController : UIViewController

@property (nonatomic, strong) UITableView *tableViewVersions;

/* Designated Initializer */
- (id) initWithNibName:(NSString *)nibNameOrNil 
                bundle:(NSBundle *)nibBundleOrNil
     tableViewDelegate:(id<UITableViewDelegate>)paramTableViewDelegate
   tableViewDataSource:(id<UITableViewDataSource>)paramTableViewDataSource;

@end
