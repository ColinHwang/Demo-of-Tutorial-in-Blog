//
//  NSObject+AssociateValue.h
//  iOS-ConvertDateToAstrologySign
//
//  Created by colin on 16/9/21.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSObject (AssociateValue)

- (void)setAssociateValue:(id)value withKey:(const void *)key;
- (id)getAssociatedValueForKey:(const void *)key;

@end
