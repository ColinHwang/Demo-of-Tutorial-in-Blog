//
//  NSSet+FilteredSet.h
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSSet (FilteredSet)

/**
 *  获取移除特定类别元素后的Set
 *
 *  @param aClass 需移除的类别
 */
- (NSSet *)setByFilteringOutObjectsFromClass:(Class)aClass;

/**
 *  获取移除Null类别元素后的Set
 */
- (NSSet *)setByFilteringOutNullObjects;

@end
