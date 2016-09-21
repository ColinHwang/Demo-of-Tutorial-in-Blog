//
//  ViewController.m
//  iOS-ConvertDateToAstrologySign
//
//  Created by colin on 16/9/21.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "ViewController.h"
#import "NSDate+ConvertToAstrologySign.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    NSDate *date = [NSDate date];
    
    NSLog(@"\nAstrology Zodiac Sign:%ld\nChinese Zodiac Sign:%ld\n", (long)date.zodiacSign, (long)date.ChineseZodiacSign);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
