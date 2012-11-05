//
//  Receiving_and_Handling_Table_View_EventsViewController.m
//  Receiving and Handling Table View Events
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Receiving_and_Handling_Table_View_EventsViewController.h"

@implementation Receiving_and_Handling_Table_View_EventsViewController

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  
  return 10;
  
}

- (UITableViewCell *) tableView:(UITableView *)tableView 
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *result = nil;
  
  static NSString *CellIdentifier = @"CellIdentifier";
  
  result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (result == nil){
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:CellIdentifier];
  }
  
  result.textLabel.text = [[NSString alloc] initWithFormat:@"Cell %lu",
                           (unsigned long)indexPath.row];
  
  return result;
  
}

- (void)        tableView:(UITableView *)tableView
  didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
  if ([tableView isEqual:self.myTableView]){
    
    NSLog(@"%@",
    [NSString stringWithFormat:@"Cell %ld in Section %ld is selected",
     (long)indexPath.row, (long)indexPath.section]);
  }
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  self.myTableView = [[UITableView alloc]
                      initWithFrame:self.view.bounds
                      style:UITableViewStylePlain];
  
  self.myTableView.autoresizingMask =
    UIViewAutoresizingFlexibleHeight |
    UIViewAutoresizingFlexibleWidth;
  
  self.myTableView.dataSource = self;
  self.myTableView.delegate = self;
  
  [self.view addSubview:self.myTableView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
