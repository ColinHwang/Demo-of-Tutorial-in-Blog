//
//  CHAccountHelper.h
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CHAccountHelper : NSObject

+ (NSString *)account;

+ (void)saveAccount:(NSString *)account;

+ (void)removeAccount;

+ (BOOL)isAccountExist;

@end
