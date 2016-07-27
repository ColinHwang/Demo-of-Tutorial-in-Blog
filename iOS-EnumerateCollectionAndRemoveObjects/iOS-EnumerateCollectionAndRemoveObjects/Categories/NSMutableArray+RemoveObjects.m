//
//  NSMutableArray+RemoveObjects.m
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSMutableArray+RemoveObjects.h"
#import "NSArray+FilteredArray.h"
#import "NSDictionary+FilteredDictionary.h"
#import "NSSet+FilteredSet.h"

@implementation NSMutableArray (RemoveObjects)

- (void)replaceEnumerateObjectAtIndex:(NSUInteger)index withObject:(id)obj
{
    if (!obj)
    {
        [self removeObject:obj];
        return;
    }
    
    [self replaceObjectAtIndex:index withObject:obj];
}

- (void)removeObjectsFromClass:(Class)aClass
{
    if (!self || [self isKindOfClass:[NSNull class]]) return;
    
    if (self.count == 0) return;
    
    __weak typeof(self) weakSelf = self;
    
    [self enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (obj==nil || [obj isKindOfClass:aClass])
        {
            [weakSelf removeObject:obj];
            return;
        }
        
        if ([obj isKindOfClass:[NSDictionary class]])
        {
            obj = [obj dictionaryByFilteringOutObjectsFromClass:aClass];
            
            [weakSelf replaceEnumerateObjectAtIndex:idx withObject:obj];
            return;
        }
        
        if ([obj isKindOfClass:[NSArray class]])
        {
            obj = [obj arrayByFilteringOutObjectsFromClass:aClass];
            
            [weakSelf replaceEnumerateObjectAtIndex:idx withObject:obj];
            return;
        }
        
        if ([obj isKindOfClass:[NSSet class]])
        {
            obj = [obj setByFilteringOutObjectsFromClass:aClass];
            
            [weakSelf replaceEnumerateObjectAtIndex:idx withObject:obj];
            return;
        }
    }];
}

- (void)removeNullObjects
{
    [self removeObjectsFromClass:[NSNull class]];
}

@end
