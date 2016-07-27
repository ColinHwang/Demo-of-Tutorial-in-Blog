//
//  NSSet+FilteredSet.m
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSSet+FilteredSet.h"
#import "NSMutableSet+RemoveObjects.h"

@implementation NSSet (FilteredSet)

- (NSSet *)setByFilteringOutObjectsFromClass:(Class)aClass
{
    if (!self || [self isKindOfClass:[NSNull class]]) return nil;
    
    if (self.count == 0) return self;
    
    NSMutableSet *set = [NSMutableSet setWithSet:self];
    [set removeObjectsFromClass:aClass];
    
    return [set copy];
}

- (NSSet *)setByFilteringOutNullObjects
{
    return [self setByFilteringOutObjectsFromClass:[NSNull class]];
}

@end
