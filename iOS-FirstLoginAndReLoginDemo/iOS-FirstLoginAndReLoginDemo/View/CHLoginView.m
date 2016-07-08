//
//  CHLoginView.m
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHLoginView.h"

@interface CHLoginView ()

@property (nonatomic, weak) UIButton *loginButton;

@property (nonatomic, weak) UIButton *lookArroundButton;

@end

@implementation CHLoginView

#pragma mark - Controls
- (UIButton *)loginButton
{
    if (!_loginButton)
    {
        UIButton *loginButton = [UIButton new];

        [loginButton setTitle:@"Login" forState:UIControlStateNormal];
        [loginButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [loginButton setBackgroundColor:[UIColor yellowColor]];
        [loginButton setExclusiveTouch:YES];
        [loginButton addTarget:self action:@selector(loginButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:loginButton];
        self.loginButton = loginButton;
    }
    return _loginButton;
}

- (UIButton *)lookArroundButton
{
    if (!_lookArroundButton)
    {
        UIButton *lookArroundButton = [UIButton new];
        
        [lookArroundButton setTitle:@"Look Arround" forState:UIControlStateNormal];
        [lookArroundButton setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [lookArroundButton setBackgroundColor:[UIColor greenColor]];
        [lookArroundButton setExclusiveTouch:YES];
        [lookArroundButton addTarget:self action:@selector(lookArroundButtonClicked:) forControlEvents:UIControlEventTouchUpInside];
        
        [self addSubview:lookArroundButton];
        self.lookArroundButton = lookArroundButton;
    }
    return _lookArroundButton;
}

#pragma mark - Initialize
- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self)
    {
        [self setBackgroundColor:[UIColor lightGrayColor]];
    }
    return self;
}

#pragma mark - Touch Event
- (void)loginButtonClicked:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(loginView:didClickLoginButton:)])
    {
        [self.delegate loginView:self didClickLoginButton:button];
    }
}

- (void)lookArroundButtonClicked:(UIButton *)button
{
    if ([self.delegate respondsToSelector:@selector(loginView:didClickLookArroundButton:)])
    {
        [self.delegate loginView:self didClickLookArroundButton:button];
    }
}

#pragma mark - Layout
- (void)layoutSubviews
{
    [super layoutSubviews];
    
    CGFloat viewWidth = CGRectGetWidth(self.frame);
    CGFloat viewHeight = CGRectGetHeight(self.frame);
    
    self.loginButton.frame = CGRectMake(0, viewHeight/3, viewWidth, 44);
    self.lookArroundButton.frame = CGRectMake(0, viewHeight*2/3, viewWidth, 44);
}

@end
