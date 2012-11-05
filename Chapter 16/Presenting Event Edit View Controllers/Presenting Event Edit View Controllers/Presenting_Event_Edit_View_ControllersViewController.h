//
//  Presenting_Event_Edit_View_ControllersViewController.h
//  Presenting Event Edit View Controllers
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <EventKit/EventKit.h>
#import <EventKitUI/EventKitUI.h>

@interface Presenting_Event_Edit_View_ControllersViewController
           : UIViewController <EKEventEditViewDelegate>

@property (nonatomic, strong) EKEventStore *eventStore;

@end
