//
//  Enabling_Swipe_Deletion_of_Table_View_CellsViewController.m
//  Enabling Swipe Deletion of Table View Cells
//
//  Created by Vandad Nahavandipoor on 29/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Enabling_Swipe_Deletion_of_Table_View_CellsViewController.h"

@implementation Enabling_Swipe_Deletion_of_Table_View_CellsViewController

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCellEditingStyle result = UITableViewCellEditingStyleNone;
  
  if ([tableView isEqual:self.myTableView]){
    result = UITableViewCellEditingStyleDelete;
  }
  
  return result;
  
}

- (void) setEditing:(BOOL)editing 
           animated:(BOOL)animated{
  
  [super setEditing:editing
           animated:animated];
  
  [self.myTableView setEditing:editing
                      animated:animated];
  
  
}

- (void)  tableView:(UITableView *)tableView
 commitEditingStyle:(UITableViewCellEditingStyle)editingStyle
  forRowAtIndexPath:(NSIndexPath *)indexPath{
  
  if (editingStyle == UITableViewCellEditingStyleDelete){
    
    if (indexPath.row < [self.arrayOfRows count]){
      
      /* First remove this object from the source */
      [self.arrayOfRows removeObjectAtIndex:indexPath.row];
      
      /* Then remove the associated cell from the Table View */
      [tableView deleteRowsAtIndexPaths:[NSArray arrayWithObject:indexPath]
                       withRowAnimation:UITableViewRowAnimationLeft];
      
    }
  }
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell* result = nil;
  
  static NSString *MyCellIdentifier = @"SimpleCells";
  
  result = [tableView dequeueReusableCellWithIdentifier:MyCellIdentifier];
  
  if (result == nil){
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault
                                    reuseIdentifier:MyCellIdentifier];
  }
  
  result.textLabel.text = 
  (NSString *)[self.arrayOfRows objectAtIndex:indexPath.row];
  
  return result;
  
}

- (id) initWithNibName:(NSString *)nibNameOrNil 
                bundle:(NSBundle *)nibBundleOrNil{
  
  self = [super initWithNibName:nibNameOrNil
                         bundle:nibBundleOrNil];
  
  if (self != nil){
    
    self.arrayOfRows = [[NSMutableArray alloc] init];
    
    for (NSUInteger counter = 0;
         counter < 10;
         counter++){
      
      [self.arrayOfRows addObject:[[NSString alloc] initWithFormat:@"Cell %lu",
                                   (unsigned long)counter]];
      
    }
    
  }
  
  return self;
  
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  
  return [self.arrayOfRows count];
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  [self.navigationItem setLeftBarButtonItem:self.editButtonItem
                                   animated:NO];
  
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
