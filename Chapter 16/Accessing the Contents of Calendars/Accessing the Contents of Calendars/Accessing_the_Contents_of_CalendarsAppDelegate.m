//
//  Accessing_the_Contents_of_CalendarsAppDelegate.m
//  Accessing the Contents of Calendars
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Accessing_the_Contents_of_CalendarsAppDelegate.h"

@implementation Accessing_the_Contents_of_CalendarsAppDelegate

- (EKCalendar *) calDAVCalendarWithTitleContaining
                 :(NSString *)paramDescription{
  
  EKCalendar *result = nil;
  
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  for (EKCalendar *thisCalendar in eventStore.calendars){
    if (thisCalendar.type == EKCalendarTypeCalDAV){
      if ([thisCalendar.title 
           rangeOfString:paramDescription].location != NSNotFound){
        return thisCalendar;
      }
    }
  }
  
  return result;
  
}

- (void) readEvents{
  
  /* Find a calendar to base our search on */
  EKCalendar *targetCalendar = 
    [self calDAVCalendarWithTitleContaining:@"gmail.com"];
  
  /* If we could not find a CalDAV calendar that we were looking for,
   then we will abort the operation */
  if (targetCalendar == nil){
    NSLog(@"No CalDAV calendars were found.");
    return;
  }
  
  /* We have to pass an array of calendars to the event store to search */
  NSArray *targetCalendars = [[NSArray alloc] initWithObjects:
                              targetCalendar, nil];
  
  /* Instantiate the event store */
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  /* The start date will be today */
  NSDate *startDate = [NSDate date];
  
  /* The end date will be 1 day from today */
  NSDate *endDate = [startDate dateByAddingTimeInterval:24 * 60 * 60];
  
  /* Create the predicate that we can later pass to the
   event store in order to fetch the events */
  NSPredicate *searchPredicate =
  [eventStore predicateForEventsWithStartDate:startDate
                                      endDate:endDate
                                    calendars:targetCalendars];
  
  /* Make sure we succeeded in creating the predicate */
  if (searchPredicate == nil){
    NSLog(@"Could not create the search predicate.");
    return;
  }
  
  /* Fetch all the events that fall between
   the starting and the ending dates */
  NSArray *events = [eventStore eventsMatchingPredicate:searchPredicate];
  
  /* Go through all the events and print their information 
   out to the console */
  if (events != nil){
    
    NSUInteger counter = 1;
    for (EKEvent *event in events){
      
      NSLog(@"Event %lu Start Date = %@",
            (unsigned long)counter,
            event.startDate);
      
      NSLog(@"Event %lu End Date = %@",
            (unsigned long)counter,
            event.endDate);
      
      NSLog(@"Event %lu Title = %@",
            (unsigned long)counter,
            event.title);
      
      counter++;
    }
    
  } else {
    NSLog(@"The array of events for this start/end time is nil.");
  }
  
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  [self readEvents];
  
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
