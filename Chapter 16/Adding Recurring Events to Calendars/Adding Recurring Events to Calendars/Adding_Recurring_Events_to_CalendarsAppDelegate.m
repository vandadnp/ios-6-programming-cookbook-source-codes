//
//  Adding_Recurring_Events_to_CalendarsAppDelegate.m
//  Adding Recurring Events to Calendars
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Adding_Recurring_Events_to_CalendarsAppDelegate.h"

@implementation Adding_Recurring_Events_to_CalendarsAppDelegate

- (void) createRecurringEventInLocalCalendar{
  
  /* Step 1: And now the event store */
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  /* Step 2: Find the first local calendar that is modifiable */
  EKCalendar *targetCalendar = nil;
  
  for (EKCalendar *thisCalendar in eventStore.calendars){
    if (thisCalendar.type == EKCalendarTypeLocal &&
        [thisCalendar allowsContentModifications]){
      targetCalendar = thisCalendar;
    }
  }
  
  /* The target calendar wasn't found? */
  if (targetCalendar == nil){
    NSLog(@"The target calendar is nil.");
    return;
  }
  
  /* Step 3: Create an event */
  EKEvent *event = [EKEvent eventWithEventStore:eventStore];
  
  /* Step 4: Create an event that happens today and happens
   every month for a year from now */
  
  NSDate *eventStartDate = [NSDate date];
  
  /* Step 5: The event's end date is one hour from the moment it is created */
  NSTimeInterval NSOneHour = 1 * 60 * 60;
  NSDate *eventEndDate = [eventStartDate dateByAddingTimeInterval:NSOneHour];
  
  /* Assign the required properties, especially
   the target calendar */
  event.calendar = targetCalendar;
  event.title = @"My Event";
  event.startDate = eventStartDate;
  event.endDate = eventEndDate;
  
  /* The end date of the recurring rule
   is one year from now */
  NSTimeInterval NSOneYear = 365 * 24 * 60 * 60;
  NSDate *oneYearFromNow = [eventStartDate dateByAddingTimeInterval:NSOneYear];
  
  /* Step 6: Create an Event Kit date from this date */
  EKRecurrenceEnd *recurringEnd =
  [EKRecurrenceEnd recurrenceEndWithEndDate:oneYearFromNow];
  
  /* Step 7: And the recurring rule. This event happens every
   month (EKRecurrenceFrequencyMonthly), once a month (interval:1)
   and the recurring rule ends a year from now (end:RecurringEnd) */
  
  EKRecurrenceRule *recurringRule =
  [[EKRecurrenceRule alloc]
   initRecurrenceWithFrequency:EKRecurrenceFrequencyMonthly
   interval:1
   end:recurringEnd];
  
  /* Step 8: Set the recurring rule for the event */
  event.recurrenceRules = [[NSArray alloc] initWithObjects:recurringRule, nil];
  
  NSError *saveError = nil;
  
  /* Step 9: Save the event */
  if ([eventStore saveEvent:event
                       span:EKSpanFutureEvents
                      error:&saveError]){
    NSLog(@"Successfully created the recurring event.");
  } else {
    NSLog(@"Failed to create the recurring event %@", saveError);
  }
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  [self createRecurringEventInLocalCalendar];
  
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
