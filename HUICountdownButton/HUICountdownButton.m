//
//  HUICountdownButton.m
//  HUICountdownButtonDemo
//
//  Created by ZhangTinghui on 14-4-11.
//  Copyright (c) 2014年 www.morefun.mobi. All rights reserved.
//

#import "HUICountdownButton.h"

@interface HUICountdownButton ()
@property (nonatomic, weak)     NSTimer     *timer;
@property (nonatomic, assign)   NSUInteger  countdownCurrentCount;
@end


@implementation HUICountdownButton
+ (id)buttonWithType:(UIButtonType)buttonType
{
    id btn = [super buttonWithType:buttonType];
    [btn _loadDefaultConfiguration];
    return btn;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self _loadDefaultConfiguration];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    self = [super initWithCoder:aDecoder];
    if (self) {
        [self _loadDefaultConfiguration];
    }
    return self;
}

- (void)_loadDefaultConfiguration
{
    self.disableWhenCounting = YES;
}

- (void)startCountdown
{
    if (self.countdownTotalCount <= 0) {
        return;
    }
    
    if (self.disableWhenCounting) {
        [self setEnabled:NO];
    }
    
    self.countdownCurrentCount = 0;
    self.timer = [NSTimer scheduledTimerWithTimeInterval:self.countdownInterval
                                                  target:self
                                                selector:@selector(_timerFired:)
                                                userInfo:nil
                                                 repeats:YES];
    
    
    if (self.countdownDidStarted != nil) {
        self.countdownDidStarted(self);
    }
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(countdownDidStarted:)]) {
        [self.delegate countdownDidStarted:self];
    }
}

- (void)_timerFired:(NSTimer *)timer
{
    self.countdownCurrentCount += 1;
    
    if (self.countdownDidStepped) {
        self.countdownDidStepped(self);
    }
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(countdownDidStepped:)]) {
        [self.delegate countdownDidStepped:self];
    }
    
    if (self.countdownCurrentCount >= self.countdownTotalCount) {
        [self stopCountdown];
    }
}

- (void)stopCountdown
{
    if ([self.timer isValid]) {
        [self.timer invalidate];
    }
    
    if (self.disableWhenCounting) {
        [self setEnabled:YES];
    }
    
    if (self.countdownDidCompleted) {
        self.countdownDidCompleted(self);
    }
    
    if (self.delegate != nil && [self.delegate respondsToSelector:@selector(countdownDidCompleted:)]) {
        [self.delegate countdownDidCompleted:self];
    }
}

@end
