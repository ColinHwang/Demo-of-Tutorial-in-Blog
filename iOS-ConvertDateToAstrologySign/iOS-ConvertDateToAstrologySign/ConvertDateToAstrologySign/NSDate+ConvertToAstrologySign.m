//
//  NSDate+ConvertToAstrologySign.m
//  iOS-ConvertDateToAstrologySign
//
//  Created by colin on 16/9/21.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import "NSDate+ConvertToAstrologySign.h"
#import "NSObject+AssociateValue.h"

static const int NS_DATE_ASTROLOGY_ZODIAC_SIGNS;

@implementation NSDate (ConvertToAstrologySign)

- (NSArray *)astrologyZodiacSigns
{
    NSArray *astrologyZodiacSigns = [self getAssociatedValueForKey:&NS_DATE_ASTROLOGY_ZODIAC_SIGNS];
    if (!astrologyZodiacSigns)
    {
        astrologyZodiacSigns = @[@120, @219, @321, @420, @521, @621, @723, @823, @923, @1023, @1122, @1222];
        [self setAssociateValue:astrologyZodiacSigns withKey:&NS_DATE_ASTROLOGY_ZODIAC_SIGNS];
    }
    return astrologyZodiacSigns;
}

- (NSDateAstrologyZodiacSign)zodiacSign
{
    NSCalendar *gregorianCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierGregorian];
    NSDateComponents *components = [gregorianCalendar components:NSCalendarUnitMonth|NSCalendarUnitDay fromDate:self];
    
    NSInteger temp = components.month * 100 + components.day;
    
    NSArray *signs = [self astrologyZodiacSigns];
    
    __block NSDateAstrologyZodiacSign sign = NSDateAstrologyZodiacSignCapricorn;
    
    [signs enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        if (temp < [obj integerValue])
        {
            if (idx != 0) sign = idx-1;
            *stop = YES;
        }
    }];
    
    return sign;
}

- (NSDateAstrologyChineseZodiacSign)ChineseZodiacSign
{
    NSCalendar *chineseCalendar = [[NSCalendar alloc] initWithCalendarIdentifier:NSCalendarIdentifierChinese];
    NSDateComponents *components = [chineseCalendar components:NSCalendarUnitYear fromDate:self];
    
    NSInteger year = components.year;
    
    return (year-1)%12;
}

@end
