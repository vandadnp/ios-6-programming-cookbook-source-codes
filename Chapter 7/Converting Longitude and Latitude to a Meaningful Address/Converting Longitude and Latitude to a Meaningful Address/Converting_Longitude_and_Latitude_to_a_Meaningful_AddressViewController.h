//
//  Converting_Longitude_and_Latitude_to_a_Meaningful_AddressViewController.h
//  Converting Longitude and Latitude to a Meaningful Address
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface
  Converting_Longitude_and_Latitude_to_a_Meaningful_AddressViewController
   : UIViewController

@property (nonatomic, strong) CLGeocoder *myGeocoder;

@end
