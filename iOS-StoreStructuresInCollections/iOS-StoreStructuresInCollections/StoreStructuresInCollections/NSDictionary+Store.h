//
//  NSDictionary+Store.h
//  iOS-StoreStructuresInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CGColor.h>

@interface NSDictionary (Store)

- (CGColorRef)CGColorForKey:(NSString *)key;
- (CGColorRef)CGColorForKey:(NSString *)key default:(CGColorRef)defaultValue;

@end



@interface NSMutableDictionary (Store)

- (void)setCGColor:(CGColorRef)color forKey:(NSString *)key;

@end