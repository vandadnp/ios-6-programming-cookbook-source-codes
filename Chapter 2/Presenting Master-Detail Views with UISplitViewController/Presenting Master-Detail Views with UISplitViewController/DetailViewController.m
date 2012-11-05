//
//  DetailViewController.m
//  Presenting Master-Detail Views with UISplitViewController
//
//  Created by Vandad Nahavandipoor on 10/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "DetailViewController.h"

#import "RootViewController.h"

@interface DetailViewController ()
@property (strong, nonatomic) UIPopoverController *popoverController;
- (void)configureView;
@end

@implementation DetailViewController

@synthesize popoverController = _myPopoverController;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
    self.title = NSLocalizedString(@"Detail", @"Detail");
    }
    return self;
}

#pragma mark - Managing the detail item

- (void)setDetailItem:(id)newDetailItem
{
    if (_detailItem != newDetailItem) {
        _detailItem = newDetailItem;
        
        // Update the view.
        [self configureView];
    }

    if (self.popoverController != nil) {
        [self.popoverController dismissPopoverAnimated:YES];
    }        
}

- (void)configureView
{
    // Update the user interface for the detail item.

  if (self.detailItem) {
      self.detailDescriptionLabel.text = [self.detailItem description];
  }
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Release any cached data, images, etc that aren't in use.
}

#pragma mark - View lifecycle

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
  [self configureView];
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
}

- (void)viewDidAppear:(BOOL)animated
{
    [super viewDidAppear:animated];
}

- (void)viewWillDisappear:(BOOL)animated
{
	[super viewWillDisappear:animated];
}

- (void)viewDidDisappear:(BOOL)animated
{
	[super viewDidDisappear:animated];
}

- (BOOL)shouldAutorotateToInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation
{
    // Return YES for supported orientations
  if ([[UIDevice currentDevice] userInterfaceIdiom] == UIUserInterfaceIdiomPhone) {
      return (interfaceOrientation != UIInterfaceOrientationPortraitUpsideDown);
  } else {
      return YES;
  }

}

#pragma mark - Split view

- (BOOL) splitViewController:(UISplitViewController *)svc 
    shouldHideViewController:(UIViewController *)vc
               inOrientation:(UIInterfaceOrientation)orientation{
  return NO;
}

//- (void)splitViewController:(UISplitViewController *)svc
//     willHideViewController:(UIViewController *)aViewController 
//          withBarButtonItem:(UIBarButtonItem *)barButtonItem
//       forPopoverController: (UIPopoverController *)pc{
//    barButtonItem.title = @"Master";
//    NSMutableArray *items = [[self.toolbar items] mutableCopy];
//    [items insertObject:barButtonItem atIndex:0];
//    [self.toolbar setItems:items animated:YES];
//    self.popoverController = pc;
//}
//
//- (void)splitViewController:(UISplitViewController *)svc
//     willShowViewController:(UIViewController *)aViewController
//  invalidatingBarButtonItem:(UIBarButtonItem *)barButtonItem{
//    NSMutableArray *items = [[self.toolbar items] mutableCopy];
//    [items removeObjectAtIndex:0];
//    [self.toolbar setItems:items animated:YES];
//    self.popoverController = nil;
//}

@end
