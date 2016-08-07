//
//  CHLoginViewController.m
//  iOS-FirstLoginAndloginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHLoginViewController.h"

#import "CHLoginView.h"

#import "CHService.h"

@interface CHLoginViewController () <CHLoginViewDelegate>

@property (nonatomic, weak) CHLoginView *loginView;

@end

@implementation CHLoginViewController

#pragma mark - Controls
- (CHLoginView *)loginView
{
    if (!_loginView)
    {
        CHLoginView *loginView = [CHLoginView new];
        
        [self.view addSubview:loginView];
        self.loginView = loginView;
    }
    return _loginView;
}

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.loginView.delegate = self;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupNavigation];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.loginView.frame = [UIScreen mainScreen].bounds;
}

#pragma mark - Touch Event
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Layout
- (void)setupNavigation
{
    self.navigationItem.title = @"Login";
}

#pragma mark - CHLoginView Delegate
- (void)loginView:(CHLoginView *)loginView didClickLoginButton:(UIButton *)button
{
    [CHService handleLoginWithParameters:@"account" successHandle:^{
        
    } failureHandle:^{
        
    } allCompletionHandle:nil];
}

- (void)loginView:(CHLoginView *)loginView didClickLookArroundButton:(UIButton *)button
{
    [CHService handleSkipToHomeViewControllerBeforeLoginCompletion:nil];
}
 
@end
