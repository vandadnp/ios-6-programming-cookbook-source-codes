//
//  ViewController.h
//  Managing the State of Documents in iCloud
//
//  Created by Vandad NP on 15/10/2011.
//  Copyright (c) 2011 __MyCompanyName__. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CloudDocument.h"

@interface ViewController : UIViewController <UITextFieldDelegate, 
  CloudDocumentProtocol, UITextViewDelegate>

@property (nonatomic, strong) UITextView *textViewCloudDocumentText;
@property (nonatomic, strong) CloudDocument *cloudDocument;
@property (nonatomic, strong) NSMetadataQuery *metadataQuery;

@end
