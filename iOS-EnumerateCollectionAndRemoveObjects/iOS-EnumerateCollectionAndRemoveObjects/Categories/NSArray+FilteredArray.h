//
//  NSArray+FilteredArray.h
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSArray (FilteredArray)

/**
 *  获取移除特定类别元素后的新数组
 *
 *  @param class 需移除的类别
 */
- (NSArray *)arrayByFilteringOutObjectsFromClass:(Class)aClass;

/**
 *  获取移除Null类别元素后的新数组
 */
- (NSArray *)arrayByFilteringOutNullObjects;

@end
