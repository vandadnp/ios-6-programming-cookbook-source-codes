//
//  Adding_Events_to_CalendarsAppDelegate.m
//  Adding Events to Calendars
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Adding_Events_to_CalendarsAppDelegate.h"

@implementation Adding_Events_to_CalendarsAppDelegate

- (BOOL)    createEventWithTitle:(NSString *)paramTitle
                       startDate:(NSDate *)paramStartDate
                         endDate:(NSDate *)paramEndDate
             inCalendarWithTitle:(NSString *)paramCalendarTitle
              inCalendarWithType:(EKCalendarType)paramCalendarType
                           notes:(NSString *)paramNotes{
  
  BOOL result = NO;
  
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  /* Are there any calendars available to the event store? */
  if ([eventStore.calendars count] == 0){
    NSLog(@"No calendars are found.");
    return NO;
  }
  
  EKCalendar *targetCalendar = nil;
  
  /* Try to find the calendar that the user asked for */
  for (EKCalendar *thisCalendar in eventStore.calendars){
    if ([thisCalendar.title isEqualToString:paramCalendarTitle] &&
        thisCalendar.type == paramCalendarType){
      targetCalendar = thisCalendar;
      break;
    }
  }
  
  /* Make sure we found the calendar that we were asked to find */
  if (targetCalendar == nil){
    NSLog(@"Could not find the requested calendar.");
    return NO;
  }
  
  /* If a calendar does not allow modification of its contents
   then we cannot insert an event into it */
  if (targetCalendar.allowsContentModifications == NO){
    NSLog(@"The selected calendar does not allow modifications.");
    return NO;
  }
  
  /* Create an event */
  EKEvent *event = [EKEvent eventWithEventStore:eventStore];
  event.calendar = targetCalendar;
  
  /* Set the properties of the event such as its title,
   start date/time, end date/time, etc. */
  event.title = paramTitle;
  event.notes = paramNotes;
  event.startDate = paramStartDate;
  event.endDate = paramEndDate;
  
  /* Finally, save the event into the calendar */
  NSError *saveError = nil;
  
  result = [eventStore saveEvent:event
                            span:EKSpanThisEvent
                           error:&saveError];
  
  if (result == NO){
    NSLog(@"An error occurred = %@", saveError);
  }
  
  return result;
  
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  /* The event starts from today, right now */
  NSDate *startDate = [NSDate date];
  
  /* And the event ends this time tomorrow.
   24 hours, 60 minutes per hour and 60 seconds per minute
   hence 24 * 60 * 60 */
  NSDate *endDate = [startDate
                     dateByAddingTimeInterval:24 * 60 * 60];
  
  /* Create the new event */
  BOOL createdSuccessfully = [self createEventWithTitle:@"My event"
                                              startDate:startDate
                                                endDate:endDate
                                    inCalendarWithTitle:@"Calendar"
                                     inCalendarWithType:EKCalendarTypeLocal
                                                  notes:nil];
  
  if (createdSuccessfully){
    NSLog(@"Successfully created the event.");
  } else {
    NSLog(@"Failed to create the event.");
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
