//
//  UIWindow+Custom.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "UIWindow+Custom.h"
#import "CHTabBarController.h"
#import "CHNavigationController.h"
#import "CHLoginViewController.h"

#import "CHService.h"
#import "CHAccountHelper.h"

@implementation UIWindow (Custom)

- (void)switchRootViewControllerWithLaunchOptions:(NSDictionary *)launchOptions
{
    if ([CHAccountHelper isAccountExist])
    {
        [CHService handleSkipToHomeViewControllerAfterLoginCompletion:nil];
        return;
    }
    
    [CHService handleSkipToLoginViewControllerCompletion:nil];
}

@end
