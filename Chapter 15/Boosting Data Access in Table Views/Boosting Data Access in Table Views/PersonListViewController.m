//
//  PersonListViewController.m
//  Boosting Data Access in Table Views
//
//  Created by Vandad Nahavandipoor on 23/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "PersonListViewController.h"
#import "AddPersonViewController.h"
#import "Boosting_Data_Access_in_Table_ViewsAppDelegate.h"
#import "Person.h"

@implementation PersonListViewController

- (NSManagedObjectContext *) managedObjectContext{
  
  Boosting_Data_Access_in_Table_ViewsAppDelegate *appDelegate = 
    (Boosting_Data_Access_in_Table_ViewsAppDelegate *)
      [[UIApplication sharedApplication] delegate];
  
  NSManagedObjectContext *managedObjectContext = 
    appDelegate.managedObjectContext;
  
  return managedObjectContext;
  
}

- (void)controllerDidChangeContent:(NSFetchedResultsController *)controller{
  [self.tableViewPersons reloadData];
}

- (id) initWithNibName:(NSString *)nibNameOrNil
                bundle:(NSBundle *)nibBundleOrNil{
  
  self = [super initWithNibName:nibNameOrNil
                         bundle:nibBundleOrNil];
  
  if (self != nil){
    
    /* Create the fetch request first */
    NSFetchRequest *fetchRequest = [[NSFetchRequest alloc] init];
    
    /* Here is the entity whose contents we want to read */
    NSEntityDescription *entity = 
    [NSEntityDescription entityForName:@"Person"
                inManagedObjectContext:[self managedObjectContext]];
    
    NSSortDescriptor *ageSort = 
    [[NSSortDescriptor alloc] initWithKey:@"age"
                                ascending:YES];
    
    NSSortDescriptor *firstNameSort = 
    [[NSSortDescriptor alloc] initWithKey:@"firstName"
                                ascending:YES];
    
    NSArray *sortDescriptors = [[NSArray alloc] initWithObjects:
                                ageSort,
                                firstNameSort, nil];
    
    fetchRequest.sortDescriptors = sortDescriptors;
    
    /* Tell the request that we want to read the contents of the Person entity */
    [fetchRequest setEntity:entity];
    
    self.personsFRC = 
    [[NSFetchedResultsController alloc] 
     initWithFetchRequest:fetchRequest
     managedObjectContext:[self managedObjectContext]
     sectionNameKeyPath:nil
     cacheName:nil];
    
    self.personsFRC.delegate = self;
    NSError *fetchingError = nil;
    if ([self.personsFRC performFetch:&fetchingError]){
      NSLog(@"Successfully fetched.");
    } else {
      NSLog(@"Failed to fetch.");
    }
    
  }
  
  return self;
  
}

- (NSInteger)tableView:(UITableView *)tableView 
 numberOfRowsInSection:(NSInteger)section{
  
  id <NSFetchedResultsSectionInfo> sectionInfo = [self.personsFRC.sections
                                                  objectAtIndex:section];
  return [sectionInfo numberOfObjects];
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView 
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  
  UITableViewCell *result = nil;
  
  static NSString *PersonTableViewCell = @"PersonTableViewCell";
  
  result = [tableView dequeueReusableCellWithIdentifier:PersonTableViewCell];
  
  if (result == nil){
    result = 
    [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle
                           reuseIdentifier:PersonTableViewCell];
    
    result.selectionStyle = UITableViewCellSelectionStyleNone;
    
  }
  
  Person *person = [self.personsFRC objectAtIndexPath:indexPath];
  
  result.textLabel.text = 
    [person.firstName stringByAppendingFormat:@" %@", person.lastName];
  
  result.detailTextLabel.text = 
  [NSString stringWithFormat:@"Age: %lu",
   (unsigned long)[person.age unsignedIntegerValue]];
  
  return result;
}

- (void) addNewPerson:(id)paramSender{
  
  AddPersonViewController *controller = [[AddPersonViewController alloc]
                                         initWithNibName:nil
                                         bundle:nil];
  [self.navigationController pushViewController:controller
                                       animated:YES];
  
}

- (void)    tableView:(UITableView *)tableView 
   commitEditingStyle:(UITableViewCellEditingStyle)editingStyle 
    forRowAtIndexPath:(NSIndexPath *)indexPath{
  
  Person *personToDelete = [self.personsFRC objectAtIndexPath:indexPath];
  
  /* Very important: we need to make sure we are not reloading the table view
   while deleting the managed object */
  self.personsFRC.delegate = nil;
  
  [[self managedObjectContext] deleteObject:personToDelete];
  
  if ([personToDelete isDeleted]){
    NSError *savingError = nil;
    if ([[self managedObjectContext] save:&savingError]){
      
      NSError *fetchingError = nil;
      if ([self.personsFRC performFetch:&fetchingError]){
        NSLog(@"Successfully fetched.");
        
        NSArray *rowsToDelete = [[NSArray alloc] 
                                 initWithObjects:indexPath, nil];
        
        [tableViewPersons 
         deleteRowsAtIndexPaths:rowsToDelete
         withRowAnimation:UITableViewRowAnimationAutomatic];
        
      } else {
        NSLog(@"Failed to fetch with error = %@", fetchingError);
      }
      
    } else {
      NSLog(@"Failed to save the context with error = %@", savingError);
    }
  }
  
  self.personsFRC.delegate = self;
  
}

- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView
           editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath{
  return UITableViewCellEditingStyleDelete;
}

- (void) setEditing:(BOOL)paramEditing
           animated:(BOOL)paramAnimated{
  
  [super setEditing:paramEditing
           animated:paramAnimated];
  
  if (paramEditing){
    [self.navigationItem setRightBarButtonItem:nil
                                      animated:YES];
  } else {
    [self.navigationItem setRightBarButtonItem:self.barButtonAddPerson
                                      animated:YES];
  }
  
  [self.tableViewPersons setEditing:paramEditing
                           animated:YES];
  
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.title = @"Persons";
  
  self.tableViewPersons = 
  [[UITableView alloc] initWithFrame:self.view.bounds
                               style:UITableViewStylePlain];
  self.tableViewPersons.delegate = self;
  self.tableViewPersons.dataSource = self;
  
  [self.view addSubview:self.tableViewPersons];
  
  self.barButtonAddPerson = [[UIBarButtonItem alloc] 
                             initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                             target:self
                             action:@selector(addNewPerson:)];
  
  [self.navigationItem setLeftBarButtonItem:[self editButtonItem]
                                   animated:NO];
  [self.navigationItem setRightBarButtonItem:self.barButtonAddPerson
                                    animated:NO];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
