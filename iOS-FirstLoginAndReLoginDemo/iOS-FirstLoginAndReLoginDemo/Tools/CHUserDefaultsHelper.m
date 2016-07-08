//
//  CHUserDefaultsHelper.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/7.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHUserDefaultsHelper.h"

@implementation CHUserDefaultsHelper

+ (NSString *)stringWithKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    return [userDefaults stringForKey:key];
}

+ (void)saveString:(NSString *)string withKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults setObject:string forKey:key];
    [userDefaults synchronize];
}

+ (void)removeObjectForKey:(NSString *)key
{
    NSUserDefaults *userDefaults = [NSUserDefaults standardUserDefaults];
    [userDefaults removeObjectForKey:key];
    [userDefaults synchronize];
}

@end



static NSString * const ACCOUNT_KEY = @"account";

@implementation CHUserDefaultsHelper (configureAccount)

+ (void)saveAccount:(NSString *)account
{
    [CHUserDefaultsHelper saveString:account withKey:ACCOUNT_KEY];
}

+ (NSString *)account
{
    return [CHUserDefaultsHelper stringWithKey:ACCOUNT_KEY];
}

+ (void)removeAccount
{
    [CHUserDefaultsHelper removeObjectForKey:ACCOUNT_KEY];
}

@end