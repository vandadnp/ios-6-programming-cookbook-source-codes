//
//  AddPersonViewController.m
//  Boosting Data Access in Table Views
//
//  Created by Vandad Nahavandipoor on 23/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "AddPersonViewController.h"
#import "Person.h"
#import "Boosting_Data_Access_in_Table_ViewsAppDelegate.h"

@implementation AddPersonViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
  self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
  if (self) {
    // Custom initialization
  }
  return self;
}

- (void) createNewPerson:(id)paramSender{
  
  Boosting_Data_Access_in_Table_ViewsAppDelegate *appDelegate = 
    (Boosting_Data_Access_in_Table_ViewsAppDelegate *)
      [[UIApplication sharedApplication] delegate];
  
  NSManagedObjectContext *managedObjectContext = 
    appDelegate.managedObjectContext;
  
  Person *newPerson = 
  [NSEntityDescription insertNewObjectForEntityForName:@"Person"
                                inManagedObjectContext:managedObjectContext];
  
  if (newPerson != nil){
    
    newPerson.firstName = self.textFieldFirstName.text;
    newPerson.lastName = self.textFieldLastName.text;
    newPerson.age = [NSNumber numberWithInteger:
                     [self.textFieldAge.text integerValue]];
    
    NSError *savingError = nil;
    
    if ([managedObjectContext save:&savingError]){
      [self.navigationController popViewControllerAnimated:YES];
    } else {
      NSLog(@"Failed to save the managed object context.");
    }
    
  } else {
    NSLog(@"Failed to create the new person object.");
  }
  
}

- (void)didReceiveMemoryWarning
{
  // Releases the view if it doesn't have a superview.
  [super didReceiveMemoryWarning];
  
  // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle


- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.title = @"New Person";
  
  CGRect textFieldRect = CGRectMake(20.0f, 
                                    20.0f, 
                                    self.view.bounds.size.width - 40.0f, 
                                    31.0f);
  
  self.textFieldFirstName = [[UITextField alloc] initWithFrame:textFieldRect];
  self.textFieldFirstName.placeholder = @"First Name";
  self.textFieldFirstName.borderStyle = UITextBorderStyleRoundedRect;
  self.textFieldFirstName.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  self.textFieldFirstName.contentVerticalAlignment = 
    UIControlContentVerticalAlignmentCenter;
  [self.view addSubview:self.textFieldFirstName];
  
  textFieldRect.origin.y += 37.0f;
  self.textFieldLastName = [[UITextField alloc] initWithFrame:textFieldRect];
  self.textFieldLastName.placeholder = @"Last Name";
  self.textFieldLastName.borderStyle = UITextBorderStyleRoundedRect;
  self.textFieldLastName.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  self.textFieldLastName.contentVerticalAlignment = 
    UIControlContentVerticalAlignmentCenter;
  [self.view addSubview:self.textFieldLastName];
  
  textFieldRect.origin.y += 37.0f;
  self.textFieldAge = [[UITextField alloc] initWithFrame:textFieldRect];
  self.textFieldAge.placeholder = @"Age";
  self.textFieldAge.borderStyle = UITextBorderStyleRoundedRect;
  self.textFieldAge.autoresizingMask = UIViewAutoresizingFlexibleWidth;
  self.textFieldAge.keyboardType = UIKeyboardTypeNumberPad;
  self.textFieldAge.contentVerticalAlignment = 
    UIControlContentVerticalAlignmentCenter;
  [self.view addSubview:self.textFieldAge];
  
  self.barButtonAdd = 
  [[UIBarButtonItem alloc] initWithTitle:@"Add"
                                   style:UIBarButtonItemStylePlain
                                  target:self
                                  action:@selector(createNewPerson:)];
  [self.navigationItem setRightBarButtonItem:self.barButtonAdd
                                    animated:NO];
  
}

- (void) viewDidAppear:(BOOL)paramAnimated{
  [super viewDidAppear:paramAnimated];
  [self.textFieldFirstName becomeFirstResponder];
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
