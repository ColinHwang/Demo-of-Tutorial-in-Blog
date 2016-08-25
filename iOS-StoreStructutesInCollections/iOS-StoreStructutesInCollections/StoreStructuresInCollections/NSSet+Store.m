//
//  NSSet+Store.m
//  iOS-StoreStructutesInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSSet+Store.h"
#import "NSValue+Boxing.h"

@implementation NSSet (Store)

- (CGColorRef)CGColorMember:(CGColorRef)color
{
    id aColor = [self member:[NSValue valueWithCGColor:color]];
    if (aColor || [aColor isKindOfClass:[NSValue class]]) return [aColor CGColorValue];
        
    return NULL;
}

- (CGColorRef)anyCGColor
{
    id color = [self anyObject];
    if (color || [color isKindOfClass:[NSValue class]]) return [color CGColorValue];
    
    return NULL;
}

- (BOOL)containsCGColort:(CGColorRef)color
{
    return [self containsObject:[NSValue valueWithCGColor:color]];
}

@end



@implementation NSMutableSet (Store)

- (void)addCGColor:(CGColorRef)color
{
    [self addObject:[NSValue valueWithCGColor:color]];
}

- (void)removeCGColor:(CGColorRef)color
{
    [self removeObject:[NSValue valueWithCGColor:color]];
}

@end