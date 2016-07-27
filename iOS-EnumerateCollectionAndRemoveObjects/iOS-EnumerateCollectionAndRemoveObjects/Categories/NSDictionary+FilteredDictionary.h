//
//  NSDictionary+FilteredDictionary.h
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSDictionary (FilteredDictionary)

/**
 *  获取移除所有Keys对应的特定类别元素的新字典
 *
 *  @param class 需移除的类别
 */
- (NSDictionary *)dictionaryByFilteringOutObjectsFromClass:(Class)aClass;

/**
 *  获取移除所有Keys对应的Null类别元素的新字典
 */
- (NSDictionary *)dictionaryByFilteringOutNullOrNilObjects;

@end
