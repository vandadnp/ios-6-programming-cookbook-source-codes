//
//  Converting_Longitude_and_Latitude_to_a_Meaningful_AddressViewController.m
//  Converting Longitude and Latitude to a Meaningful Address
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Converting_Longitude_and_Latitude_to_a_Meaningful_AddressViewController.h"

@implementation
  Converting_Longitude_and_Latitude_to_a_Meaningful_AddressViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  CLLocation *location = [[CLLocation alloc]
                          initWithLatitude:+38.4112810
                          longitude:-122.8409780f];

  self.myGeocoder = [[CLGeocoder alloc] init];
  
  [self.myGeocoder
   reverseGeocodeLocation:location
   completionHandler:^(NSArray *placemarks, NSError *error) {
     
     if (error == nil &&
         [placemarks count] > 0){
       
       CLPlacemark *placemark = [placemarks objectAtIndex:0];
       /* We received the results */
       NSLog(@"Country = %@", placemark.country);
       NSLog(@"Postal Code = %@", placemark.postalCode);
       NSLog(@"Locality = %@", placemark.locality);
     }
     else if (error == nil &&
              [placemarks count] == 0){
       NSLog(@"No results were returned.");
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
