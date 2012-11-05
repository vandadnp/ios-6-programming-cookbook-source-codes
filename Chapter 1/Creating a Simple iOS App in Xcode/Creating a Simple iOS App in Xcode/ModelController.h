//
//  ModelController.h
//  Creating a Simple iOS App in Xcode
//
//  Created by Vandad Nahavandipoor on 07/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <Foundation/Foundation.h>

@class DataViewController;

@interface ModelController : NSObject <UIPageViewControllerDataSource>
- (DataViewController *)viewControllerAtIndex:(NSUInteger)index;
- (NSUInteger)indexOfViewController:(DataViewController *)viewController;
@end
