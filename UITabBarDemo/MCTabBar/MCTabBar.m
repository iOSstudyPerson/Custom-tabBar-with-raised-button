//
//  MCTabBar.m
//  UITabBarDemo
//
//  Created by 邓兴 on 2018/1/3.
//  Copyright © 2018年 邓兴. All rights reserved.
//

#import "MCTabBar.h"

@implementation MCTabBar

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self initCenterView];
    }
    return self;
}

// -------------------------------------------------------------------------------
//  initCenterView
//  初始化中间按钮 -------------------------------------------------------------------------------
- (void)initCenterView {
    
    self.centerBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    UIImage *normalImage = [UIImage imageNamed:@"tabbar_add"];
    self.centerBtn.frame = CGRectMake(0, 0, normalImage.size.width, normalImage.size.height);
    [self.centerBtn setImage:normalImage forState:UIControlStateNormal];
    self.centerBtn.adjustsImageWhenHighlighted = NO;
    self.centerBtn.frame = CGRectMake(([UIScreen mainScreen].bounds.size.width - normalImage.size.width)/2.0, - normalImage.size.height/2.0, normalImage.size.width, normalImage.size.height);
    [self addSubview:self.centerBtn];
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    
    UIView *view = [super hitTest:point withEvent:event];
    
    if (view == nil) {
        
        CGPoint touchPt = [self.centerBtn convertPoint:point fromView:self];
        
        if (CGRectContainsPoint(self.centerBtn.bounds, touchPt)) {
            
            return self.centerBtn;
        }
    }
    
    return view;
}

@end
