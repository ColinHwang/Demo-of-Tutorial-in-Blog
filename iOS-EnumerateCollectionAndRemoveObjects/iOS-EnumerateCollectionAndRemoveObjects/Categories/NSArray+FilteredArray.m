//
//  NSArray+FilteredArray.m
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSArray+FilteredArray.h"
#import "NSMutableArray+RemoveObjects.h"

@implementation NSArray (FilteredArray)

- (NSArray *)arrayByFilteringOutObjectsFromClass:(Class)aClass
{
    if (!self || [self isKindOfClass:[NSNull class]]) return nil;
    
    if (self.count == 0) return self;
    
    NSMutableArray *filteredArray = [NSMutableArray arrayWithArray:self];
    
    [filteredArray removeObjectsFromClass:aClass];
    
    return [filteredArray copy];
}

- (NSArray *)arrayByFilteringOutNullObjects
{
    return [self arrayByFilteringOutObjectsFromClass:[NSNull class]];
}

@end
