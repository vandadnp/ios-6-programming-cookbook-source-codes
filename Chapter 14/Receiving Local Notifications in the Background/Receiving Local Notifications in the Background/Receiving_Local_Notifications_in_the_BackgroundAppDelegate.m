//
//  Receiving_Local_Notifications_in_the_BackgroundAppDelegate.m
//  Receiving Local Notifications in the Background
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Receiving_Local_Notifications_in_the_BackgroundAppDelegate.h"

@implementation Receiving_Local_Notifications_in_the_BackgroundAppDelegate

- (BOOL) localNotificationWithMessage:(NSString *)paramMessage
                    actionButtonTitle:(NSString *)paramActionButtonTitle
                          launchImage:(NSString *)paramLaunchImage
                     applicationBadge:(NSInteger)paramApplicationBadge
                       secondsFromNow:(NSTimeInterval)paramSecondsFromNow
                             userInfo:(NSDictionary *)paramUserInfo{
  
  if ([paramMessage length] == 0){
    return NO;
  }
  
  UILocalNotification *notification = [[UILocalNotification alloc] init];
  notification.alertBody = paramMessage;
  notification.alertAction = paramActionButtonTitle;
  
  if ([paramActionButtonTitle length]> 0){
    /* Make sure we have the action button for the user to press
     to open our application */
    notification.hasAction = YES;
  } else {
    notification.hasAction = NO;
  }
  
  /* Here you have a chance to change the launch image of your application 
   when the notification's action is viewed by the user */
  notification.alertLaunchImage = paramLaunchImage;
  
  /* Change the badge number of the application once the notification is
   presented to the user. Even if the user dismisses the notification, 
   the badge number of the application will change */
  notification.applicationIconBadgeNumber = paramApplicationBadge;
  
  /* This dictionary will get passed to your application
   later if and when the user decides to view this notification */
  notification.userInfo = paramUserInfo;
  
  /* We need to get the system time zone so that the alert view
   will adjust its fire date if the user's time zone changes */
  NSTimeZone *timeZone = [NSTimeZone systemTimeZone];
  notification.timeZone = timeZone;
  
  /* Schedule the delivery of this notification x seconds from now */
  NSDate *today = [NSDate date];
  
  NSDate *fireDate = [today dateByAddingTimeInterval:paramSecondsFromNow];
  
  NSCalendar *calendar = [NSCalendar autoupdatingCurrentCalendar];
  
  NSUInteger dateComponents = 
  NSYearCalendarUnit |
  NSMonthCalendarUnit |
  NSDayCalendarUnit |
  NSHourCalendarUnit |
  NSMinuteCalendarUnit |
  NSSecondCalendarUnit;
  
  NSDateComponents *components = [calendar components:dateComponents
                                             fromDate:fireDate];
  
  /* Here you have a chance to change these components. That's why we
   retrieved the components of the date in the first place. */
  fireDate = [calendar dateFromComponents:components];
  
  /* Finally set the schedule date for this notification */
  notification.fireDate = fireDate;
  
  [[UIApplication sharedApplication] cancelAllLocalNotifications];
  
  [[UIApplication sharedApplication] scheduleLocalNotification:notification];
  
  return YES;
  
}

- (void)            application:(UIApplication *)application 
    didReceiveLocalNotification:(UILocalNotification *)notification{
  
  NSString *message = @"The Local Notification is delivered.";
  
  [[[UIAlertView alloc] initWithTitle:@"Local Notification"
                              message:message
                             delegate:nil
                    cancelButtonTitle:@"OK"
                    otherButtonTitles:nil, nil] show];
    
}

- (BOOL)            application:(UIApplication *)application
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  
  id scheduledLocalNotification = 
  [launchOptions valueForKey:
   UIApplicationLaunchOptionsLocalNotificationKey];
  
  if (scheduledLocalNotification != nil){
    
    /* We received a local notification while
     our application wasn't running. You can now typecase the
     ScheduledLocalNotification variable to UILocalNotification and
     use it in your application */
    
    NSString *message = @"Local Notification Woke Us Up";
    [[[UIAlertView alloc] initWithTitle:@"Notification"
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
    
  } else {
    
    NSString *message =@"A new instant message is available. \
    Would you like to read this message?";
    
    /* If a local notification didn't start our application,
     then we start a new local notification */
    
    [self localNotificationWithMessage:message
                     actionButtonTitle:@"Yes"
                           launchImage:nil
                      applicationBadge:1
                        secondsFromNow:10.0f
                              userInfo:nil];
    
    message = @"A new Local Notification is set up \
    to be displayed 10 seconds from now";
    
    [[[UIAlertView alloc] initWithTitle:@"Set Up"
                                message:message
                               delegate:nil
                      cancelButtonTitle:@"OK"
                      otherButtonTitles:nil, nil] show];
    
  }
  
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
