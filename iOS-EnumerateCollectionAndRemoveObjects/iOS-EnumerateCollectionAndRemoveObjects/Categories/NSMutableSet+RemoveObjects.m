//
//  NSMutableSet+RemoveObjects.m
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSMutableSet+RemoveObjects.h"
#import "NSArray+FilteredArray.h"
#import "NSDictionary+FilteredDictionary.h"
#import "NSSet+FilteredSet.h"

@implementation NSMutableSet (RemoveObjects)

- (void)replaceEenumerateObject:(id)obj withObject:(id)otherObj
{
    [self removeObject:obj];
    
    if (otherObj)
    {
        [self addObject:otherObj];
    }
}

- (void)removeObjectsFromClass:(Class)aClass
{
    if (!self || [self isKindOfClass:[NSNull class]]) return;
    
    if (self.count == 0) return;
    
    __weak typeof(self) weakSelf = self;
    
    [self enumerateObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull obj, BOOL * _Nonnull stop) {
        if (obj==nil || [obj isKindOfClass:aClass])
        {
            [weakSelf removeObject:obj];
            return;
        }
        
        id targetObj = nil;
        
        if ([obj isKindOfClass:[NSDictionary class]])
        {
            targetObj = [obj dictionaryByFilteringOutObjectsFromClass:aClass];
            
            [weakSelf replaceEenumerateObject:obj withObject:targetObj];
            return;
        }
        
        if ([obj isKindOfClass:[NSArray class]])
        {
            targetObj = [obj arrayByFilteringOutObjectsFromClass:aClass];
            
            [weakSelf replaceEenumerateObject:obj withObject:targetObj];
            return;
        }
        
        if ([obj isKindOfClass:[NSSet class]])
        {
            targetObj = [obj setByFilteringOutObjectsFromClass:aClass];
            
            [weakSelf replaceEenumerateObject:obj withObject:targetObj];
            return;
        }
    }];
}

- (void)removeNullObjects
{
    [self removeObjectsFromClass:[NSNull class]];
}

@end
