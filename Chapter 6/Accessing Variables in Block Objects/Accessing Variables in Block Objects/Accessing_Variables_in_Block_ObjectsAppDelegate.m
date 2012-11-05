//
//  Accessing_Variables_in_Block_ObjectsAppDelegate.m
//  Accessing Variables in Block Objects
//
//  Created by Vandad Nahavandipoor on 13/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "Accessing_Variables_in_Block_ObjectsAppDelegate.h"

@implementation Accessing_Variables_in_Block_ObjectsAppDelegate

//void (^independentBlockObject)(void) = ^(void){
//  
//  NSInteger localInteger = 10;
//  
//  NSLog(@"local integer = %ld", (long)localInteger);
//  
//  localInteger = 20;
//  
//  NSLog(@"local integer = %ld", (long)localInteger);
//  
//};

//- (void) simpleMethod{
//  
//  NSUInteger outsideVariable = 10;
//  
//  NSMutableArray *array = [[NSMutableArray alloc]
//                           initWithObjects:@"obj1",
//                           @"obj2", nil];
//  
//  [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//    NSUInteger insideVariable = 20;
//    
//    NSLog(@"Outside variable = %lu", (unsigned long)outsideVariable);
//    NSLog(@"Inside variable = %lu", (unsigned long)insideVariable);
//    
//    /* Return value for our block object */
//    return NSOrderedSame;
//    
//  }];
//  
//}

//- (void) simpleMethod{
//  
//  __block NSUInteger outsideVariable = 10;
//  
//  NSMutableArray *array = [[NSMutableArray alloc]
//                           initWithObjects:@"obj1",
//                           @"obj2", nil];
//
//  
//  [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//     
//     NSUInteger insideVariable = 20;
//     outsideVariable = 30;
//     
//     NSLog(@"Outside variable = %lu", (unsigned long)outsideVariable);
//     NSLog(@"Inside variable = %lu", (unsigned long)insideVariable);
//     
//     /* Return value for our block object */
//     return NSOrderedSame;
//     
//   }];
//  
//}

//- (void) simpleMethod{
//  
//  NSMutableArray *array = [[NSMutableArray alloc]
//                           initWithObjects:@"obj1",
//                           @"obj2", nil];
//  
//  [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//    
//    NSLog(@"self = %@", self);
//    
//    /* Return value for our block object */
//    return NSOrderedSame;
//    
//  }];
//  
//}


//void (^incorrectBlockObject)(void) = ^{
//  NSLog(@"self = %@", self); /* self is undefined here */
//};

//void (^correctBlockObject)(id) = ^(id self){
//  
//  NSLog(@"self = %@", self);
//  
//};
//
//- (void) callCorrectBlockObject{
//  
//  correctBlockObject(self);
//  
//}

//- (void) simpleMethod{
//  
//  NSMutableArray *array = [[NSMutableArray alloc]
//                           initWithObjects:@"obj1",
//                           @"obj2", nil];
//  
//  [array sortUsingComparator:^NSComparisonResult(id obj1, id obj2) {
//    
//    NSLog(@"self = %@", self);
//    
//    self.stringProperty = @"Block Objects";
//    
//    NSLog(@"String property = %@", self.stringProperty);
//    
//    /* Return value for our block object */
//    return NSOrderedSame;
//    
//  }];
//  
//}

//void (^correctBlockObject)(id) = ^(id self){
//  
//  NSLog(@"self = %@", self);
//  
//  /* Should use setter method instead of this */
//  self.stringProperty = @"Block Objects"; /* Compile-time Error */
//  
//  /* Should use getter method instead of this */
//  NSLog(@"self.stringProperty = %@", 
//        self.stringProperty); /* Compile-time Error */
//  
//};

//void (^correctBlockObject)(id) = ^(id self){
//  
//  NSLog(@"self = %@", self);
//  
//  /* This will work fine */
//  [self setStringProperty:@"Block Objects"];
//  
//  /* This will work fine as well */
//  NSLog(@"self.stringProperty = %@", 
//        [self stringProperty]);
//  
//};

//- (void) callCorrectBlockObject{
//  
//  correctBlockObject(self);
//  
//}

typedef void (^BlockWithNoParams)(void);

//- (void) scopeTest{
//  
//  NSUInteger integerValue = 10;
//  
//  BlockWithNoParams myBlock = ^{
//    NSLog(@"Integer value inside the block = %lu", 
//          (unsigned long)integerValue);
//  };
//  
//  integerValue = 20;
//  
//  /* Call the block here after changing the
//   value of the integerValue variable */
//  myBlock();
//  
//  NSLog(@"Integer value outside the block = %lu", 
//        (unsigned long)integerValue);
//  
//}

//- (void) scopeTest{
//  
//  __block NSUInteger integerValue = 10;
//  
//  BlockWithNoParams myBlock = ^{
//    NSLog(@"Integer value inside the block = %lu", 
//          (unsigned long)integerValue);
//  };
//  
//  integerValue = 20;
//  
//  /* Call the block here after changing the
//   value of the integerValue variable */
//  myBlock();
//  
//  NSLog(@"Integer value outside the block = %lu", 
//        (unsigned long)integerValue);
//  
//}

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions
{
  self.window = [[UIWindow alloc] initWithFrame:[[UIScreen mainScreen] bounds]];
  // Override point for customization after application launch.
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application
{
  /*
   Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
   Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
   */
}

- (void)applicationDidEnterBackground:(UIApplication *)application
{
  /*
   Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later. 
   If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
   */
}

- (void)applicationWillEnterForeground:(UIApplication *)application
{
  /*
   Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
   */
}

- (void)applicationDidBecomeActive:(UIApplication *)application
{
  /*
   Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
   */
}

- (void)applicationWillTerminate:(UIApplication *)application
{
  /*
   Called when the application is about to terminate.
   Save data if appropriate.
   See also applicationDidEnterBackground:.
   */
}

@end
