//
//  ViewController.m
//  Runtime-SwizzleImageNameMethod
//
//  Created by colin on 16/7/15.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "ViewController.h"
#import "CHImageViewController.h"

@interface ViewController ()

@property (nonatomic, weak) UIButton *button;

@end

@implementation ViewController

#pragma mark - Controls
- (UIButton *)button
{
    if (!_button)
    {
        UIButton *button = [UIButton new];
        
        [button setBackgroundColor:[UIColor cyanColor]];
        [button setTitle:@"Show Image" forState:UIControlStateNormal];
        [button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        [button addTarget:self action:@selector(showImage) forControlEvents:UIControlEventTouchUpInside];
        
        [self.view addSubview:button];
        self.button = button;
    }
    return _button;
}

#pragma mark - Life Cycle
- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)viewWillLayoutSubviews
{
    [super viewWillLayoutSubviews];
    
    self.button.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - 200)/2, ([UIScreen mainScreen].bounds.size.height - 44)/2, 200.f, 44.f);
}

#pragma mark - Touch Event
- (void)showImage
{
    [self presentViewController:[CHImageViewController new] animated:YES completion:nil];
}

@end
