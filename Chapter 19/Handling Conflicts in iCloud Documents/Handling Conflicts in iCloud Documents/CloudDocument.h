//
//  CloudDocument.h
//  Storing User Documents in iCloud
//
//  Created by Vandad Nahavandipoor on 10/09/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CloudDocument;

@protocol CloudDocumentProtocol<NSObject>
- (void) cloudDocumentChanged:(CloudDocument *)paramSender;
@end

@interface CloudDocument : UIDocument

@property (nonatomic, strong) NSString *documentText;
@property (nonatomic, weak) id<CloudDocumentProtocol> delegate;

/* Designated Initializer */
- (id) initWithFileURL:(NSURL *)paramURL
              delegate:(id<CloudDocumentProtocol>)paramDelegate;

@end
