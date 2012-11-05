//
//  Constructing_Headers_and_Footers_in_Table_ViewsViewController.m
//  Constructing Headers and Footers in Table Views
//
//  Created by Vandad Nahavandipoor on 30/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Constructing_Headers_and_Footers_in_Table_ViewsViewController.h"

@implementation Constructing_Headers_and_Footers_in_Table_ViewsViewController

- (CGFloat)     tableView:(UITableView *)tableView 
 heightForHeaderInSection:(NSInteger)section{
  
  CGFloat result = 0.0f;
  
  if ([tableView isEqual:self.myTableView] &&
      section == 0){
    result = 30.0f;
  }
  
  return result;
  
}

- (CGFloat)     tableView:(UITableView *)tableView 
 heightForFooterInSection:(NSInteger)section{
  
  CGFloat result = 0.0f;
  
  if ([tableView isEqual:self.myTableView] &&
      section == 0){
    result = 30.0f;
  }
  
  return result;
  
}

/* 1 */
//- (UIView *)  tableView:(UITableView *)tableView 
// viewForHeaderInSection:(NSInteger)section{
//  
//  UILabel *result = nil;
//  
//  if ([tableView isEqual:self.myTableView] &&
//      section == 0){
//    result = [[UILabel alloc] initWithFrame:CGRectZero];
//    result.text = @"Section 1 Header";
//    result.backgroundColor = [UIColor clearColor];
//    [result sizeToFit];
//  }
//  
//  return result;
//  
//}
//
//- (UIView *)  tableView:(UITableView *)tableView 
// viewForFooterInSection:(NSInteger)section{
//  
//  UILabel *result = nil;
//  
//  if ([tableView isEqual:self.myTableView] &&
//      section == 0){
//    result = [[UILabel alloc] initWithFrame:CGRectZero];
//    result.text = @"Section 1 Footer";
//    result.backgroundColor = [UIColor clearColor];
//    [result sizeToFit];
//  }
//  
//  return result;
//  
//}

/* 2 */
//- (UIView *)  tableView:(UITableView *)tableView 
// viewForHeaderInSection:(NSInteger)section{
//  
//  UIView *result = nil;
//  
//  if ([tableView isEqual:self.myTableView] &&
//      section == 0){
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
//    label.text = @"Section 1 Header";
//    label.backgroundColor = [UIColor clearColor];
//    [label sizeToFit];
//    
//    /* Move the label 10 points to the right */
//    label.frame = CGRectMake(label.frame.origin.x + 10.0f, 
//                             5.0f, /* Go 5 points down in y axis */
//                             label.frame.size.width, 
//                             label.frame.size.height);
//    
//    /* Give the container view 10 points more in width than our label
//     because the label needs a 10 extra points left-margin */
//    CGRect resultFrame = CGRectMake(0.0f, 
//                                    0.0f, 
//                                    label.frame.size.width + 10.0f,
//                                    label.frame.size.height);
//    result = [[UIView alloc] initWithFrame:resultFrame];
//    [result addSubview:label];
//    
//  }
//  
//  return result;
//  
//}
//
//- (UIView *)  tableView:(UITableView *)tableView 
// viewForFooterInSection:(NSInteger)section{
//  
//  UIView *result = nil;
//  
//  if ([tableView isEqual:self.myTableView] &&
//      section == 0){
//    
//    UILabel *label = [[UILabel alloc] initWithFrame:CGRectZero];
//    label.text = @"Section 1 Footer";
//    label.backgroundColor = [UIColor clearColor];
//    [label sizeToFit];
//    
//    /* Move the label 10 points to the right */
//    label.frame = CGRectMake(label.frame.origin.x + 10.0f, 
//                             5.0f, /* Go 5 points down in y axis */
//                             label.frame.size.width, 
//                             label.frame.size.height);
//    
//    /* Give the container view 10 points more in width than our label
//     because the label needs a 10 extra points left-margin */
//    CGRect resultFrame = CGRectMake(0.0f, 
//                                    0.0f, 
//                                    label.frame.size.width + 10.0f,
//                                    label.frame.size.height);
//    result = [[UIView alloc] initWithFrame:resultFrame];
//    [result addSubview:label];
//    
//  }
//  
//  return result;
//  
//}

/* 3 */
- (NSString *) tableView:(UITableView *)tableView 
 titleForHeaderInSection:(NSInteger)section{
  
  NSString *result = nil;
  
  if ([tableView isEqual:self.myTableView] &&
      section == 0){
    result = @"Section 1 Header";
  }
  
  return result;
  
}

- (NSString *) tableView:(UITableView *)tableView 
 titleForFooterInSection:(NSInteger)section{
  
  NSString *result = nil;
  
  if ([tableView isEqual:self.myTableView] &&
      section == 0){
    result = @"Section 1 Footer";
  }
  
  return result;
  
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
  
  result.textLabel.text = [[NSString alloc] initWithFormat:@"Cell %ld", 
                           (long)indexPath.row];
  
  return result;
  
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  return 3;
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.myTableView = 
  [[UITableView alloc] initWithFrame:self.view.bounds
                               style:UITableViewStyleGrouped];
  
  self.myTableView.dataSource = self;
  self.myTableView.delegate = self;
  self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth |
                                      UIViewAutoresizingFlexibleHeight;
  
  [self.view addSubview:self.myTableView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
