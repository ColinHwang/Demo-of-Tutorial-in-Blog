//
//  CHImageViewController.m
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "CHImageViewController.h"
#import "UIImage+ContentName.h"
@interface CHImageViewController ()

@property (nonatomic, weak) UIImageView *topImageView;
@property (nonatomic, weak) UIImageView *bottomImageView;
@property (nonatomic, weak) UIButton *button;

@end

@implementation CHImageViewController

#pragma mark - Controls
- (UIImageView *)topImageView
{
    if (!_topImageView)
    {
        UIImageView *topImageView = [UIImageView new];
        
        [topImageView setBackgroundColor:[UIColor lightGrayColor]];
        [topImageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self.view addSubview:topImageView];
        self.topImageView = topImageView;
    }
    return _topImageView;
}

- (UIImageView *)bottomImageView
{
    if (!_bottomImageView)
    {
        UIImageView *bottomImageView = [UIImageView new];
        
        [bottomImageView setBackgroundColor:[UIColor yellowColor]];
        [bottomImageView setContentMode:UIViewContentModeScaleAspectFit];
        
        [self.view addSubview:bottomImageView];
        self.bottomImageView = bottomImageView;
    }
    return _bottomImageView;
}

- (UIButton *)button
{
    if (!_button)
    {
        UIButton *button = [UIButton new];
        
        [button setBackgroundColor:[UIColor cyanColor]];
        [button setTitle:@"Dismiss" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(dismiss) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        self.button = button;
    }
    return _button;
}

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    [self setupImages];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    
    self.button.frame = CGRectMake(10.f, screenHeight-10-44, screenWidth-10*2, 44.f);
    self.topImageView.frame = CGRectMake(10.f, 10.f, screenWidth-10*2, (screenHeight-10*4-44)/2);
    self.bottomImageView.frame = CGRectMake(10.f, CGRectGetMaxY(self.topImageView.frame)+10, screenWidth-10*2, (screenHeight-10*4-44)/2);
}

- (void)dealloc
{
    [_topImageView setImage:nil];
    [_bottomImageView setImage:nil];
    _topImageView = nil;
    _bottomImageView = nil;
    NSLog(@"Dealloc");
}

#pragma mark - Touch Event
- (void)dismiss
{
    [self dismissViewControllerAnimated:YES completion:nil];
}

#pragma mark - Private Method
- (void)setupImages
{
    [self.topImageView setImage:[UIImage imageNamed:@"test_1"]];
    [self.bottomImageView setImage:[UIImage imageNamed:@"test_2.jpg"]];
}

@end
