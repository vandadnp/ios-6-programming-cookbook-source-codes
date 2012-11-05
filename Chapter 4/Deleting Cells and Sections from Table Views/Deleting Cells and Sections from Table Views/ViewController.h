//
//  ViewController.h
//  Deleting Cells and Sections from Table Views
//
//  Created by Vandad Nahavandipoor on 12/11/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UITableViewDelegate, 
                                              UITableViewDataSource>

@property (nonatomic, strong) UITableView *tableViewNumbers;
@property (nonatomic, strong) NSMutableDictionary *dictionaryOfNumbers;
@property (nonatomic, strong) UIBarButtonItem *barButtonAction;

@end
