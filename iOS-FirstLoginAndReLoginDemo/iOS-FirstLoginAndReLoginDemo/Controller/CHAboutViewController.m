//
//  CHAboutViewController.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHAboutViewController.h"

#import "CHService.h"

@interface CHAboutViewController ()

@property (nonatomic, weak) UIButton *button;

@end

@implementation CHAboutViewController

#pragma mark - Controls
- (UIButton *)button
{
    if (!_button)
    {
        UIButton *button = [UIButton new];
        
        [button setTitle:@"Logout" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor redColor]];
        [button addTarget:self action:@selector(buttonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        self.button = button;
    }
    return _button;
}

#pragma mark - Life cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.button.frame = CGRectMake(0, ([UIScreen mainScreen].bounds.size.height-44)/2, [UIScreen mainScreen].bounds.size.width, 44);
}

#pragma mark - Touch Event
- (void)buttonClicked:(UIButton *)button
{
    [CHService handleLogoutSuccessHandle:^{
        
    } failureHandle:^{
        
    } allCompletionHandle:nil];
}

@end
