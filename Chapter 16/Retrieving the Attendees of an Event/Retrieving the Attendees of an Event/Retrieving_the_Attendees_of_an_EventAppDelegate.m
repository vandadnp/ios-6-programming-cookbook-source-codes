//
//  Retrieving_the_Attendees_of_an_EventAppDelegate.m
//  Retrieving the Attendees of an Event
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Retrieving_the_Attendees_of_an_EventAppDelegate.h"

@implementation Retrieving_the_Attendees_of_an_EventAppDelegate

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

- (void) enumerateTodayEvents{
  
  /* Find a calendar to base our search on */
  EKCalendar *targetCalendar = 
    [self calDAVCalendarWithTitleContaining:@"vandad.np@gmail.com"];
  
  /* If we could not find a CalDAV calendar that
   we were looking for, then we will abort the operation */
  if (targetCalendar == nil){
    NSLog(@"No CalDAV calendars were found.");
    return;
  }
  
  /* We have to pass an array of calendars
   to the event store to search */
  NSArray *targetCalendars = [[NSArray alloc] 
                              initWithObjects:targetCalendar, nil];
  
  /* Instantiate the event store */
  EKEventStore *eventStore = [[EKEventStore alloc] init];
  
  /* Construct the starting date for today */
  NSDate *startDate = [NSDate date];
  
  /* The end date will be 1a day from now */
  NSTimeInterval NSOneDay = 1 * 24 * 60 * 60;
  NSDate *endDate = [startDate dateByAddingTimeInterval:NSOneDay];
  
  /* Create the predicate that we can later pass to
   the event store in order to fetch the events */
  NSPredicate *searchPredicate =
  [eventStore predicateForEventsWithStartDate:startDate
                                      endDate:endDate
                                    calendars:targetCalendars];
  
  /* Make sure we succeeded in creating the predicate */
  if (searchPredicate == nil){
    NSLog(@"Could not create the search predicate.");
    return;
  }
  
  /* Fetch all the events that fall between the
   starting and the ending dates */
  NSArray *events = [eventStore eventsMatchingPredicate:searchPredicate];
  
  /* Array of NSString equivalents of the values
   in the EKParticipantRole enumeration */
  NSArray *attendeeRole = [NSArray arrayWithObjects:
                           @"Unknown",
                           @"Required",
                           @"Optional",
                           @"Chair",
                           @"Non Participant",
                           nil];
  
  /* Array of NSString equivalents of the values
   in the EKParticipantStatus enumeration */
  NSArray *attendeeStatus = [NSArray arrayWithObjects:
                             @"Unknown",
                             @"Pending",
                             @"Accepted",
                             @"Declined",
                             @"Tentative",
                             @"Delegated",
                             @"Completed",
                             @"In Process",
                             nil];
  
  /* Array of NSString equivalents of the values
   in the EKParticipantType enumeration */
  NSArray *attendeeType = [NSArray arrayWithObjects:
                           @"Unknown",
                           @"Person",
                           @"Room",
                           @"Resource",
                           @"Group",
                           nil];
  
  /* Go through all the events and print their information
   out to the console */
  if (events != nil){
    
    NSUInteger eventCounter = 0;
    for (EKEvent *thisEvent in events){
      
      eventCounter++;
      
      NSLog(@"Event %lu Start Date = %@",
            (unsigned long)eventCounter,
            thisEvent.startDate);
      
      NSLog(@"Event %lu End Date = %@",
            (unsigned long)eventCounter,
            thisEvent.endDate);
      
      NSLog(@"Event %lu Title = %@",
            (unsigned long)eventCounter,
            thisEvent.title);
      
      if (thisEvent.attendees == nil ||
          [thisEvent.attendees count] == 0){
        NSLog(@"Event %lu has no attendees",
              (unsigned long)eventCounter);
        continue;
      }
      
      NSUInteger attendeeCounter = 1;
      for (EKParticipant *participant in thisEvent.attendees){
        
        NSLog(@"Event %lu Attendee %lu Name = %@",
              (unsigned long)eventCounter,
              (unsigned long)attendeeCounter,
              participant.name);
        
        NSLog(@"Event %lu Attendee %lu Role = %@",
              (unsigned long)eventCounter,
              (unsigned long)attendeeCounter,
              [attendeeRole objectAtIndex:
               participant.participantRole]);
        
        NSLog(@"Event %lu Attendee %lu Status = %@",
              (unsigned long)eventCounter,
              (unsigned long)attendeeCounter,
              [attendeeStatus objectAtIndex:
               participant.participantStatus]);
        
        NSLog(@"Event %lu Attendee %lu Type = %@",
              (unsigned long)eventCounter,
              (unsigned long)attendeeCounter,
              [attendeeType objectAtIndex:
               participant.participantType]);
        
        NSLog(@"Event %lu Attendee %lu URL = %@",
              (unsigned long)eventCounter,
              (unsigned long)attendeeCounter,
              participant.URL);
        
        attendeeCounter++;
        
      }
      
    } /* for (EKEvent *Event in Events){ */
    
  } else {
    NSLog(@"The array of events is nil.");
  }
  
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  [self enumerateTodayEvents];
  
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
