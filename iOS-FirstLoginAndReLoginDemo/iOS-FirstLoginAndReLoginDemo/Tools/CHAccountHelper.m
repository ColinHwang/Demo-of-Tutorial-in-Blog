//
//  CHAccountHelper.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHAccountHelper.h"
#import "CHUserDefaultsHelper.h"

@implementation CHAccountHelper

+ (NSString *)account
{
    return [CHUserDefaultsHelper account];
}

+ (void)saveAccount:(NSString *)account
{
    // Check Account
    
    // Save Account
    [CHUserDefaultsHelper saveAccount:account];
}

+ (void)removeAccount
{
    [CHUserDefaultsHelper removeAccount];
}

+ (BOOL)isAccountExist
{
    NSString *account = [CHAccountHelper account];
    if (account && account.length > 0)
    {
        return YES;
    }
    
    return NO;
}

@end
