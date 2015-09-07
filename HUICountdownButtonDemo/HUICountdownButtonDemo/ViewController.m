//
//  ViewController.m
//  HUICountdownButtonDemo
//
//  Created by ZhangTinghui on 14-4-11.
//  Copyright (c) 2014年 www.morefun.mobi. All rights reserved.
//

#import "ViewController.h"
#import "HUICountdownButton.h"


@interface ViewController () <HUICountdownButtonDelegate>
@property (weak, nonatomic) IBOutlet HUICountdownButton *countdownButton;

@end

@implementation ViewController

- (void)dealloc {
    [self.countdownButton stopCountdown];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.countdownButton.layer setCornerRadius:4.0];
    [self.countdownButton.layer setBorderWidth:1.0];
    [self.countdownButton.layer setBorderColor:[[UIColor blueColor] CGColor]];
    
    [self.countdownButton setTotalCount:5];
    [self.countdownButton setInterval:1.0f];
    [self.countdownButton setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    [self.countdownButton setTitleColor:[UIColor grayColor] forState:UIControlStateDisabled];
    [self.countdownButton addTarget:self
                             action:@selector(_countdownButtonPressed:)
                   forControlEvents:UIControlEventTouchUpInside];
    
    
    [self.countdownButton setCountdownDidStarted:^(HUICountdownButton *button) {
        NSString *title = [NSString stringWithFormat:@"Refresh After(%ld)", (long)(button.totalCount - button.currentCount)];
        [button setTitle:title forState:UIControlStateDisabled];
        [button.layer setBorderColor:[[UIColor grayColor] CGColor]];
    }];
    
    [self.countdownButton setCountdownDidCounted:^(HUICountdownButton *button) {
        NSString *title = [NSString stringWithFormat:@"Refresh After(%ld)", (long)(button.totalCount - button.currentCount)];
        [button setTitle:title forState:UIControlStateDisabled];
    }];
    
    [self.countdownButton setCountdownDidCompleted:^(HUICountdownButton *button) {
        [button setTitle:@"Refresh" forState:UIControlStateNormal];
        [button.layer setBorderColor:[[UIColor blueColor] CGColor]];
    }];
    
//    [self.countdownButton setDelegate:self];
    
    
    [self.countdownButton startCountdown];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)_countdownButtonPressed:(HUICountdownButton *)button {
    [button startCountdown];
}

#pragma mark - HUICountdownButtonDelegate
- (void)countdownDidStarted:(HUICountdownButton *)button {
    NSString *title = [NSString stringWithFormat:@"Refresh After(%ld)", (long)(button.totalCount - button.currentCount)];
    [button setTitle:title forState:UIControlStateDisabled];
    [button.layer setBorderColor:[[UIColor grayColor] CGColor]];
}

- (void)countdownDidStepped:(HUICountdownButton *)button {
    NSString *title = [NSString stringWithFormat:@"Refresh After(%ld)", (long)(button.totalCount - button.currentCount)];
    [button setTitle:title forState:UIControlStateDisabled];
}

- (void)countdownDidCompleted:(HUICountdownButton *)button {
    [button setTitle:@"Refresh" forState:UIControlStateNormal];
    [button.layer setBorderColor:[[UIColor blueColor] CGColor]];
}

@end
