//
//  Pinpointing_the_Location_of_a_DeviceViewController.h
//  Pinpointing the Location of a Device
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Pinpointing_the_Location_of_a_DeviceViewController
           : UIViewController <CLLocationManagerDelegate>

@property (nonatomic, strong) CLLocationManager *myLocationManager;

@end
