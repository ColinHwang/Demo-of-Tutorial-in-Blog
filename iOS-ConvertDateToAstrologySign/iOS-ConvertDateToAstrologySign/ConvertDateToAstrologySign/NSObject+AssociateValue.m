//
//  NSObject+AssociateValue.m
//  iOS-ConvertDateToAstrologySign
//
//  Created by colin on 16/9/21.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSObject+AssociateValue.h"
#import <objc/runtime.h>

@implementation NSObject (AssociateValue)

- (void)setAssociateValue:(id)value withKey:(const void *)key
{
    objc_setAssociatedObject(self, key, value, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}


- (id)getAssociatedValueForKey:(const void *)key
{
    return objc_getAssociatedObject(self, key);
}

@end
