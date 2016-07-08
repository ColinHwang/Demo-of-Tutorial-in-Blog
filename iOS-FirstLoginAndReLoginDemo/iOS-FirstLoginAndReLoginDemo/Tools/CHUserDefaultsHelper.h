//
//  CHUserDefaultsHelper.h
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/7.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHUserDefaultsHelper : NSObject

+ (NSString *)stringWithKey:(NSString *)key;
+ (void)saveString:(NSString *)string withKey:(NSString *)key;

+ (void)removeObjectForKey:(NSString *)key;

@end



@interface CHUserDefaultsHelper (ConfigureAccount)

+ (void)saveAccount:(NSString *)account;
+ (NSString *)account;

+ (void)removeAccount;

@end