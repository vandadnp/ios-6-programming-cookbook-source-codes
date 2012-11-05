//
//  CloudDocument.m
//  Storing User Documents in iCloud
//
//  Created by Vandad Nahavandipoor on 10/09/2011.
//  Copyright (c) 2011 Pixolity Ltd. All rights reserved.
//

#import "CloudDocument.h"

@implementation CloudDocument

- (id) initWithFileURL:(NSURL *)paramURL 
              delegate:(id<CloudDocumentProtocol>)paramDelegate{
  
  self = [super initWithFileURL:paramURL];
  
  if (self != nil){
    
    if (paramDelegate == nil){
      NSLog(@"Warning: no delegate is given.");
    }
    
    delegate = paramDelegate;
  }
  
  return self;
  
}

- (id) initWithFileURL:(NSURL *)paramURL{
  return [self initWithFileURL:paramURL
                      delegate:nil];
}

- (id) contentsForType:(NSString *)typeName 
                 error:(NSError *__autoreleasing *)outError{
  
  if ([self.documentText length] == 0){
    self.documentText = @"New Document";
  }
  
  return [self.documentText dataUsingEncoding:NSUTF8StringEncoding];
}

- (BOOL) loadFromContents:(id)contents 
                   ofType:(NSString *)typeName
                    error:(NSError *__autoreleasing *)outError{
  
  NSData *data = (NSData *)contents;
  
  if ([data length] == 0){
    self.documentText = @"New Document";
  } else {
    self.documentText = [[NSString alloc] initWithData:data
                                              encoding:NSUTF8StringEncoding];
  }
  
  if ([delegate respondsToSelector:@selector(cloudDocumentChanged:)]){
    [delegate cloudDocumentChanged:self];
  }
  
  return YES;
  
}

@end
