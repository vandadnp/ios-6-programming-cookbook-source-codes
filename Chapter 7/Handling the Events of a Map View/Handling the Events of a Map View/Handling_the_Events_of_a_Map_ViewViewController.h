//
//  Handling_the_Events_of_a_Map_ViewViewController.h
//  Handling the Events of a Map View
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import <MapKit/MapKit.h>

@interface Handling_the_Events_of_a_Map_ViewViewController
           : UIViewController <MKMapViewDelegate>

@property (nonatomic, strong) MKMapView *myMapView;

@end
