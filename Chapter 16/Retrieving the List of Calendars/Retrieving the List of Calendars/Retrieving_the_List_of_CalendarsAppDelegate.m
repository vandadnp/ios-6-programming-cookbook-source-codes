//
//  Retrieving_the_List_of_CalendarsAppDelegate.m
//  Retrieving the List of Calendars
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Retrieving_the_List_of_CalendarsAppDelegate.h"

@implementation Retrieving_the_List_of_CalendarsAppDelegate

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  /* These are the calendar types an iOS Device can have. Please note
   that the "type" property of an object of type EKCalendar
   is of type EKCalendarType. The values in the "CalendarTypes"
   array reflect the exact same values in the EKCalendarType
   enumeration, but as NSString values */
  NSArray *calendarTypes = @[
  @"Local",
  @"CalDAV",
  @"Exchange",
  @"Subscription",
  @"Birthday"
  ];
  
  /* Go through the calendars one by one */
  NSUInteger counter = 1;
  for (EKCalendar *thisCalendar in eventStore.calendars){
    
    /* The title of the calendar */
    NSLog(@"Calendar %lu Title = %@",
          (unsigned long)counter, thisCalendar.title);
    
    /* The type of the calendar */
    NSLog(@"Calendar %lu Type = %@",
          (unsigned long)counter,
          [calendarTypes objectAtIndex:thisCalendar.type]);
    
    /* The color that is associated with the calendar */
    NSLog(@"Calendar %lu Color = %@",
          (unsigned long)counter,
          [UIColor colorWithCGColor:thisCalendar.CGColor]);
    
    /* And whether the calendar can be modified or not */
    if ([thisCalendar allowsContentModifications]){
      NSLog(@"Calendar %lu can be modified.",
            (unsigned long)counter);
    } else {
      NSLog(@"Calendar %lu cannot be modified.",
            (unsigned long)counter);
    }
    
    counter++;
  }
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
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
