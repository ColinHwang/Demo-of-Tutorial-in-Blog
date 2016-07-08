//
//  CHService.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHService.h"
#import <UIKit/UIViewController.h>
#import "CHTabBarController.h"
#import "CHNavigationController.h"
#import "CHLoginViewController.h"
#import "CHReLoginViewController.h"

#import "CHAccountHelper.h"

@implementation CHService

#pragma mark - Login && Logout
+ (void)handleLoginWithParameters:(NSString *)parameters successHandle:(CHServiceSuccessHandle)success failureHandle:(CHServiceFailureHandle)failure allCompletionHandle:(CHServiceAllCompletionHandle)completion
{
    // Send Login Request
    BOOL sendLoginRequest = YES;
//    BOOL sendLoginRequest = NO;
    
    // If Login success
    if (sendLoginRequest)
    {
        // Save account
        [CHAccountHelper saveAccount:parameters];
        
        !success?:success();
        
        [CHService handleSkipToHomeViewControllerAfterLoginCompletion:completion];
        return;
    }
    
    // Failure
    !failure?:failure();
    
    !completion?:completion();
}

+ (void)handleLogoutSuccessHandle:(CHServiceSuccessHandle)success failureHandle:(CHServiceFailureHandle)failure allCompletionHandle:(CHServiceAllCompletionHandle)completion
{
    // Send Logout Request
    BOOL sendLogoutRequest = YES;
//    BOOL sendLoginRequest = NO;
    
    // If Logout success
    if (sendLogoutRequest)
    {
        // remove account
        [CHAccountHelper removeAccount];
        
        !success?:success();
        
        [CHService handleSkipToLoginViewControllerCompletion:completion];
        return;
    }
    
    // Failure
    !failure?:failure();
    
    !completion?:completion();
}

#pragma mark - Skip To
+ (void)handleSkipToLoginViewControllerCompletion:(CHServiceAllCompletionHandle)completion
{
    CHNavigationController *navigationController = [[CHNavigationController alloc] initWithRootViewController:[CHLoginViewController new]];
    
    [[UIApplication sharedApplication].keyWindow setRootViewController:navigationController];
    
    !completion?:completion();
}

+ (void)handleSkipToReLoginViewControllerCompletion:(CHServiceAllCompletionHandle)completion
{
    UIViewController *rootViewController = [UIApplication sharedApplication].keyWindow.rootViewController;
    
    if (!rootViewController || ![rootViewController isKindOfClass:[CHTabBarController class]]) return;
    
    CHNavigationController *navigationController = [[CHNavigationController alloc] initWithRootViewController:[CHReLoginViewController new]];
    
    [rootViewController presentViewController:navigationController animated:YES completion:completion];
}

+ (void)handleSkipToHomeViewControllerComletionHandle:(CHServiceAllCompletionHandle)completion
{
    [[UIApplication sharedApplication].keyWindow setRootViewController:[CHTabBarController new]];
    
    !completion?:completion();
}

+ (void)handleSkipToHomeViewControllerBeforeLoginCompletion:(CHServiceAllCompletionHandle)completion
{
    [CHService handleSkipToHomeViewControllerComletionHandle:completion];
}

+ (void)handleSkipToHomeViewControllerAfterLoginCompletion:(CHServiceAllCompletionHandle)completion
{
    [CHService handleSkipToHomeViewControllerComletionHandle:completion];
}

@end
