//
//  Displaying_Pins_on_a_Map_ViewViewController.m
//  Displaying Pins on a Map View
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Pins_on_a_Map_ViewViewController.h"
#import "MyAnnotation.h"

@implementation Displaying_Pins_on_a_Map_ViewViewController

- (void)didReceiveMemoryWarning
{
  [super didReceiveMemoryWarning];
  // Release any cached data, images, etc that aren't in use.
}

- (void)viewDidLoad {
  [super viewDidLoad];
  
  /* Create a map as big as our view */
  self.myMapView = [[MKMapView alloc] 
                    initWithFrame:self.view.bounds];
  
  self.myMapView.delegate = self;
  
  /* Set the map type to Standard */
  self.myMapView.mapType = MKMapTypeStandard;
  
  self.myMapView.autoresizingMask = 
    UIViewAutoresizingFlexibleWidth |
    UIViewAutoresizingFlexibleHeight;
  
  /* Add it to our view */
  [self.view addSubview:self.myMapView];
  
  /* This is just a sample location */
  CLLocationCoordinate2D location = 
    CLLocationCoordinate2DMake(50.82191692907181, -0.13811767101287842);
  
  /* Create the annotation using the location */
  MyAnnotation *annotation = 
  [[MyAnnotation alloc] initWithCoordinates:location
                                      title:@"My Title"
                                   subTitle:@"My Sub Title"];
  
  /* And eventually add it to the map */
  [self.myMapView addAnnotation:annotation];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
