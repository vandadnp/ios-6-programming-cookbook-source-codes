//
//  Converting_Meaningful_Addresses_to_Longitude_and_LatitudeViewController.m
//  Converting Meaningful Addresses to Longitude and Latitude
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Converting_Meaningful_Addresses_to_Longitude_and_LatitudeViewController.h"

@implementation
  Converting_Meaningful_Addresses_to_Longitude_and_LatitudeViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  /* We have our address */
  NSString *oreillyAddress = 
    @"1005 Gravenstein Highway North, Sebastopol, CA 95472, USA";
  
  self.myGeocoder = [[CLGeocoder alloc] init];
  
  [self.myGeocoder
   geocodeAddressString:oreillyAddress
   completionHandler:^(NSArray *placemarks, NSError *error) {
     
     if ([placemarks count] > 0 &&
         error == nil){
       NSLog(@"Found %lu placemark(s).", (unsigned long)[placemarks count]);
       CLPlacemark *firstPlacemark = [placemarks objectAtIndex:0];
       NSLog(@"Longitude = %f", firstPlacemark.location.coordinate.longitude);
       NSLog(@"Latitude = %f", firstPlacemark.location.coordinate.latitude);
     }
     else if ([placemarks count] == 0 &&
              error == nil){
       NSLog(@"Found no placemarks.");
     }
     else if (error != nil){
       NSLog(@"An error occurred = %@", error);
     }
     
   }];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
