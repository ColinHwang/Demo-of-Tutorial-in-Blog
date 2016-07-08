//
//  CHLoginViewController.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHLoginViewController.h"

#import "CHLoginView.h"

#import "CHService.h"

@interface CHLoginViewController () <CHLoginViewDelegate>

@property (nonatomic, weak) CHLoginView *reLoginView;

@end

@implementation CHLoginViewController

#pragma mark - Controls
- (CHLoginView *)reLoginView
{
    if (!_reLoginView)
    {
        CHLoginView *reLoginView = [CHLoginView new];
        
        [self.view addSubview:reLoginView];
        self.reLoginView = reLoginView;
    }
    return _reLoginView;
}

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.reLoginView.delegate = self;
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    [self setupNavigation];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.reLoginView.frame = [UIScreen mainScreen].bounds;
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
