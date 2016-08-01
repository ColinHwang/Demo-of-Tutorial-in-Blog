//
//  ViewController.m
//  iOS-CompressImage
//
//  Created by colin on 16/7/29.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "ViewController.h"
#import "UIImage+CompressImage.h"
#import <objc/runtime.h>

@interface ViewController ()

@property (nonatomic, weak) UIImageView *topImageView;
@property (nonatomic, weak) UIButton *button;
@property (nonatomic, weak) UIImageView *bottomImageView;

@end

@implementation ViewController

#pragma mark - Controls
- (UIImageView *)topImageView
{
    if (!_topImageView)
    {
        UIImageView *topImageView = [UIImageView new];
        
        topImageView.backgroundColor = [UIColor yellowColor];
        topImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.view addSubview:topImageView];
        self.topImageView = topImageView;
    }
    return _topImageView;
}

- (UIButton *)button
{
    if (!_button)
    {
        UIButton *button = [UIButton new];
        
        [button setTitle:@"Convert Image" forState:UIControlStateNormal];
        [button setBackgroundColor:[UIColor cyanColor]];
        [button addTarget:self action:@selector(convert) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        self.button = button;
    }
    return _button;
}

- (UIImageView *)bottomImageView
{
    if (!_bottomImageView)
    {
        UIImageView *bottomImageView = [UIImageView new];
        
        bottomImageView.backgroundColor = [UIColor lightGrayColor];
        bottomImageView.contentMode = UIViewContentModeScaleAspectFit;
        
        [self.view addSubview:bottomImageView];
        self.bottomImageView = bottomImageView;
    }
    return _bottomImageView;
}

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.topImageView.image = [UIImage imageNamed:@"test_1.jpg"];
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    CGFloat screenHeight = [UIScreen mainScreen].bounds.size.height;
    CGFloat screenWidth = [UIScreen mainScreen].bounds.size.width;
    
    self.topImageView.frame = CGRectMake(10.f, 10.f, screenWidth-10*2, (screenHeight-44.f-10.f*4)/2);
    self.button.frame = CGRectMake(10.f, CGRectGetMaxY(self.topImageView.frame)+10, screenWidth-10*2, 44.f);
    self.bottomImageView.frame = CGRectMake(10.f, CGRectGetMaxY(self.button.frame)+10, screenWidth-10*2, (screenHeight-44.f-10.f*4)/2);
}


#pragma mark - Touch Event
- (void)convert
{
    UIImage *image = [UIImage imageNamed:@"test_1.jpg"];
    
    NSData *data = [image resetImageDataWithImageWidth:640 maxFileSize:100000];
    
    NSLog(@"%lu", (unsigned long)[data length]);
    
    self.bottomImageView.image = [UIImage imageWithData:data];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
