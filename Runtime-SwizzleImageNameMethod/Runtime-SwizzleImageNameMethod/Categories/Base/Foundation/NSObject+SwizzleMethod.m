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

@end
