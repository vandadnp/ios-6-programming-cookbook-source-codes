//
//  ConflictViewController.m
//  Handling Conflicts in iCloud Documents
//
//  Created by Vandad NP on 16/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import "ConflictViewController.h"

@implementation ConflictViewController

- (id) initWithNibName:(NSString *)nibNameOrNil 
                bundle:(NSBundle *)nibBundleOrNil
     tableViewDelegate:(id<UITableViewDelegate>)paramTableViewDelegate
   tableViewDataSource:(id<UITableViewDataSource>)paramTableViewDataSource{
  
  self = [super initWithNibName:nibNameOrNil
                         bundle:nibBundleOrNil];
  
  if (self != nil){
    /* No view exist at this point so let's set the table view's frame
     to a zero-rectangle and then we will adjust it when our view loads */
    tableViewVersions = [[UITableView alloc] 
                         initWithFrame:CGRectZero
                         style:UITableViewStylePlain];
    tableViewVersions.delegate = paramTableViewDelegate;
    tableViewVersions.dataSource = paramTableViewDataSource;
  }
  
  return self;
  
}

- (id) initWithNibName:(NSString *)nibNameOrNil 
                bundle:(NSBundle *)nibBundleOrNil{
  
  return [self initWithNibName:nibNameOrNil
                        bundle:nibBundleOrNil
             tableViewDelegate:nil
           tableViewDataSource:nil];
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.autoresizingMask = UIViewAutoresizingFlexibleWidth | 
                               UIViewAutoresizingFlexibleHeight;
  self.tableViewVersions.autoresizingMask = self.view.autoresizingMask;
  self.tableViewVersions.frame = self.view.bounds;
  [self.view addSubview:self.tableViewVersions];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return (interfaceOrientation == UIInterfaceOrientationPortrait);
}

@end
