//
//  Parsing_XML_with_NSXMLParserAppDelegate.h
//  Parsing XML with NSXMLParser
//
//  Created by Vandad Nahavandipoor on 20/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

/* 1 */
//#import <UIKit/UIKit.h>
//
//@interface Parsing_XML_with_NSXMLParserAppDelegate
//           : UIResponder <UIApplicationDelegate, NSXMLParserDelegate>
//
//@property (nonatomic, strong) UIWindow *window;
//@property (nonatomic, strong) NSXMLParser *xmlParser;
//
//@end

/* 2 */
#import <UIKit/UIKit.h>

@class XMLElement;

@interface Parsing_XML_with_NSXMLParserAppDelegate
           : UIResponder <UIApplicationDelegate, NSXMLParserDelegate>

@property (nonatomic, strong) UIWindow *window;
@property (nonatomic, strong) NSXMLParser *xmlParser;
@property (nonatomic, strong) XMLElement *rootElement;
@property (nonatomic, strong) XMLElement *currentElementPointer;

@end
