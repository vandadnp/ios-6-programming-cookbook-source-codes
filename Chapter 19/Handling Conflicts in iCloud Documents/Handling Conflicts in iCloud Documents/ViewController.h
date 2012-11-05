//
//  ViewController.h
//  Handling Conflicts in iCloud Documents
//
//  Created by Vandad NP on 16/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CloudDocument.h"

@class ConflictViewController;

@interface ViewController : UIViewController <UITextFieldDelegate, 
        CloudDocumentProtocol, UITextViewDelegate, 
        UITableViewDelegate, UITableViewDataSource>

@property (nonatomic, strong) UITextView *textViewCloudDocumentText;
@property (nonatomic, strong) CloudDocument *cloudDocument;
@property (nonatomic, strong) NSMetadataQuery *metadataQuery;
@property (nonatomic, copy) NSArray *arrayOfCloudDocumentVersions;
@property (nonatomic, strong) ConflictViewController *conflictViewController;

@end
