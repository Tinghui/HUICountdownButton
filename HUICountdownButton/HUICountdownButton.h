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
/*! Notify countdown did started */
- (void)countdownDidStarted:(HUICountdownButton *)button;

/*! Notify countdown did counted */
- (void)countdownDidCounted:(HUICountdownButton *)button;

/*! Notify countdown did completed */
- (void)countdownDidCompleted:(HUICountdownButton *)button;

@end



@interface HUICountdownButton : UIButton

/*! 
 *  Indicate whether disable the button when it's counting down. 
 *
 *  Default is YES.
 */
@property (nonatomic, assign) BOOL disableWhenCounting;

/*! 
 *  Time interval between two counts.
 *
 *  Default is 1.0 seconds. Can't be less than or equal to 0.
 *
 *  Total countdown time = interval * totalCount. @see totalCount
 */
@property (nonatomic, assign) NSTimeInterval interval;

/*! 
 *  Total count. 
 *  
 *  Default is 60. Can't be less than or equal to 0.  
 */
@property (nonatomic, assign) NSInteger totalCount;

/*! 
 *  Current count 
 */
@property (nonatomic, assign, readonly) NSInteger currentCount;

@property (nonatomic, weak) id<HUICountdownButtonDelegate> delegate;

@property (nonatomic, copy) void (^countdownDidStarted)(HUICountdownButton *button);
@property (nonatomic, copy) void (^countdownDidCounted)(HUICountdownButton *button);
@property (nonatomic, copy) void (^countdownDidCompleted)(HUICountdownButton *button);


+ (id)buttonWithType:(UIButtonType)buttonType;

- (void)startCountdown;
- (void)stopCountdown;

@end



