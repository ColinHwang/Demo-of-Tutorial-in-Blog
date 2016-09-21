//
//  NSObject+SwizzleMethod.h
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SwizzleMethod)

/**
*  Swap two class method's implementation in one class.
*
*  @param originalSel original Selector.
*  @param newSel      new Selector.
*/
+ (BOOL)swizzleClassMethod:(SEL)originalSel withNewMethod:(SEL)newSel;

#pragma mark - Associate Value
- (void)setAssociateValue:(id)value withKey:(const void *)key;

- (id)getAssociatedValueForKey:(const void *)key;

@end
