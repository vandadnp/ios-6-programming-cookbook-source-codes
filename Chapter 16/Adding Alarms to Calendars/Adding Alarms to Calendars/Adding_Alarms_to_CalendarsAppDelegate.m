//
//  Adding_Alarms_to_CalendarsAppDelegate.m
//  Adding Alarms to Calendars
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Adding_Alarms_to_CalendarsAppDelegate.h"

@implementation Adding_Alarms_to_CalendarsAppDelegate

- (EKCalendar *)  getFirstModifiableLocalCalendar{
  
  EKCalendar *result = nil;
  
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  for (EKCalendar *thisCalendar in eventStore.calendars){
    if (thisCalendar.type == EKCalendarTypeLocal &&
        [thisCalendar allowsContentModifications]){
      return thisCalendar;
    }
  }
  
  return result;
  
}

- (void) addAlarmToCalendar{
  
  EKCalendar *targetCalendar = [self getFirstModifiableLocalCalendar];
  
  if (targetCalendar == nil){
    NSLog(@"Could not find the target calendar.");
    return;
  }
  
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  /* The event starts 60 seconds from now */
  NSDate *startDate = [NSDate dateWithTimeIntervalSinceNow:60.0f];
  
  /* And end the event 20 seconds after its start date */
  NSDate *endDate = [startDate dateByAddingTimeInterval:20.0f];
  
  EKEvent *eventWithAlarm = [EKEvent eventWithEventStore:eventStore];
  
  eventWithAlarm.calendar = targetCalendar;
  eventWithAlarm.startDate = startDate;
  eventWithAlarm.endDate = endDate;
  
  /* The alarm goes off 2 seconds before the event happens */
  EKAlarm *alarm = [EKAlarm alarmWithRelativeOffset:-2.0f];
  
  eventWithAlarm.title = @"Event with Alarm";
  [eventWithAlarm addAlarm:alarm];
  
  NSError *saveError = nil;
  
  if ([eventStore saveEvent:eventWithAlarm
                       span:EKSpanThisEvent
                      error:&saveError]){
    NSLog(@"Saved an event that fires 60 seconds from now.");
  } else {
    NSLog(@"Failed to save the event. Error = %@", saveError);
  }
  
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  [self addAlarmToCalendar];
  
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
