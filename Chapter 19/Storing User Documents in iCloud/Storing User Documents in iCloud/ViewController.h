//
//  ViewController.h
//  Storing User Documents in iCloud
//
//  Created by Vandad Nahavandipoor on 10/09/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CloudDocument.h"

@interface ViewController : UIViewController 
                            <CloudDocumentProtocol, UITextViewDelegate>

@property (nonatomic, strong) CloudDocument *cloudDocument;
@property (nonatomic, strong) UITextView *textViewCloudDocumentText;
@property (nonatomic, strong) NSMetadataQuery *metadataQuery;

@end
