//
//  UIImage+ContentName.h
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ContentName)

+ (UIImage *)imageWithContentName:(NSString *)name;

@end
