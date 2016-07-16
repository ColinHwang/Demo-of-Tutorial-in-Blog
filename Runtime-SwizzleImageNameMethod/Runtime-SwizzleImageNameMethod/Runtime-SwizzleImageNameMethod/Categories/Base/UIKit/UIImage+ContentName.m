//
//  UIImage+ContentName.m
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "UIImage+ContentName.h"

@implementation UIImage (ContentName)

+ (UIImage *)imageWithContentName:(NSString *)name
{
    if (!name || name.length <= 0) return nil;
    
    NSString *path = [[NSBundle mainBundle] pathForResource:name ofType:nil];
    
    if (!path)
    {
        path = [[NSBundle mainBundle] pathForResource:name ofType:@".png"];
        
        if (!path)
        {
            path = [[NSBundle mainBundle] pathForResource:name ofType:@".PNG"];
        }
    }
    
    return [UIImage imageWithContentsOfFile:path];
}

@end
