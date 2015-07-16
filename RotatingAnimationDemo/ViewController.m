//
//  ViewController.m
//  RotatingAnimationDemo
//
//  Created by Steven on 15/7/16.
//  Copyright (c) 2015年 Neva. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@property (nonatomic, assign) BOOL isChanged; // 标记是否已经翻转

@property (weak, nonatomic) IBOutlet UIImageView *imageView;

- (IBAction)onButtonTouch:(id)sender;

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
}

- (IBAction)onButtonTouch:(id)sender
{
    // 标记翻转状态
    self.isChanged = !self.isChanged;
    
    // 动画配置
    NSTimeInterval duration = 0.5;
    UIViewAnimationTransition transition = self.isChanged ? UIViewAnimationTransitionFlipFromRight : UIViewAnimationTransitionFlipFromLeft;
    
    // 提交动画
    [UIView beginAnimations:nil context:nil];
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];
    [UIView setAnimationDuration:duration];
    [UIView setAnimationTransition:transition forView:self.imageView cache:NO];
    [UIView commitAnimations];
    
    // 动画进行到一半，设置图片
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(duration/2.0 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^
    {
        self.imageView.image = [UIImage imageNamed: self.isChanged ? @"1" : @"2" ];
    });
}

@end
