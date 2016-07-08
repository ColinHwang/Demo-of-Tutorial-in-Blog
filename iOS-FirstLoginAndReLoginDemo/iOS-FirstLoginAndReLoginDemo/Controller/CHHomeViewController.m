//
//  CHHomeViewController.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHHomeViewController.h"
#import "CHNavigationController.h"
#import "CHReLoginViewController.h"

#import "CHService.h"
#import "CHAccountHelper.h"

@interface CHHomeViewController ()

@property (nonatomic, weak) UIButton *button;

@end

@implementation CHHomeViewController

#pragma mark - Controls
- (UIButton *)button
{
    if (!_button)
    {
        UIButton *button = [UIButton new];
        
        [button setTitle:@"Click" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor cyanColor]];
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
    if ([CHAccountHelper isAccountExist])
    {
        [[[UIAlertView alloc] initWithTitle:@"You have logged in!" message:nil delegate:nil cancelButtonTitle:@"OK" otherButtonTitles:nil, nil] show];
        return;
    }
    
    [CHService handleSkipToReLoginViewControllerCompletion:nil];
}

@end
