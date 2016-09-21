//
//  UIImage+ContentName.m
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "UIImage+ContentName.h"
#import "NSObject+SwizzleMethod.h"

static const int UI_IMAGE_BUFFER_KEY;

@implementation UIImage (ContentName)

- (NSMapTable *)imageBuffer
{
    NSMapTable *imageBuffer = [self getAssociatedValueForKey:&UI_IMAGE_BUFFER_KEY];
    if (!imageBuffer)
    {
        imageBuffer = [NSMapTable mapTableWithKeyOptions:NSPointerFunctionsWeakMemory valueOptions:NSPointerFunctionsWeakMemory];
        [self setAssociateValue:imageBuffer withKey:&UI_IMAGE_BUFFER_KEY];
    }
    return imageBuffer;
}

- (UIImage *)getImageWithContentName:(NSString *)name
{
    if (!name || name.length <= 0) return nil;
    /**
     name
     name.png
     name@2x.png
     */
    UIImage *image = [[self imageBuffer] objectForKey:name];
    if (image) return image;
    
    
    [[self imageBuffer] setObject:image forKey:name];
    
    return image;
}

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
