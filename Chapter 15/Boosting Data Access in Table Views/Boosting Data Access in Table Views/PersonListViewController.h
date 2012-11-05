//
//  PersonListViewController.h
//  Boosting Data Access in Table Views
//
//  Created by Vandad Nahavandipoor on 23/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreData/CoreData.h>

@interface PersonListViewController : UIViewController 
           <UITableViewDelegate, 
            UITableViewDataSource, 
            NSFetchedResultsControllerDelegate>

@property (nonatomic, strong) UITableView *tableViewPersons;
@property (nonatomic, strong) UIBarButtonItem *barButtonAddPerson;
@property (nonatomic, strong) NSFetchedResultsController *personsFRC;

@end
