//
//  GraphicsViewControllerView.m
//  Constructing, Setting, and Using Colors
//
//  Created by Vandad Nahavandipoor on 17/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "GraphicsViewControllerView.h"

@implementation GraphicsViewControllerView

- (id)initWithFrame:(CGRect)frame{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
  }
  return self;
}

/* 1 */
//- (void)drawRect:(CGRect)rect{
//  // Drawing code
//  
//  /* Load the color */
//  UIColor *magentaColor =[UIColor colorWithRed:0.5f
//                                         green:0.0f
//                                          blue:0.5f
//                                         alpha:1.0f];
//  
//  /* Set the color in the graphical context */
//  [magentaColor set];
//  
//  /* Load the font */
//  UIFont *helveticaBold = [UIFont fontWithName:@"HelveticaNeue-Bold"
//                                          size:30.0f];
//  
//  /* Our string to be drawn */
//  NSString *myString = @"I Learn Really Fast";
//  
//  /* Draw the string using the font. The color has
//   already been set */
//  [myString drawAtPoint:CGPointMake(25, 190)
//               withFont:helveticaBold];
//  
//}

/* 2 */
//- (void)drawRect:(CGRect)rect{
//  // Drawing code
//  
//  /* Load the color */
//  UIColor *magentaColor = [UIColor colorWithRed:0.5f
//                                          green:0.0f
//                                           blue:0.5f
//                                          alpha:1.0f];
//  
//  /* Set the color in the graphical context */
//  [magentaColor set];
//  
//  /* Load the font */
//  UIFont *helveticaBold = [UIFont boldSystemFontOfSize:30];
//  
//  /* Our string to be drawn */
//  NSString *myString = @"I Learn Really Fast";
//  
//  /* Draw the string using the font. The color has
//   already been set */
//  [myString drawInRect:CGRectMake(100,  /* x */
//                                  120,  /* y */
//                                  100,  /* width */
//                                  200)  /* height */
//              withFont:helveticaBold];
//  
//}

/* 3 */
- (void) drawRect:(CGRect)rect{
  
  /* Load the color */
  UIColor *steelBlueColor = [UIColor colorWithRed:0.3f
                                            green:0.4f
                                             blue:0.6f
                                            alpha:1.0f];
  
  CGColorRef colorRef = [steelBlueColor CGColor];
  
  const CGFloat *components = CGColorGetComponents(colorRef);
  
  NSUInteger componentsCount = CGColorGetNumberOfComponents(colorRef);
  
  NSUInteger counter = 0;
  for (counter = 0;
       counter < componentsCount;
       counter++){
    NSLog(@"Component %lu = %.02f",
          (unsigned long)counter + 1,
          components[counter]);
  }
  
}

@end
