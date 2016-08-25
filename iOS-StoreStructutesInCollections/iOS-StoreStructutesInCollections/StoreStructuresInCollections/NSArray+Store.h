//
//  NSArray+Store.h
//  iOS-StoreStructutesInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGColor.h>

@interface NSArray (Store)

- (CGColorRef)CGColorAtIndex:(NSUInteger)index;

@end



@interface NSMutableArray (Store)

- (void)addCGColor:(CGColorRef)color;
- (void)insertCGColor:(CGColorRef)color atIndex:(NSUInteger)index;
- (void)replaceObjectAtIndex:(NSUInteger)index withCGColor:(CGColorRef)color;

@end