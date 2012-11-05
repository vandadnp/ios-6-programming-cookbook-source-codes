//
//  Handling_Event_Changed_NotificationsAppDelegate.h
//  Handling Event Changed Notifications
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>

@interface Handling_Event_Changed_NotificationsAppDelegate
           : UIResponder <UIApplicationDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) EKEventStore *eventStore;
@property (nonatomic, strong) NSMutableArray *eventsForOneYear;

@end
