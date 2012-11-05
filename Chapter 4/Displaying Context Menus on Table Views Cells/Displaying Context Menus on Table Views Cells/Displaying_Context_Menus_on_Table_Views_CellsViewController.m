//
//  Displaying_Context_Menus_on_Table_Views_CellsViewController.m
//  Displaying Context Menus on Table Views Cells
//
//  Created by Vandad Nahavandipoor on 31/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Context_Menus_on_Table_Views_CellsViewController.h"

@implementation Displaying_Context_Menus_on_Table_Views_CellsViewController

/* 1 */
//- (BOOL)                tableView:(UITableView *)tableView 
//  shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
//  
//  /* Allow the context menu to be displayed on every cell */
//  return YES;
//  
//}
//
//- (BOOL) tableView:(UITableView *)tableView
//  canPerformAction:(SEL)action
// forRowAtIndexPath:(NSIndexPath *)indexPath 
//        withSender:(id)sender{
//  
//  NSLog(@"%@", NSStringFromSelector(action));
//  
//  /* Allow every action for now */
//  return YES;
//}
//
//- (void) tableView:(UITableView *)tableView 
//     performAction:(SEL)action
// forRowAtIndexPath:(NSIndexPath *)indexPath 
//        withSender:(id)sender{
//  
//  /* Empty for now */
//  
//}

/* 2 */
- (BOOL)                tableView:(UITableView *)tableView 
  shouldShowMenuForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  /* Allow the context menu to be displayed on every cell */
  return YES;
  
}

- (BOOL) tableView:(UITableView *)tableView
  canPerformAction:(SEL)action
 forRowAtIndexPath:(NSIndexPath *)indexPath 
        withSender:(id)sender{
  
  if (action == @selector(copy:)){
    return YES;
  }
  
  return NO;
}

- (void) tableView:(UITableView *)tableView 
     performAction:(SEL)action
 forRowAtIndexPath:(NSIndexPath *)indexPath 
        withSender:(id)sender{
  
  if (action == @selector(copy:)){
    
    UITableViewCell *cell = [tableView cellForRowAtIndexPath:indexPath];
    UIPasteboard *pasteBoard = [UIPasteboard generalPasteboard];
    [pasteBoard setString:cell.textLabel.text];
    
  }
    
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  return 3;
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
  
  result.textLabel.text = [[NSString alloc] 
                           initWithFormat:@"Section %ld Cell %ld",
                           (long)indexPath.section,
                           (long)indexPath.row];
  
  return result;
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.myTableView = [[UITableView alloc] 
                      initWithFrame:self.view.bounds
                      style:UITableViewStylePlain];
  
  self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                      UIViewAutoresizingFlexibleHeight;
  
  self.myTableView.dataSource = self;
  self.myTableView.delegate = self;
  
  [self.view addSubview:self.myTableView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
