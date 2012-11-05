//
//  Displaying_Pins_on_a_Map_ViewViewController.h
//  Displaying Pins on a Map View
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <CoreLocation/CoreLocation.h>
#import <MapKit/MapKit.h>

@interface Displaying_Pins_on_a_Map_ViewViewController
           : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *myMapView;


@end
