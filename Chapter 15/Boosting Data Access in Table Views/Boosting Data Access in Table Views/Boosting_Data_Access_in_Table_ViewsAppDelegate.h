//
//  Boosting_Data_Access_in_Table_ViewsAppDelegate.h
//  Boosting Data Access in Table Views
//
//  Created by Vandad Nahavandipoor on 23/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class PersonListViewController;

@interface Boosting_Data_Access_in_Table_ViewsAppDelegate 
           : UIResponder <UIApplicationDelegate>

@property (strong, nonatomic) UIWindow *window;

@property (nonatomic, strong) 
  PersonListViewController *personListViewController;

@property (nonatomic, strong) UINavigationController *navigationController;

@property (readonly, strong, nonatomic)
  NSManagedObjectContext *managedObjectContext;

@property (readonly, strong, nonatomic)
  NSManagedObjectModel *managedObjectModel;

@property (readonly, strong, nonatomic)
  NSPersistentStoreCoordinator *persistentStoreCoordinator;

- (void)saveContext;
- (NSURL *)applicationDocumentsDirectory;

@end
