//
//  ViewController.m
//  iOS-StoreStructuresInCollections
//
//  Created by colin on 16/8/25.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "ViewController.h"
#import "NSValue+Boxing.h"
#import "NSDictionary+Store.h"
#import "NSArray+Store.h"
#import "NSSet+Store.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];

    // Test Datas
    NSString *testStr = @"test";
    CGColorRef testRed = [UIColor redColor].CGColor;
    CGColorRef testWhite = [UIColor whiteColor].CGColor;

    // Dictionary
    NSMutableDictionary *testDictionary = [NSMutableDictionary dictionary];
    [testDictionary setObject:testStr forKey:@"textStr"];
    [testDictionary setCGColor:testRed forKey:@"textRed"];
    [testDictionary setCGColor:testWhite forKey:@"testWhite"];
    
    NSLog(@"testDictionary--%@", testDictionary);
    NSLog(@"testDictionary--testRed--%@", [testDictionary CGColorForKey:@"textRed"]);
    
    // Array
    NSMutableArray *testArray = [NSMutableArray array];
    [testArray addCGColor:testRed];
    [testArray addObject:testStr];
    [testArray replaceObjectAtIndex:1 withCGColor:testWhite];
    [testArray insertCGColor:testRed atIndex:1];
    [testArray addObject:testStr];
    
    NSLog(@"testArray--%@", testArray);
    NSLog(@"testArray--index--%@", [testArray CGColorAtIndex:0]);
    
    // Set
    NSMutableSet *testSet = [NSMutableSet set];
    [testSet addObject:testStr];
    [testSet addCGColor:testRed];
    [testSet addCGColor:testWhite];
    [testSet removeCGColor:testWhite];
    
    NSLog(@"testSet--%@", testSet);
    NSLog(@"testSet--CGColorMember--%@", [testSet CGColorMember:testRed]);
    NSLog(@"testSet--anyCGColor--%@", [testSet anyCGColor]);
    NSLog(@"testSet--containsCGColort--%d", [testSet containsCGColor:testRed]);
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
