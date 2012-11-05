//
//  Creating_Custom_Table_View_Cell_AccessoriesViewController.m
//  Creating Custom Table View Cell Accessories
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Creating_Custom_Table_View_Cell_AccessoriesViewController.h"

@implementation Creating_Custom_Table_View_Cell_AccessoriesViewController

- (void) performExpand:(UIButton *)paramSender{
  
  UITableViewCell *ownerCell = (UITableViewCell*)paramSender.superview;
  
  if (ownerCell != nil){
    
    /* Now we will retrieve the index path of the cell
     which contains the section and the row of the cell */
    
    NSIndexPath *ownerCellIndexPath = 
      [self.myTableView indexPathForCell:ownerCell];
    
    NSLog(@"Accessory in index path is tapped. Index path = %@", 
          ownerCellIndexPath);
    
    /* Now we can use these two values to truly determine that
     the accessory button of which cell was the sender of this event:
     
     OwnerCellIndexPath.section
     OwnerCellIndexPath.row
     
     */
    
    if (ownerCellIndexPath.section == 0 &&
        ownerCellIndexPath.row == 1){
      /* This is the second row in the first section */
    }
    
    /* And so forth with the other checks ... */
    
  }
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell* result = nil;
  
  static NSString *MyCellIdentifier = @"SimpleCell";
  
  /* We will try to retrieve an existing cell
   with the given identifier */
  result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
  
  if (result == nil){
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:MyCellIdentifier];
  }
  
  result.textLabel.text = [NSString stringWithFormat:@"Section %ld, Cell %ld",
                           (long)indexPath.section,
                           (long)indexPath.row];
  
  UIButton *button = [UIButton buttonWithType:UIButtonTypeRoundedRect];
  button.frame = CGRectMake(0.0f, 0.0f, 150.0f, 25.0f);
  
  [button setTitle:@"Expand"
          forState:UIControlStateNormal];
  
  [button addTarget:self
             action:@selector(performExpand:)
   forControlEvents:UIControlEventTouchUpInside];
  
  result.accessoryView = button;
  
  return result;
  
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
  return 3;
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  return 3;
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
