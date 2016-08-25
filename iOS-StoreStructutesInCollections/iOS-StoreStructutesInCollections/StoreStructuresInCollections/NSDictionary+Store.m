//
//  NSDictionary+Store.m
//  iOS-StoreStructutesInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSDictionary+Store.h"
#import "NSValue+Boxing.h"

@implementation NSDictionary (Store)

- (CGColorRef)CGColorForKey:(NSString *)key
{
    return [self CGColorForKey:key default:NULL];
}

- (CGColorRef)CGColorForKey:(NSString *)key default:(CGColorRef)defaultValue
{
    if (!key) return defaultValue;
    id value = self[key];
    if (value && [value isKindOfClass:[NSValue class]]) return [value CGColorValue];
    
    return defaultValue;
}

@end



@implementation NSMutableDictionary (Store)

- (void)setCGColor:(CGColorRef)color forKey:(NSString *)key
{
    [self setValue:[NSValue valueWithCGColor:color] forKey:key];
}

@end