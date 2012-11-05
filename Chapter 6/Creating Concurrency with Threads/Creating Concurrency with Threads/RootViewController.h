//
//  RootViewController.h
//  Creating Concurrency with Threads
//
//  Created by Vandad Nahavandipoor on 14/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RootViewController : UIViewController

@property (nonatomic, strong) NSThread *myThread;

- (IBAction) performButtonAction:(id)Sender;

@end
