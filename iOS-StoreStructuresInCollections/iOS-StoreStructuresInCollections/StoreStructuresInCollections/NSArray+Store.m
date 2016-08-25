//
//  NSArray+Store.m
//  iOS-StoreStructuresInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSArray+Store.h"
#import "NSValue+Boxing.h"

@implementation NSArray (Store)

- (CGColorRef)CGColorAtIndex:(NSUInteger)index
{
    id color = [self objectAtIndex:index];
    if (color && [color isKindOfClass:[NSValue class]]) return [color CGColorValue];

    return NULL;
}

@end



@implementation NSMutableArray (Store)

- (void)addCGColor:(CGColorRef)color
{
    [self addObject:[NSValue valueWithCGColor:color]];
}

- (void)insertCGColor:(CGColorRef)color atIndex:(NSUInteger)index
{
    [self insertObject:[NSValue valueWithCGColor:color] atIndex:index];
}

- (void)replaceObjectAtIndex:(NSUInteger)index withCGColor:(CGColorRef)color
{
    [self replaceObjectAtIndex:index withObject:[NSValue valueWithCGColor:color]];
}

@end