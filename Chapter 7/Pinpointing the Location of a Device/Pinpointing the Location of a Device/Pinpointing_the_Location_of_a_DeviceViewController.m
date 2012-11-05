//
//  Pinpointing_the_Location_of_a_DeviceViewController.m
//  Pinpointing the Location of a Device
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Pinpointing_the_Location_of_a_DeviceViewController.h"

@implementation Pinpointing_the_Location_of_a_DeviceViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)locationManager:(CLLocationManager *)manager
    didUpdateToLocation:(CLLocation *)newLocation
           fromLocation:(CLLocation *)oldLocation{
  
  /* We received the new location */
  
  NSLog(@"Latitude = %f", newLocation.coordinate.latitude);
  NSLog(@"Longitude = %f", newLocation.coordinate.longitude);
  
}

- (void)locationManager:(CLLocationManager *)manager
       didFailWithError:(NSError *)error{
  
  /* Failed to receive user's location */
  
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  if ([CLLocationManager locationServicesEnabled]){
    self.myLocationManager = [[CLLocationManager alloc] init];
    self.myLocationManager.delegate = self;
    
    self.myLocationManager.purpose =
    @"To provide functionality based on user's current location.";
    
    [self.myLocationManager startUpdatingLocation];
  } else {
    /* Location services are not enabled.
     Take appropriate action: for instance, prompt the
     user to enable the location services */
    NSLog(@"Location services are not enabled");
  }
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
