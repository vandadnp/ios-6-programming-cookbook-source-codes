//
//  Presenting_Event_View_ControllersViewController.m
//  Presenting Event View Controllers
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Presenting_Event_View_ControllersViewController.h"

@implementation Presenting_Event_View_ControllersViewController

- (void)eventViewController:(EKEventViewController *)controller 
      didCompleteWithAction:(EKEventViewAction)action{
  
  switch (action){
      
    case EKEventViewActionDeleted:{
      NSLog(@"User deleted the event.");
      break;
    }
    case EKEventViewActionDone:{
      NSLog(@"User finished viewing the event.");
      break;
    }
    case EKEventViewActionResponded:{
      NSLog(@"User responsed to the invitation in the event.");
      break;
    }
      
  }
  
}

/* 1 */
//- (void)viewDidLoad{
//  [super viewDidLoad];
//	  
//  self.eventStore = [[EKEventStore alloc] init];
//  
//  NSTimeInterval NSOneYear = 1 * 365 * 24.0f * 60.0f * 60.0f;
//  NSDate *startDate = [[NSDate date] dateByAddingTimeInterval:-NSOneYear];
//  NSDate *endDate = [NSDate date];
//  
//  NSPredicate *predicate = 
//  [self.eventStore predicateForEventsWithStartDate:startDate
//                                           endDate:endDate
//                                         calendars:self.eventStore.calendars];
//  
//  NSArray *events = [self.eventStore eventsMatchingPredicate:predicate];
//  
//  if ([events count] > 0){
//    EKEvent *event = [events objectAtIndex:0];
//    EKEventViewController *controller = [[EKEventViewController alloc] init];
//    controller.event = event;
//    controller.allowsEditing = NO;
//    controller.allowsCalendarPreview = YES;
//    controller.delegate = self;
//        
//    [self.navigationController pushViewController:controller
//                                         animated:YES];
//  }
//  
//}

/* 2 */
- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.eventStore = [[EKEventStore alloc] init];
  
  NSTimeInterval NSOneYear = 1 * 365 * 24.0f * 60.0f * 60.0f;
  NSDate *startDate = [[NSDate date] dateByAddingTimeInterval:-NSOneYear];
  NSDate *endDate = [NSDate date];
  
  NSPredicate *predicate = 
  [self.eventStore predicateForEventsWithStartDate:startDate
                                           endDate:endDate
                                         calendars:self.eventStore.calendars];
  
  NSArray *events = [self.eventStore eventsMatchingPredicate:predicate];
  
  if ([events count] > 0){
    EKEvent *event = [events objectAtIndex:0];
    EKEventViewController *controller = [[EKEventViewController alloc] init];
    controller.event = event;
    controller.allowsEditing = YES;
    controller.allowsCalendarPreview = YES;
    controller.delegate = self;
    
    self.navigationItem.backBarButtonItem = 
    [[UIBarButtonItem alloc] initWithTitle:@"Go Back"
                                     style:UIBarButtonItemStylePlain
                                    target:nil
                                    action:nil];
    
    [self.navigationController pushViewController:controller
                                         animated:YES];
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
