//
//  Person.h
//  Generating Class Files for Core Data Entities
//
//  Created by Vandad Nahavandipoor on 23/07/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreData/CoreData.h>


@interface Person : NSManagedObject {
@private
}
@property (nonatomic, retain) NSString * firstName;
@property (nonatomic, retain) NSString * lastName;
@property (nonatomic, retain) NSNumber * age;

@end
