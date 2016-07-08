//
//  CHService.h
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef void(^CHServiceSuccessHandle)();
typedef void(^CHServiceFailureHandle)();
typedef void(^CHServiceAllCompletionHandle)();

@interface CHService : NSObject

#pragma mark - Login && Logout
+ (void)handleLoginWithParameters:(NSString *)parameters successHandle:(CHServiceSuccessHandle)success failureHandle:(CHServiceFailureHandle)failure allCompletionHandle:(CHServiceAllCompletionHandle)completion;

+ (void)handleLogoutSuccessHandle:(CHServiceSuccessHandle)success failureHandle:(CHServiceFailureHandle)failure allCompletionHandle:(CHServiceAllCompletionHandle)completion;

#pragma mark - Skip To
+ (void)handleSkipToLoginViewControllerCompletion:(CHServiceAllCompletionHandle)completion;

+ (void)handleSkipToReLoginViewControllerCompletion:(CHServiceAllCompletionHandle)completion;

+ (void)handleSkipToHomeViewControllerBeforeLoginCompletion:(CHServiceAllCompletionHandle)completion;

+ (void)handleSkipToHomeViewControllerAfterLoginCompletion:(CHServiceAllCompletionHandle)completion;

@end
