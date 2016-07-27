//
//  NSDictionary+FilteredDictionary.m
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSDictionary+FilteredDictionary.h"
#import "NSMutableDictionary+RemoveObjects.h"

@implementation NSDictionary (FilteredDictionary)

- (NSDictionary *)dictionaryByFilteringOutObjectsFromClass:(Class)aClass
{
    if (!self || [self isKindOfClass:[NSNull class]]) return nil;
    
    if (![self allKeys].count) return self;
    
    NSMutableDictionary *dictionary = [NSMutableDictionary dictionaryWithDictionary:self];
    [dictionary removeObjectsFromClass:aClass];
    
    return [dictionary copy];
}

- (NSDictionary *)dictionaryByFilteringOutNullOrNilObjects
{
    return [self dictionaryByFilteringOutObjectsFromClass:[NSNull class]];
}

@end
