//
//  NSValue+Boxing.m
//  iOS-StoreStructuresInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSValue+Boxing.h"

@implementation NSValue (Boxing)

+ (NSValue *)valueWithCGColor:(CGColorRef)color
{
    return [NSValue valueWithBytes:&color objCType:@encode(CGColorRef)];
}

- (CGColorRef)CGColorValue
{
    CGColorRef color;
    [self getValue:&color];
    return color;
}

@end
