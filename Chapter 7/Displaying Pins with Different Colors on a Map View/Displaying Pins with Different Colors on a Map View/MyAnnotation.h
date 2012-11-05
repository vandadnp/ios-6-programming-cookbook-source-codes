//
//  MyAnnotation.h
//  Maps
//
//  Created by Vandad Nahavandipoor on 11-05-10.
//  Copyright 2011 All rights reserved.
//

#import <Foundation/Foundation.h>
#import <MapKit/MapKit.h>

/* These are the standard SDK pin colors. We are setting
 unique identifiers per color for each pin so that later we
 can reuse the pins that have already been created with the same
 color */

#define REUSABLE_PIN_RED    @"Red"
#define REUSABLE_PIN_GREEN  @"Green"
#define REUSABLE_PIN_PURPLE @"Purple"

@interface MyAnnotation : NSObject <MKAnnotation>

/* unsafe_unretained since this is not an object. We can skip this and leave
 it to the compiler to decide. weak or strong won't work as this is not
 an object */
@property (nonatomic, unsafe_unretained, readonly)
  CLLocationCoordinate2D coordinate;

@property (nonatomic, copy) NSString  *title;
@property (nonatomic, copy) NSString  *subtitle;

/* unsafe_unretained for the same reason as the coordinate property */
@property (nonatomic, unsafe_unretained) MKPinAnnotationColor  pinColor;

- (id) initWithCoordinates:(CLLocationCoordinate2D)paramCoordinates 
                     title:(NSString*)paramTitle 
                  subTitle:(NSString*)paramSubTitle;

+ (NSString *)   reusableIdentifierforPinColor
                 :(MKPinAnnotationColor)paramColor;

@end
