//
//  Parsing_XML_with_NSXMLParserAppDelegate.m
//  Parsing XML with NSXMLParser
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import "Parsing_XML_with_NSXMLParserAppDelegate.h"
//
//@implementation Parsing_XML_with_NSXMLParserAppDelegate
//
//- (BOOL)            application:(UIApplication *)application 
//  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
//  
//  NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"MyXML"
//                                  ofType:@"xml"];
//  
//  NSData *xml = [[NSData alloc] initWithContentsOfFile:xmlFilePath];
//  
//  self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
//  self.xmlParser.delegate = self;
//  if ([self.xmlParser parse]){
//    NSLog(@"The XML is parsed.");
//  } else{
//    NSLog(@"Failed to parse the XML");
//  }
//  
//  self.window = [[UIWindow alloc] initWithFrame:
//                 [[UIScreen mainScreen] bounds]];
//  
//  self.window.backgroundColor = [UIColor whiteColor];
//  [self.window makeKeyAndVisible];
//  return YES;
//}
//
//@end

/* 2 */
#import "Parsing_XML_with_NSXMLParserAppDelegate.h"
#import "XMLElement.h"

@implementation Parsing_XML_with_NSXMLParserAppDelegate

- (void)parserDidStartDocument:(NSXMLParser *)parser{
  self.rootElement = nil;
  self.currentElementPointer = nil;
}

- (void)parserDidEndDocument:(NSXMLParser *)parser{
  self.currentElementPointer = nil;
}

- (void)        parser:(NSXMLParser *)parser 
       didStartElement:(NSString *)elementName 
          namespaceURI:(NSString *)namespaceURI
         qualifiedName:(NSString *)qName
            attributes:(NSDictionary *)attributeDict{
  
  if (self.rootElement == nil){
    /* We don't have a root element. Create it and point to it */
    self.rootElement = [[XMLElement alloc] init];
    self.currentElementPointer = self.rootElement;
  } else {
    /* Already have root. Create new element and add it as one of
     the subelements of the current element */
    XMLElement *newElement = [[XMLElement alloc] init];
    newElement.parent = self.currentElementPointer;
    [self.currentElementPointer.subElements addObject:newElement];
    self.currentElementPointer = newElement;
  }

  self.currentElementPointer.name = elementName;
  self.currentElementPointer.attributes = attributeDict;
  
}

- (void)        parser:(NSXMLParser *)parser
         didEndElement:(NSString *)elementName
          namespaceURI:(NSString *)namespaceURI
         qualifiedName:(NSString *)qName{
  
  self.currentElementPointer = self.currentElementPointer.parent;
  
}

- (void)        parser:(NSXMLParser *)parser 
       foundCharacters:(NSString *)string{
  
  if ([self.currentElementPointer.text length] > 0){
    self.currentElementPointer.text = 
      [self.currentElementPointer.text stringByAppendingString:string];
  } else {
    self.currentElementPointer.text = string;
  }
  
}

- (BOOL)            application:(UIApplication *)application 
  didFinishLaunchingWithOptions:(NSDictionary *)launchOptions{
  
  NSString *xmlFilePath = [[NSBundle mainBundle] pathForResource:@"MyXML"
                                                          ofType:@"xml"];
  
  NSData *xml = [[NSData alloc] initWithContentsOfFile:xmlFilePath];
  
  self.xmlParser = [[NSXMLParser alloc] initWithData:xml];
  self.xmlParser.delegate = self;
  if ([self.xmlParser parse]){
    NSLog(@"The XML is parsed.");
    
    /* self.rootElement is now the root element in the XML */
    XMLElement *element = [self.rootElement.subElements objectAtIndex:1];
    NSLog(@"%@", element.subElements);
    
  } else{
    NSLog(@"Failed to parse the XML");
  }
  
  self.window = [[UIWindow alloc] initWithFrame:
                 [[UIScreen mainScreen] bounds]];
  
  self.window.backgroundColor = [UIColor whiteColor];
  [self.window makeKeyAndVisible];
  return YES;
}

@end