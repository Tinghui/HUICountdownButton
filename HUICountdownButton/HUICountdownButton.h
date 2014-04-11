//
//  HUICountdownButton.h
//  HUICountdownButtonDemo
//
//  Created by ZhangTinghui on 14-4-11.
//  Copyright (c) 2014年 www.morefun.mobi. All rights reserved.
//

#import <UIKit/UIKit.h>


@class HUICountdownButton;
@protocol HUICountdownButtonDelegate <NSObject>

@optional
- (void)countdownDidStarted:(HUICountdownButton *)button;
- (void)countdownDidStepped:(HUICountdownButton *)button;
- (void)countdownDidCompleted:(HUICountdownButton *)button;

@end


@interface HUICountdownButton : UIButton

/**
 *  Indicate whether disable the button when it's counting down
 *  Default is YES
 */
@property (nonatomic, assign) BOOL disableWhenCounting;

@property (nonatomic, assign)           NSTimeInterval    countdownInterval;
@property (nonatomic, assign)           NSUInteger        countdownTotalCount;
@property (nonatomic, assign, readonly) NSUInteger        countdownCurrentCount;

@property (nonatomic, weak) id<HUICountdownButtonDelegate> delegate;
@property (nonatomic, copy) void (^countdownDidStarted)(HUICountdownButton *button);
@property (nonatomic, copy) void (^countdownDidStepped)(HUICountdownButton *button);
@property (nonatomic, copy) void (^countdownDidCompleted)(HUICountdownButton *button);


+ (id)buttonWithType:(UIButtonType)buttonType;

- (void)startCountdown;
- (void)stopCountdown;

@end

