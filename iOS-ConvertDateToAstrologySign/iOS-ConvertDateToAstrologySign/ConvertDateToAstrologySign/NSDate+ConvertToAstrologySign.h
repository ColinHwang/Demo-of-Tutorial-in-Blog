//
//  NSDate+ConvertToAstrologySign.h
//  iOS-ConvertDateToAstrologySign
//
//  Created by colin on 16/9/21.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSInteger, NSDateAstrologyChineseZodiacSign) {
    NSDateAstrologyChineseZodiacSignRat = 0,                   // 鼠(子)
    NSDateAstrologyChineseZodiacSignOx,                        // 牛(丑)
    NSDateAstrologyChineseZodiacSignTiger,                     // 虎(寅)
    NSDateAstrologyChineseZodiacSignRabbit,                    // 兔(卯)
    NSDateAstrologyChineseZodiacSignDragon,                    // 龙(辰)
    NSDateAstrologyChineseZodiacSignSnake,                     // 蛇(巳)
    NSDateAstrologyChineseZodiacSignHorse,                     // 马(午)
    NSDateAstrologyChineseZodiacSignGoat,                      // 羊(未)
    NSDateAstrologyChineseZodiacSignMonkey,                    // 猴(申)
    NSDateAstrologyChineseZodiacSignRooster,                   // 鸡(酉)
    NSDateAstrologyChineseZodiacSignDog,                       // 狗(戌)
    NSDateAstrologyChineseZodiacSignPig                        // 猪(亥)
};

typedef NS_ENUM(NSInteger, NSDateAstrologyZodiacSign) {
    NSDateAstrologyZodiacSignAquarius = 0,              // [1-20, 2-18] 水瓶座
    NSDateAstrologyZodiacSignPisces,                    // [2-19, 3-20] 双鱼座
    NSDateAstrologyZodiacSignAries,                     // [3-21, 4-19] 白羊座
    NSDateAstrologyZodiacSignTaurus,                    // [4-20, 5-20] 金牛座
    NSDateAstrologyZodiacSignGemini,                    // [5-21, 6-20] 双子座
    NSDateAstrologyZodiacSignCancer,                    // [6-21, 7-22] 巨蟹座
    NSDateAstrologyZodiacSignLeo,                       // [7-23, 8-22] 狮子座
    NSDateAstrologyZodiacSignVirgo,                     // [8-23, 9-22] 处女座
    NSDateAstrologyZodiacSignLibra,                     // [9-23, 10-22] 天秤座
    NSDateAstrologyZodiacSignScorpio,                   // [10-22, 11-21] 天蝎座
    NSDateAstrologyZodiacSignSagittarius,               // [11-22, 12-21] 射手座
    NSDateAstrologyZodiacSignCapricorn                  // [12-22, 1-19] 摩羯座
};



@interface NSDate (ConvertToAstrologySign)

@property (nonatomic, readonly) NSDateAstrologyZodiacSign zodiacSign;

@property (nonatomic, readonly) NSDateAstrologyChineseZodiacSign ChineseZodiacSign;

@end
