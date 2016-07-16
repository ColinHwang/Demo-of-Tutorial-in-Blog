//
//  NSObject+SwizzleMethod.h
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (SwizzleMethod)

+ (BOOL)swizzleClassMethod:(SEL)originalSel withNewMethod:(SEL)newSel;

@end
