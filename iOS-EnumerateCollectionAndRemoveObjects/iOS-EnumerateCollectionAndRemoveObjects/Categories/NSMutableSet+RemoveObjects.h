//
//  NSMutableSet+RemoveObjects.h
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSMutableSet (RemoveObjects)

/**
 *  移除Set内所有特定类别的元素
 *
 *  @param aClass 需移除的类别
 */
- (void)removeObjectsFromClass:(Class)aClass;

/**
 *  移除Set内所有Null或nil类别的元素
 */
- (void)removeNullObjects;

@end
