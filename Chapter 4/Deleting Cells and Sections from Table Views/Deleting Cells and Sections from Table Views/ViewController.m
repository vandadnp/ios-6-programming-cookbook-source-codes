//
//  ViewController.m
//  Deleting Cells and Sections from Table Views
//
//  Created by Vandad Nahavandipoor on 12/11/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

static NSString *SectionOddNumbers = @"Odd Numbers";
static NSString *SectionEvenNumbers = @"Even Numbers";

#pragma mark - Table View Data Source
- (NSInteger) numberOfSectionsInTableView:(UITableView *)tableView{
  
  NSInteger result = 0;
  result = [[self.dictionaryOfNumbers allKeys] count];
  return result;
  
}

- (NSInteger) tableView:(UITableView *)tableView
  numberOfRowsInSection:(NSInteger)section{
  
  NSInteger result = 0;
  NSString *sectionNameInDictionary = [[self.dictionaryOfNumbers allKeys] 
                                       objectAtIndex:section];
  NSArray *sectionArray = [self.dictionaryOfNumbers objectForKey:
                           sectionNameInDictionary];
  result = [sectionArray count];
  return result;
  
}

- (UITableViewCell *) tableView:(UITableView *)tableView 
          cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *result = nil;
  
  static NSString *CellIdentifier = @"NumbersCellIdentifier";
  
  result = [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
  
  if (result == nil){
    result = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault 
                                    reuseIdentifier:CellIdentifier];
  }
  
  NSString *sectionNameInDictionary = [[self.dictionaryOfNumbers allKeys] 
                                       objectAtIndex:indexPath.section];
  NSArray *sectionArray = [self.dictionaryOfNumbers objectForKey:
                           sectionNameInDictionary];
  NSNumber *number = [sectionArray objectAtIndex:indexPath.row];
  
  result.textLabel.text = [NSString stringWithFormat:@"%lu", 
                           (unsigned long)[number unsignedIntegerValue]];
  
  return result;
  
}

- (NSString *) tableView:(UITableView *)tableView 
 titleForHeaderInSection:(NSInteger)section{
  
  NSString *result = nil;
  result = [[self.dictionaryOfNumbers allKeys] objectAtIndex:section];  
  return result;
  
}

#pragma mark - Populating the Data Source Dictionary
- (void) constructDictionaryOfNumbers{
  
  self.dictionaryOfNumbers = [[NSMutableDictionary alloc] init];
  
  NSMutableArray *arrayOfEvenNumbers = [[NSMutableArray alloc] initWithObjects:
                                        [NSNumber numberWithUnsignedInteger:0],
                                        [NSNumber numberWithUnsignedInteger:2],
                                        [NSNumber numberWithUnsignedInteger:4],
                                        [NSNumber numberWithUnsignedInteger:6], 
                                        nil];
  
  NSMutableArray *arrayOfOddNumbers = [[NSMutableArray alloc] initWithObjects:
                                       [NSNumber numberWithUnsignedInteger:1],
                                       [NSNumber numberWithUnsignedInteger:3],
                                       [NSNumber numberWithUnsignedInteger:5],
                                       [NSNumber numberWithUnsignedInteger:7], 
                                       nil];
  
  [self.dictionaryOfNumbers setObject:arrayOfEvenNumbers 
                             forKey:SectionEvenNumbers];
  
  [self.dictionaryOfNumbers setObject:arrayOfOddNumbers 
                             forKey:SectionOddNumbers];
  
}

/* 1 */
//- (void) deleteOddNumbersSection:(id)paramSender{
//  
//  /* First remove the section from our data source */
//  NSString *key = SectionOddNumbers;
//  NSInteger indexForKey = [[self.dictionaryOfNumbers allKeys] 
//                           indexOfObject:key];
//  if (indexForKey == NSNotFound){
//    NSLog(@"Could not find the section in the data source.");
//    return;
//  }
//  [self.dictionaryOfNumbers removeObjectForKey:key];
//  
//  /* Then delete the section from the table view */
//  NSIndexSet *sectionToDelete = [NSIndexSet indexSetWithIndex:indexForKey];
//  [self.tableViewNumbers deleteSections:sectionToDelete
//                     withRowAnimation:UITableViewRowAnimationAutomatic];
//  
//  /* Finally, remove the button from the navigation bar
//   as it is not useful any longer */
//  [self.navigationItem setRightBarButtonItem:nil animated:YES];
//  
//}
//
//- (void)viewDidLoad
//{
//  [super viewDidLoad];
//  
//  [self constructDictionaryOfNumbers];
//  
//  self.barButtonAction = 
//  [[UIBarButtonItem alloc] initWithTitle:@"Delete Odd Numbers"
//                                   style:UIBarButtonItemStylePlain
//                                  target:self
//                                  action:@selector(deleteOddNumbersSection:)];
//  [self.navigationItem setRightBarButtonItem:self.barButtonAction animated:NO];
//  
//  self.tableViewNumbers = [[UITableView alloc] 
//                           initWithFrame:self.view.frame
//                           style:UITableViewStyleGrouped];
//  self.tableViewNumbers.autoresizingMask = UIViewAutoresizingFlexibleWidth | 
//                                           UIViewAutoresizingFlexibleHeight;
//  self.tableViewNumbers.delegate = self;
//  self.tableViewNumbers.dataSource = self;
//  [self.view addSubview:self.tableViewNumbers];
//  
//}

/* 2 */
- (void) deleteNumbersGreaterThan2:(id)paramSender{
  
  NSMutableArray *arrayOfIndexPathsToDelete = [[NSMutableArray alloc] init];
  NSMutableArray *arrayOfNumberObjectsToDelete = [[NSMutableArray alloc] init];
  
  /* Step 1: gather the objects we have to delete from our data source
   and their index paths */
  __block NSUInteger keyIndex = 0;
  [self.dictionaryOfNumbers enumerateKeysAndObjectsUsingBlock:
   ^(NSString *key, NSMutableArray *object, BOOL *stop) {
     
     [object enumerateObjectsUsingBlock:
      ^(NSNumber *number, NSUInteger numberIndex, BOOL *stop) {
        
        if ([number unsignedIntegerValue] > 2){
          NSIndexPath *indexPath = [NSIndexPath indexPathForRow:numberIndex
                                                      inSection:keyIndex];
          [arrayOfIndexPathsToDelete addObject:indexPath];
          [arrayOfNumberObjectsToDelete addObject:number];
        }
        
     }];
     
     keyIndex++;
  }];
  
  /* Step 2: delete the objects from the data source */
  if ([arrayOfNumberObjectsToDelete count] > 0){
    NSMutableArray *arrayOfOddNumbers = [self.dictionaryOfNumbers 
                                         objectForKey:SectionOddNumbers];
    NSMutableArray *arrayOfEvenNumbers = [self.dictionaryOfNumbers
                                          objectForKey:SectionEvenNumbers];
    [arrayOfNumberObjectsToDelete enumerateObjectsUsingBlock:
     ^(NSNumber *numberToDelete, NSUInteger idx, BOOL *stop) {
       if ([arrayOfOddNumbers indexOfObject:numberToDelete] != NSNotFound){
         [arrayOfOddNumbers removeObject:numberToDelete];
       }
       if ([arrayOfEvenNumbers indexOfObject:numberToDelete] != NSNotFound){
         [arrayOfEvenNumbers removeObject:numberToDelete];
       }
       [arrayOfEvenNumbers removeObject:numberToDelete];
    }];
  }
  
  /* Step 3: delete the cells that correspond to the objects */
  NSArray *arrayOfPaths = [[NSArray alloc] 
                           initWithArray:arrayOfIndexPathsToDelete];
  [self.tableViewNumbers 
   deleteRowsAtIndexPaths:arrayOfPaths
   withRowAnimation:UITableViewRowAnimationAutomatic];
  
  [self.navigationItem setRightBarButtonItem:nil animated:YES];
  
}

- (void)viewDidLoad
{
  [super viewDidLoad];
  
  [self constructDictionaryOfNumbers];
  
  self.barButtonAction = 
  [[UIBarButtonItem alloc] initWithTitle:@"Delete Numbers > 2"
                                   style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(deleteNumbersGreaterThan2:)];
  [self.navigationItem setRightBarButtonItem:self.barButtonAction animated:NO];
  
  self.tableViewNumbers = [[UITableView alloc] 
                         initWithFrame:self.view.frame
                         style:UITableViewStyleGrouped];
  self.tableViewNumbers.autoresizingMask = UIViewAutoresizingFlexibleWidth | 
  UIViewAutoresizingFlexibleHeight;
  self.tableViewNumbers.delegate = self;
  self.tableViewNumbers.dataSource = self;
  [self.view addSubview:self.tableViewNumbers];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation:
        (UIInterfaceOrientation)interfaceOrientation
{
  return YES;
}

@end
