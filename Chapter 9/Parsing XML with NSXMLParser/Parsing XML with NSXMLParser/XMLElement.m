//
//  XMLElement.m
//  Parsing XML with NSXMLParser
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "XMLElement.h"

@implementation XMLElement

- (NSMutableArray *) subElements{
  if (_subElements == nil){
    _subElements = [[NSMutableArray alloc] init];
  }
  return _subElements;
}

@end
