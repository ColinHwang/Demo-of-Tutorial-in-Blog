//
//  ViewController.m
//  iOS-EnumerateCollectionAndRemoveObjects
//
//  Created by colin on 16/7/27.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "ViewController.h"

#import "NSArray+FilteredArray.h"
#import "NSMutableArray+RemoveObjects.h"
#import "NSDictionary+FilteredDictionary.h"
#import "NSMutableDictionary+RemoveObjects.h"
#import "NSSet+FilteredSet.h"
#import "NSMutableSet+RemoveObjects.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    /* 双集合模式 **/
    /*
    // 遍历原元素数组，将移除元素加入移除元素数组，最后统一从原元素数组移除
    // 原元素集合
    NSMutableArray *array = @[@"1", @"11", @"111", [NSNull null], @"1111"].mutableCopy;
    // 移除元素集合
    NSMutableArray *removedArray = [NSMutableArray array];
    
    for (id element in removedArray)
    {
        if ([element isKindOfClass:[NSString class]])
        {
            [removedArray addObject:element];
        }
    }
    
    [array removeObjectsInArray:removedArray];
    
    NSLog(@"%@", array);
     */
    
    /*
    // 定义一个副本，遍历副本找到匹配的元素，从移除元素数组中移除对应的元素
    // 移除元素集合
    NSMutableArray *array = @[@"1", @"11", @"111", [NSNull null], @"1111"].mutableCopy;
    // 原元素集合(副本)
    NSMutableArray *copyArray = [NSMutableArray arrayWithArray:array];
    
    for (id element in copyArray)
    {
        if ([element isKindOfClass:[NSString class]])
        {
            [array removeObject:element];
        }  
    } 
    
    NSLog(@"%@", array);
     */
    
    
    /* 单集合模式 **/
    /*
    // For
    NSMutableArray *array = @[@"1", @"11", @"111", [NSNull null], @"1111"].mutableCopy;
    
    for (NSUInteger i = array.count; i > 0; i--)
    {
        id element = array[i-1];
        
        if ([element isKindOfClass:[NSString class]])
        {
            [array removeObject:element];
        }
    }
    
    NSLog(@"%@", array);
     */
    
    /*
    // For in
    NSMutableArray *array = @[@"1", @"11", @"111", [NSNull null], @"1111"].mutableCopy;
    
    NSEnumerator *enumerator = [array reverseObjectEnumerator];
    
    for (id element in enumerator)
    {
        if ([element isKindOfClass:[NSString class]])
        {
            [array removeObject:element];
        }   
    }
    
    NSLog(@"%@", array);
     */
    
    /*
    // enumerateObjectsWithOptions:usingBlock:
    NSMutableArray *array = @[@"1", @"11", @"111", [NSNull null], @"1111"].mutableCopy;
    
    __weak typeof(array) weakArray = array; // retain cycle
    
    [array enumerateObjectsWithOptions:NSEnumerationReverse usingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if ([obj isKindOfClass:[NSString class]])
        {
            [weakArray removeObject:obj];
        }
    }];
    
    NSLog(@"%@", array);
     */
    
    
    /* 移除集合内所有特定类别的元素 **/
    NSArray *array = @[@"11", [NSNull null], @"12"];
    NSDictionary *dict = @{@"A":@"21", @"B":@22, @"C":[NSNull null]};
    NSSet *set = [NSSet setWithObjects:[NSNull null], @"31", @"32", nil];
    
    /*
    NSArray *filteredArray = [array arrayByFilteringOutNullObjects];
    NSDictionary *filteredDict = [dict dictionaryByFilteringOutObjectsFromClass:[NSNumber class]];
    NSSet *filteredSet = [set setByFilteringOutObjectsFromClass:[NSString class]];
    NSLog(@"%@", filteredArray);
    NSLog(@"%@", filteredDict);
    NSLog(@"%@", filteredSet);
    */
    
    // Array
    NSMutableArray *arrayM = [NSMutableArray array];
    arrayM[0] = @"0";
    arrayM[1] = array;
    arrayM[2] = dict;
    arrayM[3] = set;
    arrayM[4] = [NSNull null];

    [arrayM removeObjectsFromClass:[NSString class]];
    
    NSLog(@"%@", arrayM);
    
    /*
    // Dictionary
    NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
    dictM[@"0"] = @"0";
    dictM[@"1"] = array;
    dictM[@"2"] = dict;
    dictM[@"3"] = set;
    dictM[@"4"] = [NSNull null];
    
    [dictM removeNullOrNilObjects];
    
    NSLog(@"%@", dictM);
     */
    
    /*
    // Set
    NSMutableSet *setM = [NSMutableSet set];
    [setM addObject:@"0"];
    [setM addObject:array];
    [setM addObject:dict];
    [setM addObject:set];
    [setM addObject:[NSNull null]];
    
    [setM removeObjectsFromClass:[NSString class]];
    
    NSLog(@"%@", setM);
     */
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
