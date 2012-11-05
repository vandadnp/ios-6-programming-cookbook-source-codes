//
//  Moving_Cells_and_Sections_in_Table_ViewsViewController.m
//  Moving Cells and Sections in Table Views
//
//  Created by Vandad Nahavandipoor on 07/08/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Moving_Cells_and_Sections_in_Table_ViewsViewController.h"

@implementation Moving_Cells_and_Sections_in_Table_ViewsViewController

- (NSMutableArray *) newSectionWithIndex:(NSUInteger)paramIndex
                           withCellCount:(NSUInteger)paramCellCount{
  
  NSMutableArray *result = [[NSMutableArray alloc] init];
  
  NSUInteger counter = 0;
  for (counter = 0;
       counter < paramCellCount;
       counter++){
    
    [result addObject:[[NSString alloc] initWithFormat:@"Section %lu Cell %lu",
                       (unsigned long)paramIndex,
                       (unsigned long)counter+1]];
    
  }
  
  return result;
  
}

- (id) initWithNibName:(NSString *)nibNameOrNil 
                bundle:(NSBundle *)nibBundleOrNil{
  
  self = [super initWithNibName:nibNameOrNil
                         bundle:nibBundleOrNil];
  
  if (self != nil){
    
    arrayOfSections = [[NSMutableArray alloc] init];
    
    NSMutableArray *section1 = [self newSectionWithIndex:1
                                           withCellCount:3];
    NSMutableArray *section2 = [self newSectionWithIndex:2
                                           withCellCount:3];
    NSMutableArray *section3 = [self newSectionWithIndex:3
                                           withCellCount:3];
    [arrayOfSections addObject:section1];
    [arrayOfSections addObject:section2];
    [arrayOfSections addObject:section3];
    
  }
  
  return self;
  
}

- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{  
  
  NSInteger result = 0;
  
  if ([tableView isEqual:self.myTableView]){
    result = (NSInteger)[self.arrayOfSections count];
  }
  
  return result;
  
}

- (NSInteger) tableView:(UITableView *)tableView 
  numberOfRowsInSection:(NSInteger)section{
  
  NSInteger result = 0;
  
  if ([tableView isEqual:self.myTableView]){
    
    if ([self.arrayOfSections count] > section){
      
      NSMutableArray *sectionArray = [self.arrayOfSections
                                      objectAtIndex:section];
      result = (NSInteger)[sectionArray count];
      
    }
    
  }
  
  return result;
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *result = nil;
  
  if ([tableView isEqual:self.myTableView]){
    
    static NSString *CellIdentifier = @"CellIdentifier";
    
    result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    
    if (result == nil){
      result = [[UITableViewCell alloc] 
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    NSMutableArray *sectionArray = [self.arrayOfSections 
                                    objectAtIndex:indexPath.section];
    
    result.textLabel.text = [sectionArray objectAtIndex:indexPath.row];
    
  }
  
  return result;
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.myTableView = 
  [[UITableView alloc] initWithFrame:self.view.bounds
                               style:UITableViewStyleGrouped];
  
  self.myTableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | 
                                      UIViewAutoresizingFlexibleHeight;
  
  self.myTableView.delegate = self;
  self.myTableView.dataSource = self;
  
  [self.view addSubview:self.myTableView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

- (void) moveCell2InSection1ToCell1InSection2{
  
  NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
  NSMutableArray *section2 = [self.arrayOfSections objectAtIndex:1];
  
  NSString *cell2InSection1 = [section1 objectAtIndex:1];
  [section1 removeObject:cell2InSection1];
  
  [section2 insertObject:cell2InSection1
                 atIndex:0];
  
  NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:1
                                                    inSection:0];
  NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:0
                                                         inSection:1];
  
  [self.myTableView moveRowAtIndexPath:sourceIndexPath
                           toIndexPath:destinationIndexPath];
  
}

- (void) moveCell1InSection1ToCell2InSection1{
  
  NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
  NSString *cell1InSection1 = [section1 objectAtIndex:0];
  [section1 removeObject:cell1InSection1];
  [section1 insertObject:cell1InSection1
                 atIndex:1];
  
  NSIndexPath *sourceIndexPath = [NSIndexPath indexPathForRow:0
                                                    inSection:0];
  NSIndexPath *destinationIndexPath = [NSIndexPath indexPathForRow:1
                                                         inSection:0];
  
  [self.myTableView moveRowAtIndexPath:sourceIndexPath 
                           toIndexPath:destinationIndexPath];
  
}

- (void) moveSection1ToSection3{
  
  NSMutableArray *section1 = [self.arrayOfSections objectAtIndex:0];
  [self.arrayOfSections removeObject:section1];
  [self.arrayOfSections addObject:section1];
  
  [self.myTableView moveSection:0
                      toSection:2];
  
}

@end
