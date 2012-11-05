//
//  Using_Different_Types_of_Accessories_in_a_Table_View_CellViewController.m
//  Using Different Types of Accessories in a Table View Cell
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Using_Different_Types_of_Accessories_in_a_Table_View_CellViewController.h"

@implementation Using_Different_Types_of_Accessories_in_a_Table_View_CellViewController

- (void)                        tableView:(UITableView *)tableView 
 accessoryButtonTappedForRowWithIndexPath:(NSIndexPath *)indexPath{
  
  /* Do something when the accessory button is tapped */
  NSLog(@"Accessory button is tapped for cell at index path = %@", indexPath);
  
  UITableViewCell *ownerCell = [tableView cellForRowAtIndexPath:indexPath];
  
  NSLog(@"Cell Title = %@", ownerCell.textLabel.text);
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell* result = nil;
  
  if ([tableView isEqual:self.myTableView]){
    
    static NSString *MyCellIdentifier = @"SimpleCell";
    
    /* We will try to retrieve an existing cell
     with the given identifier */
    result = [tableView
              dequeueReusableCellWithIdentifier:MyCellIdentifier];
    
    if (result == nil){
      /* If a cell with the given identifier does not
       exist, we will create the cell with the identifier
       and hand it to the table view */
      
      result = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:MyCellIdentifier];
    }
    
    result.textLabel.text =
    [NSString stringWithFormat:@"Section %ld, Cell %ld",
     (long)indexPath.section,
     (long)indexPath.row];
    
    result.accessoryType = UITableViewCellAccessoryDetailDisclosureButton;
    
  }
  
  return result;
  
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  return 10;
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
