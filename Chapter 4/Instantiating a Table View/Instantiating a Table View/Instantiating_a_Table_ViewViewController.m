//
//  Instantiating_a_Table_ViewViewController.m
//  Instantiating a Table View
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Instantiating_a_Table_ViewViewController.h"

@implementation Instantiating_a_Table_ViewViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

/* 1 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.myTableView = 
    [[UITableView alloc] initWithFrame:self.view.bounds
                                 style:UITableViewStylePlain];
  
  [self.view addSubview:self.myTableView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
