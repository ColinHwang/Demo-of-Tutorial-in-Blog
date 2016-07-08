//
//  CHTabBarController.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHTabBarController.h"
#import "CHNavigationController.h"
#import "CHHomeViewController.h"
#import "CHAboutViewController.h"

#import "CHService.h"
#import "CHAccountHelper.h"

@interface CHTabBarController () <UITabBarControllerDelegate>

@end

@implementation CHTabBarController
#pragma mark - Lifecycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self setupChildViewControllers];
    
    self.delegate = self;
}

#pragma mark - Private Method
- (void)setupChildViewControllers
{
    CHHomeViewController *homeViewController = [[CHHomeViewController alloc] init];
    [self addChildViewController:homeViewController withTitle:@"Home" image:nil selectedImage:nil];

    CHAboutViewController *aboutViewController = [[CHAboutViewController alloc] init];
    [self addChildViewController:aboutViewController withTitle:@"About" image:nil selectedImage:nil];
}

- (void)addChildViewController:(UIViewController *)childViewController withTitle:(NSString *)title image:(UIImage *)image selectedImage:(UIImage *)selectedImage
{
    childViewController.title = title;
    
    CHNavigationController *navigationController = [[CHNavigationController alloc] initWithRootViewController:childViewController];
    
    [self addChildViewController:navigationController];
}

#pragma mark - UITabBarController Delegate
- (BOOL)tabBarController:(UITabBarController *)tabBarController shouldSelectViewController:(UIViewController *)viewController
{
    if (![CHAccountHelper isAccountExist])
    {
        if ([[(CHNavigationController *)viewController topViewController] isKindOfClass:[CHAboutViewController class]])
        {
            [CHService handleSkipToReLoginViewControllerCompletion:nil];
            return NO;
        }
    }

    return YES;
}

@end
