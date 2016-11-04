//
//  UIImage+Swizzle.m
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "UIImage+Swizzle.h"
#import "NSObject+SwizzleMethod.h"
#import "UIImage+ContentName.h"

@implementation UIImage (Swizzle)

+ (void)load
{
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzleClassMethod:@selector(imageNamed:) withNewMethod:@selector(imageWithContentName:)];
    });
}

@end
