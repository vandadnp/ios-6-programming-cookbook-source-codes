//
//  Displaying_Hierarchical_Data_in_Table_ViewsViewController.m
//  Displaying Hierarchical Data in Table Views
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Hierarchical_Data_in_Table_ViewsViewController.h"

@implementation Displaying_Hierarchical_Data_in_Table_ViewsViewController

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell* result = nil;
  
  static NSString *MyCellIdentifier = @"SimpleCells";
  
  result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
  
  if (result == nil){
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:MyCellIdentifier];
  }
  
  result.textLabel.text = [NSString stringWithFormat:@"Section %ld, Cell %ld",
                           (long)indexPath.section,
                           (long)indexPath.row];
  
  result.indentationLevel = indexPath.row;
  result.indentationWidth = 10.0f;
  
  return result;
  
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
  return 4;
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  
  NSInteger result = 0;
  
  switch (section){
    case 0:{
      result = 2;
      break;
    }
    case 1:{
      result = 4;
      break;
    }
    case 2:{
      result = 8;
      break;
    }
    case 3:{
      result = 16;
      break;
    }
  }
  
  return result;
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.myTableView = [[UITableView alloc] initWithFrame:self.view.bounds
                                                  style:UITableViewStylePlain];
  
  self.myTableView.dataSource = self;
  self.myTableView.delegate = self;
  
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
