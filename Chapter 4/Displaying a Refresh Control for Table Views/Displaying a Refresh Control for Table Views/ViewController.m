//
//  ViewController.m
//  Utilizing the UITableViewController for Easy Creation of Table Views
//
//  Created by Vandad Nahavandipoor on 21/08/2012.
//  Copyright (c) 2012 Pixolity Ltd. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic, strong) NSMutableArray *times;
@property (nonatomic, strong) UIRefreshControl *refreshControl;
@end

@implementation ViewController

- (void) handleRefresh:(id)paramSender{
    
    /* Put a bit of delay between when the refresh control is released
     and when we actually do the refreshing to make the UI look a bit
     smoother than just doing the update without the animation */
    int64_t delayInSeconds = 1.0f;
    dispatch_time_t popTime = dispatch_time(DISPATCH_TIME_NOW, delayInSeconds * NSEC_PER_SEC);
    dispatch_after(popTime, dispatch_get_main_queue(), ^(void){
        
        /* Add the current date to the list of dates that we have
         so that when the table view is refreshed, a new item will appear
         on the screen so that the user will see the difference between
         the before and the after of the refresh */
        [self.times addObject:[NSDate date]];
        
        [self.refreshControl endRefreshing];
        [self.tableView reloadData];
    });
    
}

- (id)initWithStyle:(UITableViewStyle)style{
    self = [super initWithStyle:style];
    if (self) {
        self.times = [NSMutableArray arrayWithObject:[NSDate date]];
        
        /* Create the refresh control */
        self.refreshControl = [[UIRefreshControl alloc] init];
        self.refreshControl = self.refreshControl;
        [self.refreshControl addTarget:self
                                action:@selector(handleRefresh:)
                      forControlEvents:UIControlEventValueChanged];
        
    }
    return self;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView
 numberOfRowsInSection:(NSInteger)section{
    return self.times.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView
         cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *CellIdentifier = @"Cell";
    UITableViewCell *cell =
    [tableView dequeueReusableCellWithIdentifier:CellIdentifier];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]
                initWithStyle:UITableViewCellStyleDefault
                reuseIdentifier:CellIdentifier];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%@",
                           self.times[indexPath.row]];
    
    return cell;
}

@end
