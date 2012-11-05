//
//  MyAnnotation.m
//  Maps
//
//  Created by Vandad Nahavandipoor on 11-05-10.
//  Copyright 2011 All rights reserved.
//

#import "MyAnnotation.h"

@implementation MyAnnotation

+ (NSString *)   reusableIdentifierforPinColor
                 :(MKPinAnnotationColor)paramColor{
  
  NSString *result = nil;
  
  switch (paramColor){
    case MKPinAnnotationColorRed:{
      result = REUSABLE_PIN_RED;
      break;
    }
    case MKPinAnnotationColorGreen:{
      result = REUSABLE_PIN_GREEN;
      break;
    }
    case MKPinAnnotationColorPurple:{
      result = REUSABLE_PIN_PURPLE;
      break;
    }
  }
  
  return result;
}

- (id) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates 
                     title:(NSString*)paramTitle 
                  subTitle:(NSString*)paramSubTitle{
  
  self = [super init];
  
  if (self != nil){
    _coordinate = paramCoordinates;
    _title = paramTitle;
    _subtitle = paramSubTitle;
    _pinColor = MKPinAnnotationColorGreen;
  }
  
  return self;
  
}

@end
