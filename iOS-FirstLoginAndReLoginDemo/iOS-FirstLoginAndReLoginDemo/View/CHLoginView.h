//
//  CHLoginView.h
//  iOS-FirstLoginAndReLoginDemo
//
//  Created by colin on 16/7/6.
//  Copyright © 2016年 CHwang. All rights reserved.
//

#import <UIKit/UIKit.h>

@class CHLoginView;

@protocol CHLoginViewDelegate <NSObject>

@optional

- (void)loginView:(CHLoginView *)loginView didClickLoginButton:(UIButton *)button;
- (void)loginView:(CHLoginView *)loginView didClickLookArroundButton:(UIButton *)button;

@end



@interface CHLoginView : UIView

@property (nonatomic, weak) id<CHLoginViewDelegate> delegate;

@end
