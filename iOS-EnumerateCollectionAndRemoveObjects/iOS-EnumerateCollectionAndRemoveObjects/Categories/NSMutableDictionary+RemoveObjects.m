//
//  NSMutableDictionary+RemoveObjects.m
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSMutableDictionary+RemoveObjects.h"
#import "NSArray+FilteredArray.h"
#import "NSDictionary+FilteredDictionary.h"
#import "NSSet+FilteredSet.h"

@implementation NSMutableDictionary (RemoveObjects)

- (void)replaceEnumerateObject:(id)object forKey:(NSString *)key
{
    if (!key) return;
    if (![[self allKeys] containsObject:key]) return;
    
    if (!object)
    {
        [self removeObjectForKey:key];
        return;
    }
    
    [self setObject:object forKey:key];
}

- (void)removeEnumerateObject:(id)obj fromClass:(Class)aClass forKey:(NSString *)key
{
    if (!obj || [obj isKindOfClass:aClass])
    {
        [self removeObjectForKey:key];
        return;
    }
    
    if ([obj isKindOfClass:[NSDictionary class]])
    {
        obj = [obj dictionaryByFilteringOutObjectsFromClass:aClass];
        
        [self replaceEnumerateObject:obj forKey:key];
        return;
    }
    
    if ([obj isKindOfClass:[NSArray class]])
    {
        obj = [obj arrayByFilteringOutObjectsFromClass:aClass];
        
        [self replaceEnumerateObject:obj forKey:key];
        return;
    }
    
    if ([obj isKindOfClass:[NSSet class]])
    {
        obj = [obj setByFilteringOutObjectsFromClass:aClass];
        
        [self replaceEnumerateObject:obj forKey:key];
        return;
    }
}

- (void)removeObjectsFromClass:(Class)aClass forKey:(NSString *)key
{
    if (!key) return;
    if (![[self allKeys] containsObject:key]) return;
    
    if (self == nil || [self isKindOfClass:[NSNull class]]) return;
    
    id obj = [self objectForKey:key];
    
    [self removeEnumerateObject:obj fromClass:aClass forKey:key];
}

- (void)removeObjectsFromClass:(Class)aClass
{
    if (self == nil || [self isKindOfClass:[NSNull class]]) return;
    
    __weak typeof(self) weakSelf = self;
    
    [self enumerateKeysAndObjectsWithOptions:NSEnumerationConcurrent usingBlock:^(id  _Nonnull key, id  _Nonnull obj, BOOL * _Nonnull stop) {
        
        [weakSelf removeEnumerateObject:obj fromClass:aClass forKey:key];
    }];
}

- (void)removeNullOrNilObjects
{
    [self removeObjectsFromClass:[NSNull class]];
}

@end
