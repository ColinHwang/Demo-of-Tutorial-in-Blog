//
//  NSMutableDictionary+RemoveObjects.h
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableDictionary (RemoveObjects)

/**
 *  移除字典内Key对应的特定类别的元素
 *
 *  @param aClass 需移除的类别
 *  @param key    Key
 */
- (void)removeObjectsFromClass:(Class)aClass forKey:(NSString *)key;

/**
 *  移除字典内所有Keys对应的特定类别的元素
 *
 *  @param aClass 需移除的类别
 */
- (void)removeObjectsFromClass:(Class)aClass;

/**
 *  移除字典内所有Keys对应的nil或Null类别的元素
 */
- (void)removeNullOrNilObjects;

@end
