//
//  NSSet+Store.h
//  iOS-StoreStructuresInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGColor.h>

@interface NSSet (Store)

- (CGColorRef)CGColorMember:(CGColorRef)color;
- (CGColorRef)anyCGColor;
- (BOOL)containsCGColort:(CGColorRef)color;

@end



@interface NSMutableSet (Store)

- (void)addCGColor:(CGColorRef)color;
- (void)removeCGColor:(CGColorRef)color;

@end