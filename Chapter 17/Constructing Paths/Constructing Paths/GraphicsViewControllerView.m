//
//  GraphicsViewControllerView.m
//  Constructing Paths
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
- (void)drawRect:(CGRect)rect{
  
  /* Create the path */
  CGMutablePathRef path = CGPathCreateMutable();
  
  /* How big is our screen? We want the X to cover
   the whole screen */
  CGRect screenBounds = [[UIScreen mainScreen] bounds];
  
  /* Start from top-left */
  CGPathMoveToPoint(path,
                    NULL,
                    screenBounds.origin.x,
                    screenBounds.origin.y);
  
  /* Draw a line from top-left to bottom-right of the screen */
  CGPathAddLineToPoint(path,
                       NULL,
                       screenBounds.size.width,
                       screenBounds.size.height);
  
  /* Start another line from top-right */
  CGPathMoveToPoint(path,
                    NULL,
                    screenBounds.size.width,
                    screenBounds.origin.y);
  
  /* Draw a line from top-right to bottom-left */
  CGPathAddLineToPoint(path,
                       NULL,
                       screenBounds.origin.x,
                       screenBounds.size.height);
  
  /* Get the context that the path has to be drawn on */
  CGContextRef currentContext = UIGraphicsGetCurrentContext();
  
  /* Add the path to the context so we can
   draw it later */
  CGContextAddPath(currentContext,
                   path);
  
  /* Set the blue color as the stroke color */
  [[UIColor blueColor] setStroke];
  
  /* Draw the path with stroke color */
  CGContextDrawPath(currentContext,
                    kCGPathStroke);
  
  /* Finally release the path object */
  CGPathRelease(path);
  
}

@end
