//
//  GraphicsViewControllerView.m
//  Scaling Shapes Drawn on Graphic Contexts
//
//  Created by Vandad Nahavandipoor on 17/07/2011.
//  Copyright 2011 Pixolity Ltd. All rights reserved.
//

#import "GraphicsViewControllerView.h"

@implementation GraphicsViewControllerView

- (id)initWithFrame:(CGRect)frame
{
  self = [super initWithFrame:frame];
  if (self) {
    // Initialization code
  }
  return self;
}

- (void)drawRect:(CGRect)rect{
  
  /* Create the path first. Just the path handle. */
  CGMutablePathRef path = CGPathCreateMutable();
  
  /* Here are our rectangle boundaries */
  CGRect rectangle = CGRectMake(10.0f,
                                10.0f,
                                200.0f,
                                300.0f);
  
  /* Add the rectangle to the path */
  CGPathAddRect(path,
                NULL,
                rectangle);
  
  /* Get the handle to the current context */
  CGContextRef currentContext = UIGraphicsGetCurrentContext();
  
  /* Scale everything drawn on the current
   graphics context to half its size */
  CGContextScaleCTM(currentContext,
                    0.5f,
                    0.5f);
  
  /* Add the path to the context */
  CGContextAddPath(currentContext,
                   path);
  
  /* Set the fill color to cornflower blue */
  [[UIColor colorWithRed:0.20f
                   green:0.60f
                    blue:0.80f
                   alpha:1.0f] setFill];
  
  /* Set the stroke color to brown */
  [[UIColor brownColor] setStroke];
  
  /* Set the line width (for the stroke) to 5 */
  CGContextSetLineWidth(currentContext,
                        5.0f);
  
  /* Stroke and fill the path on the context */
  CGContextDrawPath(currentContext,
                    kCGPathFillStroke);
  
  /* Dispose of the path */
  CGPathRelease(path);
  
}

@end
