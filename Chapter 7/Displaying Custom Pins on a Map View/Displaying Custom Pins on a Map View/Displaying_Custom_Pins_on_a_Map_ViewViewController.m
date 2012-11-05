//
//  Displaying_Custom_Pins_on_a_Map_ViewViewController.m
//  Displaying Custom Pins on a Map View
//
//  Created by Vandad Nahavandipoor on 15/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Displaying_Custom_Pins_on_a_Map_ViewViewController.h"
#import "MyAnnotation.h"

@implementation Displaying_Custom_Pins_on_a_Map_ViewViewController

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (MKAnnotationView *)mapView:(MKMapView *)mapView 
            viewForAnnotation:(id <MKAnnotation>)annotation{
  
  MKAnnotationView *result = nil;
  
  if ([annotation isKindOfClass:[MyAnnotation class]] == NO){
    return result;
  }
  
  if ([mapView isEqual:self.myMapView] == NO){
    /* We want to process this event only for the Map View
     that we have created previously */
    return result;
  }
  
  /* First typecast the annotation for which the Map View has
   fired this delegate message */
  MyAnnotation *senderAnnotation = (MyAnnotation *)annotation;
  
  /* Using the class method we have defined in our custom
   annotation class, we will attempt to get a reusable
   identifier for the pin we are about to create */
  NSString *pinReusableIdentifier = 
  [MyAnnotation 
   reusableIdentifierforPinColor:senderAnnotation.pinColor];
  
  /* Using the identifier we retrieved above, we will
   attempt to reuse a pin in the sender Map View */
  MKPinAnnotationView *annotationView = (MKPinAnnotationView *)
  [mapView 
   dequeueReusableAnnotationViewWithIdentifier:
   pinReusableIdentifier];
  
  if (annotationView == nil){
    /* If we fail to reuse a pin, then we will create one */
    annotationView = 
    [[MKPinAnnotationView alloc]  initWithAnnotation:senderAnnotation
                                     reuseIdentifier:pinReusableIdentifier];
    
    /* Make sure we can see the callouts on top of
     each pin in case we have assigned title and/or
     subtitle to each pin */
    annotationView.canShowCallout = YES;
    
  }
    
  UIImage *pinImage = [UIImage imageNamed:@"BluePin.png"];
  if (pinImage != nil){
    annotationView.image = pinImage;
  }
  
  result = annotationView;
  
  return result;
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
  
  CLLocationCoordinate2D location;
  location.latitude = 50.82191692907181;
  location.longitude = -0.13811767101287842;
  
  MyAnnotation *annotation =  [[MyAnnotation alloc] 
                               initWithCoordinates:location
                               title:@"My Title"
                               subTitle:@"My Sub Title"];
  
  [self.myMapView addAnnotation:annotation];

  MKCoordinateRegion region;
  region.center = location;
  region.span.latitudeDelta = 0.001f;
  region.span.longitudeDelta = 0.001;
  
  [self.myMapView setRegion:region
                   animated:YES];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
