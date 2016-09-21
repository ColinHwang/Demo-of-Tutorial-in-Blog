//
//  NSObject+SwizzleMethod.m
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSObject+SwizzleMethod.h"
#import <objc/runtime.h>

@implementation NSObject (SwizzleMethod)

+ (BOOL)swizzleClassMethod:(SEL)originalSel withNewMethod:(SEL)newSel
{
    Class class = object_getClass(self);
    Method originalMethod = class_getInstanceMethod(class, originalSel);
    Method newMethod = class_getInstanceMethod(class, newSel);
    
    if (!originalMethod || !newMethod) return NO;
    
    method_exchangeImplementations(originalMethod, newMethod);
    
    return YES;
}

#pragma mark - Associate Value
- (void)setAssociateValue:(id)value withKey:(const void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

- (id)getAssociatedValueForKey:(const void *)key
{
    return objc_getAssociatedObject(self, key);
}

@end
