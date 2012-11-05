//
//  Creating_a_Map_ViewViewController.m
//  Creating a Map View
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Creating_a_Map_ViewViewController.h"

@implementation Creating_a_Map_ViewViewController

@synthesize myMapView;

- (void)didReceiveMemoryWarning{
  [super didReceiveMemoryWarning];
}

- (void)viewDidLoad{
  [super viewDidLoad];
  
  self.view.backgroundColor = [UIColor whiteColor];
  
  self.myMapView = [[MKMapView alloc] 
                    initWithFrame:self.view.bounds];
  /* Set the map type to Satellite */
  self.myMapView.mapType = MKMapTypeSatellite;
  
  self.myMapView.autoresizingMask = 
    UIViewAutoresizingFlexibleWidth | 
    UIViewAutoresizingFlexibleHeight;
  
  /* Add it to our view */
  [self.view addSubview:self.myMapView];
  
}

- (BOOL)shouldAutorotateToInterfaceOrientation
        :(UIInterfaceOrientation)interfaceOrientation{
  return YES;
}

@end
