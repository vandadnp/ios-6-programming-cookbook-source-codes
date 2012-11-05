//
//  Presenting_Event_Edit_View_ControllersViewController.m
//  Presenting Event Edit View Controllers
//
//  Created by Vandad Nahavandipoor on 24/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Presenting_Event_Edit_View_ControllersViewController.h"

@implementation Presenting_Event_Edit_View_ControllersViewController

- (void)eventEditViewController:(EKEventEditViewController *)controller 
          didCompleteWithAction:(EKEventEditViewAction)action{
  
  switch (action){
      
    case EKEventEditViewActionCanceled:{
      NSLog(@"Cancelled");
      break;
    }
    case EKEventEditViewActionSaved:{
      NSLog(@"Saved");
      break;
    }
    case EKEventEditViewActionDeleted:{
      NSLog(@"Deleted");
      break;
    }
      
  }
  
}

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
    
    EKEventEditViewController *controller = 
      [[EKEventEditViewController alloc] init];
    
    controller.event = event;
    controller.editViewDelegate = self;
        
    [self.navigationController presentModalViewController:controller
                                                 animated:YES];
  }
  
}

- (void)viewDidUnload{
  [super viewDidUnload];
  self.eventStore = nil;
}

- (void)viewWillAppear:(BOOL)animated
{
  [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
  [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
  // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
    return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
    return YES;
  }
}

@end
