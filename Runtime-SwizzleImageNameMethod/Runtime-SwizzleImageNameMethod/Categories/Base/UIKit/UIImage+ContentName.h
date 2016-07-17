//
//  UIImage+ContentName.h
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (ContentName)

/**
 *  Returns the image object associated with the specified filename. The image object for the specified file, or nil if the method could not find the specified image. 
    if the file is in PNG format, it is not necessary to specify the .PNG filename extension.
    This method does not cache the image object.
 *
 *  @param name The name of the file. if the file is not in PNG format, it is necessary to specify the filename extension.
 */
+ (UIImage *)imageWithContentName:(NSString *)name;

@end
