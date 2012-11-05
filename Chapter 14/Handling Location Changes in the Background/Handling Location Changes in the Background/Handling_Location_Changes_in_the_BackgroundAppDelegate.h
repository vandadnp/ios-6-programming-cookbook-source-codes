//
//  Handling_Location_Changes_in_the_BackgroundAppDelegate.h
//  Handling Location Changes in the Background
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>

@interface Handling_Location_Changes_in_the_BackgroundAppDelegate
           : UIResponder <UIApplicationDelegate, CLLocationManagerDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) CLLocationManager *myLocationManager;
@property (nonatomic, unsafe_unretained, getter=isExecutingInBackground)
  BOOL executingInBackground;

@end
