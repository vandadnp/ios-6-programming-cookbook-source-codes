//
//  AppDelegate.m
//  Searching the Address Book
//
//  Created by Vandad Nahavandipoor on 21/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "AppDelegate.h"

NSString *const kDenied = @"Access to address book is denied";
NSString *const kRestricted = @"Access to address book is restricted";

ABAddressBookRef addressBook;

@implementation AppDelegate

- (BOOL) doesPersonExistWithFirstName:(NSString *)paramFirstName
                             lastName:(NSString *)paramLastName
                        inAddressBook:(ABRecordRef)paramAddressBook{
    
    BOOL result = NO;
    
    if (paramAddressBook == NULL){
        NSLog(@"The address book is null.");
        return NO;
    }
    
    NSArray *allPeople = (__bridge_transfer NSArray *)
    ABAddressBookCopyArrayOfAllPeople(paramAddressBook);
    
    NSUInteger peopleCounter = 0;
    for (peopleCounter = 0;
         peopleCounter < [allPeople count];
         peopleCounter++){
        
        ABRecordRef person = (__bridge ABRecordRef)
        [allPeople objectAtIndex:peopleCounter];
        
        NSString *firstName = (__bridge_transfer NSString *)
        ABRecordCopyValue(person, kABPersonFirstNameProperty);
        
        NSString *lastName = (__bridge_transfer NSString *)
        ABRecordCopyValue(person, kABPersonLastNameProperty);
        
        BOOL firstNameIsEqual = NO;
        BOOL lastNameIsEqual = NO;
        
        if ([firstName length] == 0 &&
            [paramFirstName length] == 0){
            firstNameIsEqual = YES;
        }
        else if ([firstName isEqualToString:paramFirstName]){
            firstNameIsEqual = YES;
        }
        
        if ([lastName length] == 0 &&
            [paramLastName length] == 0){
            lastNameIsEqual = YES;
        }
        else if ([lastName isEqualToString:paramLastName]){
            lastNameIsEqual = YES;
        }
        
        if (firstNameIsEqual &&
            lastNameIsEqual){
            return YES;
        }
        
    }
    
    return result;
    
}

- (BOOL) doesGroupExistWithGroupName:(NSString *)paramGroupName
                       inAddressBook:(ABAddressBookRef)paramAddressBook{
    
    BOOL result = NO;
    
    if (paramAddressBook == NULL){
        NSLog(@"The address book is null.");
        return NO;
    }
    
    NSArray *allGroups = (__bridge_transfer NSArray *)
    ABAddressBookCopyArrayOfAllGroups(paramAddressBook);
    
    NSUInteger groupCounter = 0;
    for (groupCounter = 0;
         groupCounter < [allGroups count];
         groupCounter++){
        
        ABRecordRef group = (__bridge ABRecordRef)
        [allGroups objectAtIndex:groupCounter];
        
        NSString *groupName = (__bridge_transfer NSString *)
        ABRecordCopyValue(group, kABGroupNameProperty);
        
        if ([groupName length] == 0 &&
            [paramGroupName length] == 0){
            return YES;
        }
        
        else if ([groupName isEqualToString:paramGroupName]){
            return YES;
        }
        
    }
    
    return result;
    
}

/* 1 */
//- (ABRecordRef) newGroupWithName:(NSString *)paramGroupName
//                   inAddressBook:(ABAddressBookRef)paramAddressBook{
//  
//  ABRecordRef result = NULL;
//  
//  if (paramAddressBook == NULL){
//    NSLog(@"The address book is nil.");
//    return NULL;
//  }
//  
//  result = ABGroupCreate();
//  
//  if (result == NULL){
//    NSLog(@"Failed to create a new group.");
//    return NULL;
//  }
//  
//  BOOL couldSetGroupName = NO;
//  CFErrorRef error = NULL;
//  
//  couldSetGroupName = ABRecordSetValue(result,
//                                       kABGroupNameProperty,
//                                       (__bridge CFTypeRef)paramGroupName,
//                                       &error);
//  
//  if (couldSetGroupName){
//    
//    BOOL couldAddRecord = NO;
//    CFErrorRef couldAddRecordError = NULL;
//    
//    couldAddRecord = ABAddressBookAddRecord(paramAddressBook, 
//                                            result,
//                                            &couldAddRecordError);
//    
//    if (couldAddRecord){
//      
//      NSLog(@"Successfully added the new group.");
//      
//      if (ABAddressBookHasUnsavedChanges(paramAddressBook)){
//        BOOL couldSaveAddressBook = NO;
//        CFErrorRef couldSaveAddressBookError = NULL;
//        couldSaveAddressBook = ABAddressBookSave(paramAddressBook, 
//                                                 &couldSaveAddressBookError);
//        if (couldSaveAddressBook){
//          NSLog(@"Successfully saved the address book.");
//        } else {
//          CFRelease(result);
//          result = NULL;
//          NSLog(@"Failed to save the address book.");
//        }
//      } else {
//        CFRelease(result);
//        result = NULL;
//        NSLog(@"No unsaved changes.");
//      }
//    } else {
//      CFRelease(result);
//      result = NULL;
//      NSLog(@"Could not add a new group.");
//    }
//  } else {
//    CFRelease(result);
//    result = NULL;
//    NSLog(@"Failed to set the name of the group.");
//  }
//  
//  return result;
//  
//}
//
//- (void) displayMessage:(NSString *)paramMessage{
//    [[[UIAlertView alloc] initWithTitle:nil
//                                message:paramMessage
//                               delegate:nil
//                      cancelButtonTitle:@"OK"
//                      otherButtonTitles:nil] show];
//}
//
//- (void) createGroupInAddressBook:(ABAddressBookRef)paramAddressBook{
//    
//    if ([self doesGroupExistWithGroupName:@"O'Reilly"
//                            inAddressBook:addressBook]){
//        NSLog(@"The O'Reilly group already exists in the address book.");
//    } else {
//        
//        ABRecordRef oreillyGroup = [self newGroupWithName:@"O'Reilly"
//                                            inAddressBook:addressBook];
//        
//        if (oreillyGroup != NULL){
//            NSLog(@"Successfully created a group for O'Reilly.");
//            CFRelease(oreillyGroup);
//        } else {
//            NSLog(@"Failed to create a group for O'Reilly.");
//        }
//        
//    }
//    
//}
//
//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//    
//    CFErrorRef error = NULL;
//    
//    switch (ABAddressBookGetAuthorizationStatus()){
//        case kABAuthorizationStatusAuthorized:{
//            addressBook = ABAddressBookCreateWithOptions(NULL, &error);
//            [self createGroupInAddressBook:addressBook];
//            if (addressBook != NULL){
//                CFRelease(addressBook);
//            }
//            break;
//        }
//        case kABAuthorizationStatusDenied:{
//            [self displayMessage:kDenied];
//            break;
//        }
//        case kABAuthorizationStatusNotDetermined:{
//            addressBook = ABAddressBookCreateWithOptions(NULL, &error);
//            ABAddressBookRequestAccessWithCompletion
//            (addressBook, ^(bool granted, CFErrorRef error) {
//                if (granted){
//                    [self createGroupInAddressBook:addressBook];
//                } else {
//                    NSLog(@"Access was not granted");
//                }
//                if (addressBook != NULL){
//                    CFRelease(addressBook);
//                }
//            });
//            break;
//        }
//        case kABAuthorizationStatusRestricted:{
//            [self displayMessage:kRestricted];
//            break;
//        }
//    }
//    
//    self.window = [[UIWindow alloc]
//                   initWithFrame:[[UIScreen mainScreen] bounds]];
//    self.window.backgroundColor = [UIColor whiteColor];
//    [self.window makeKeyAndVisible];
//    return YES;
//    
//}

/* 2 */
- (ABRecordRef) newPersonWithFirstName:(NSString *)paramFirstName
                              lastName:(NSString *)paramLastName
                         inAddressBook:(ABAddressBookRef)paramAddressBook{
  
  ABRecordRef result = NULL;
  
  if (paramAddressBook == NULL){
    NSLog(@"The address book is NULL.");
    return NULL;
  }
  
  if ([paramFirstName length] == 0 &&
      [paramLastName length] == 0){
    NSLog(@"First name and last name are both empty.");
    return NULL;
  }
  
  result = ABPersonCreate();
  
  if (result == NULL){
    NSLog(@"Failed to create a new person.");
    return NULL;
  }
  
  BOOL couldSetFirstName = NO;
  BOOL couldSetLastName = NO;
  CFErrorRef setFirstNameError = NULL;
  CFErrorRef setLastNameError = NULL;
  
  couldSetFirstName = ABRecordSetValue(result,
                                       kABPersonFirstNameProperty,
                                       (__bridge CFTypeRef)paramFirstName,
                                       &setFirstNameError);
  
  couldSetLastName = ABRecordSetValue(result,
                                      kABPersonLastNameProperty,
                                      (__bridge CFTypeRef)paramLastName,
                                      &setLastNameError);
  
  CFErrorRef couldAddPersonError = NULL;
  BOOL couldAddPerson = ABAddressBookAddRecord(paramAddressBook,
                                               result,
                                               &couldAddPersonError);
  
  if (couldAddPerson){
    NSLog(@"Successfully added the person.");
  } else {
    NSLog(@"Failed to add the person.");
    CFRelease(result);
    result = NULL;
    return result;
  }
  
  if (ABAddressBookHasUnsavedChanges(paramAddressBook)){
    
    CFErrorRef couldSaveAddressBookError = NULL;
    BOOL couldSaveAddressBook = ABAddressBookSave(paramAddressBook, 
                                                  &couldSaveAddressBookError);
    
    if (couldSaveAddressBook){
      NSLog(@"Successfully saved the address book.");
    } else {
      NSLog(@"Failed to save the address book.");
    }
  }
  
  if (couldSetFirstName &&
      couldSetLastName){
    NSLog(@"Successfully set the first name and the last name of the person.");
  } else {
    NSLog(@"Failed to set the first name and/or last name of the person.");
  }
  
  return result;
  
}

- (BOOL) doesPersonExistWithFullName:(NSString *)paramFullName
                       inAddressBook:(ABAddressBookRef)paramAddressBook{
    
    BOOL result = NO;
    
    if (paramAddressBook == NULL){
        NSLog(@"Address book is null.");
        return NO;
    }
    
    NSArray *allPeopleWithThisName = (__bridge_transfer NSArray *)
    ABAddressBookCopyPeopleWithName(paramAddressBook,
                                    (__bridge CFStringRef)paramFullName);
    
    if ([allPeopleWithThisName count] > 0){
        result = YES;
    }
    
    return result;
    
}

- (void) displayMessage:(NSString *)paramMessage{
    [[[UIAlertView alloc] initWithTitle:nil
                                message:paramMessage
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil] show];
}

- (void) createPersonInAddressBook:(ABAddressBookRef)paramAddressBook{
    
    if ([self doesPersonExistWithFullName:@"Anthony Robbins"
                            inAddressBook:addressBook]){
        NSLog(@"Anthony Robbins exists in the address book.");
    } else {
        NSLog(@"Anthony Robbins does not exist in the address book.");
        
        ABRecordRef anthonyRobbins = [self newPersonWithFirstName:@"Anthony"
                                                         lastName:@"Robbins"
                                                    inAddressBook:addressBook];
        
        if (anthonyRobbins != NULL){
            NSLog(@"Successfully created a record for Anthony Robbins");
            CFRelease(anthonyRobbins);
        } else {
            NSLog(@"Failed to create a record for Anthony Robbins");
        }
    }
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{

    CFErrorRef error = NULL;

    switch (ABAddressBookGetAuthorizationStatus()){
        case kABAuthorizationStatusAuthorized:{
            addressBook = ABAddressBookCreateWithOptions(NULL, &error);
            [self createPersonInAddressBook:addressBook];
            if (addressBook != NULL){
                CFRelease(addressBook);
            }
            break;
        }
        case kABAuthorizationStatusDenied:{
            [self displayMessage:kDenied];
            break;
        }
        case kABAuthorizationStatusNotDetermined:{
            addressBook = ABAddressBookCreateWithOptions(NULL, &error);
            ABAddressBookRequestAccessWithCompletion
            (addressBook, ^(bool granted, CFErrorRef error) {
                if (granted){
                    [self createPersonInAddressBook:addressBook];
                } else {
                    NSLog(@"Access was not granted");
                }
                if (addressBook != NULL){
                    CFRelease(addressBook);
                }
            });
            break;
        }
        case kABAuthorizationStatusRestricted:{
            [self displayMessage:kRestricted];
            break;
        }
    }

    self.window = [[UIWindow alloc]
                   initWithFrame:[[UIScreen mainScreen] bounds]];
    self.window.backgroundColor = [UIColor whiteColor];
    [self.window makeKeyAndVisible];
    return YES;

}


- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
