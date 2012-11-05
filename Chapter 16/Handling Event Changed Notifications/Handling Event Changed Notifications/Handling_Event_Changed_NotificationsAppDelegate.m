//
//  Handling_Event_Changed_NotificationsAppDelegate.m
//  Handling Event Changed Notifications
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Handling_Event_Changed_NotificationsAppDelegate.h"

@implementation Handling_Event_Changed_NotificationsAppDelegate

- (EKCalendar *)
    calDAVCalendarWithTitleContaining:(NSString *)paramDescription
                         inEventStore:(EKEventStore *)paramEventStore{
  
  EKCalendar *result = nil;
  
  for (EKCalendar *thisCalendar in paramEventStore.calendars){
    if (thisCalendar.type == EKCalendarTypeCalDAV){
      if ([thisCalendar.title 
           rangeOfString:paramDescription].location != NSNotFound){
        return thisCalendar;
      }
    }
  }
  
  return result;
  
}

- (void) eventsChanged:(NSNotification *)paramNotification{
  
  NSMutableArray *invalidatedEvents = [[NSMutableArray alloc] init];
  
  NSLog(@"Refreshing array of events...");
  
  for (EKEvent *event in self.eventsForOneYear){
    if ([event refresh] == NO){
      [invalidatedEvents addObject:event];
    }
  }
  
  if ([invalidatedEvents count] > 0){
    [self.eventsForOneYear removeObjectsInArray:invalidatedEvents];
  }
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  self.eventStore = [[EKEventStore alloc] init];
  
  EKCalendar *calendar = 
  [self calDAVCalendarWithTitleContaining:@"vandad.np@gmail.com"
                             inEventStore:self.eventStore];
  
  NSTimeInterval NSOneYear = 1 * 365 * 24 * 60 * 60;
  
  NSDate *startDate = [NSDate date];
  NSDate *endDate = [startDate dateByAddingTimeInterval:NSOneYear];
  
  NSArray *calendars = [[NSArray alloc] initWithObjects:calendar, nil];
  
  NSPredicate *predicate = 
  [self.eventStore predicateForEventsWithStartDate:startDate
                                           endDate:endDate
                                         calendars:calendars];
  
  NSArray *events = [self.eventStore eventsMatchingPredicate:predicate];
  
  self.eventsForOneYear = [[NSMutableArray alloc] initWithArray:events];
  
  [[NSNotificationCenter defaultCenter] 
   addObserver:self
   selector:@selector(eventsChanged:)
   name:EKEventStoreChangedNotification
   object:nil];
  
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
