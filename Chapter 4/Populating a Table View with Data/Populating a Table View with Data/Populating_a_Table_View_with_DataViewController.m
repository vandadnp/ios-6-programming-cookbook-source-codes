//
//  Populating_a_Table_View_with_DataViewController.m
//  Populating a Table View with Data
//
//  Created by Vandad Nahavandipoor on 11/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Populating_a_Table_View_with_DataViewController.h"

@implementation Populating_a_Table_View_with_DataViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
  
  NSInteger result = 0;
  if ([tableView isEqual:self.myTableView]){
    result = 3;
  }
  return result;
  
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section{
  
  NSInteger result = 0;
  if ([tableView isEqual:self.myTableView]){
    switch (section){
      case 0:{
        result = 3;
        break;
      }
      case 1:{
        result = 5;
        break;
      }
      case 2:{
        result = 8;
        break;
      }
    }
  }
  return result;
  
}

- (UITableViewCell *)     tableView:(UITableView *)tableView 
              cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *result = nil;
  
  if ([tableView isEqual:self.myTableView]){
    
    static NSString *TableViewCellIdentifier = @"MyCells";
    
    result = [tableView
              dequeueReusableCellWithIdentifier:TableViewCellIdentifier];
    
    if (result == nil){
      result = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:TableViewCellIdentifier];
    }
    
    result.textLabel.text = [NSString stringWithFormat:@"Section %ld, Cell %ld",
                             (long)indexPath.section,
                             (long)indexPath.row];
    
  }
  
  return result;
  
}



- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.myTableView = 
  [[UITableView alloc] initWithFrame:self.view.bounds
                               style:UITableViewStylePlain];
  
  self.myTableView.dataSource = self;
  
  /* Make sure our table view resizes correctly */
  self.myTableView.autoresizingMask = 
  UIViewAutoresizingFlexibleWidth |
  UIViewAutoresizingFlexibleHeight;
  
  [self.view addSubview:self.myTableView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
