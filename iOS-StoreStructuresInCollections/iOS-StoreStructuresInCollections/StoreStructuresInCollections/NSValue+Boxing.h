//
//  NSValue+Boxing.h
//  iOS-StoreStructuresInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGColor.h>

@interface NSValue (Boxing)

/**
 *  Creates a new value object containing the specified CoreGraphics color structure. A new value object that contains the color information.
 *
 *  @param color A new value object that contains the color information.
 */
+ (NSValue *)valueWithCGColor:(CGColorRef)color;

/**
 *  Returns the CoreGraphics color structure representation of the value. The CoreGraphics color structure representation of the value.
 */
- (CGColorRef)CGColorValue;

@end
