//
//  MyAnnotation.h
//  Maps
//
//  Created by Vandad Nahavandipoor on 11-05-10.
//  Copyright 2011  All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

#define REUSABLE_PIN_RED    @"Red"
#define REUSABLE_PIN_GREEN  @"Green"
#define REUSABLE_PIN_PURPLE @"Purple"

@interface MyAnnotation : NSObject <MKAnnotation>

@property (nonatomic, unsafe_unretained, readonly)
  CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString *title;
@property (nonatomic, copy) NSString *subtitle;

@property (nonatomic, unsafe_unretained)
  MKPinAnnotationColor  pinColor;

- (id) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates 
                  title:(NSString*)paramTitle 
               subTitle:(NSString*)paramSubTitle;

+ (NSString *)   reusableIdentifierforPinColor
                 :(MKPinAnnotationColor)ParamColor;

@end
