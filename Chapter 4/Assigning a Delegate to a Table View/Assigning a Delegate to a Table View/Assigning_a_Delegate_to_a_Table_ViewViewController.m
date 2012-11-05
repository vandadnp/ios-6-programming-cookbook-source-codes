//
//  Assigning_a_Delegate_to_a_Table_ViewViewController.m
//  Assigning a Delegate to a Table View
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Assigning_a_Delegate_to_a_Table_ViewViewController.h"

@implementation Assigning_a_Delegate_to_a_Table_ViewViewController

- (CGFloat)     tableView:(UITableView *)tableView
  heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  CGFloat result = 20.0f;
  
  if ([tableView isEqual:self.myTableView]){
    result = 40.0f;
  }
  
  return result;
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  /* We want a full-screen Table View which is as
   big as the View which is attached to the current
   View Controller */
  CGRect tableViewFrame = self.view.bounds;
  
  self.myTableView = [[UITableView alloc]
                      initWithFrame:tableViewFrame
                      style:UITableViewStylePlain];
  
  self.myTableView.delegate = self;
  
  /* Add this Table View to our View */
  [self.view addSubview:self.myTableView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
