//
//  Grouping_Tasks_Together_with_GCDAppDelegate.m
//  Grouping Tasks Together with GCD
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Grouping_Tasks_Together_with_GCDAppDelegate.h"

void reloadAllComponents(void *context);

@implementation Grouping_Tasks_Together_with_GCDAppDelegate

- (void) reloadTableView{
  /* Reload the table view here */
  NSLog(@"%s", __FUNCTION__);
}

- (void) reloadScrollView{
  /* Do the work here */
  NSLog(@"%s", __FUNCTION__);
}

- (void) reloadImageView{
  /* Reload the image view here */
  NSLog(@"%s", __FUNCTION__);
}

void reloadAllComponents(void *context){
  
  Grouping_Tasks_Together_with_GCDAppDelegate *self = 
    (__bridge Grouping_Tasks_Together_with_GCDAppDelegate *)context;
  
  [self reloadTableView];
  [self reloadScrollView];
  [self reloadImageView];
  
}

- (BOOL)              application:(UIApplication *)application 
    didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  dispatch_group_t taskGroup =  dispatch_group_create();
  dispatch_queue_t mainQueue =  dispatch_get_main_queue();
  
  dispatch_group_async_f(taskGroup, 
                         mainQueue, 
                         (__bridge void *)self, 
                         reloadAllComponents);
  
  /* At the end when we are done, dispatch the following block */
  dispatch_group_notify(taskGroup, mainQueue, ^{
    /* Do some processing here */
    [[[UIAlertView alloc] initWithTitle:@"Finished"
                                message:@"All tasks are finished"
                               delegate:nil 
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
    
  });
  
  /* We are done with the group */
  dispatch_release(taskGroup);
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

//- (BOOL)            application:(UIApplication *)application
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  dispatch_group_t taskGroup =  dispatch_group_create();
//  dispatch_queue_t mainQueue =  dispatch_get_main_queue();
//  
//  /* Reload the table view on the main queue */
//  dispatch_group_async(taskGroup, mainQueue, ^{
//    [self reloadTableView];
//  });
//  
//  /* Reload the scroll view on the main queue */
//  dispatch_group_async(taskGroup, mainQueue, ^{
//    [self reloadScrollView];
//  });
//  
//  /* Reload the image view on the main queue */
//  dispatch_group_async(taskGroup, mainQueue, ^{
//    [self reloadImageView];
//  });
//  
//  /* At the end when we are done, dispatch the following block */
//  dispatch_group_notify(taskGroup, mainQueue, ^{
//    /* Do some processing here */
//    [[[UIAlertView alloc] initWithTitle:@"Finished"
//                                message:@"All tasks are finished"
//                               delegate:nil 
//                      cancelButtonTitle:@"OK"
//                      otherButtonTitles:nil, nil] show];
//    
//  });
//  
//  /* We are done with the group */
//  dispatch_release(taskGroup);
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}

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
