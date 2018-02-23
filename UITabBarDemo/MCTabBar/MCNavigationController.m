//
//  MCNavigationController.m
//  UITabBarDemo
//
//  Created by 邓兴 on 2018/1/3.
//  Copyright © 2018年 邓兴. All rights reserved.
//

#import "MCNavigationController.h"

@interface MCNavigationController ()

@end

@implementation MCNavigationController

- (void)pushViewController:(UIViewController *)viewController animated:(BOOL)animated {
    
    if ([self.viewControllers count] > 0) {
        viewController.hidesBottomBarWhenPushed = YES;
        
    }
    
    [super pushViewController:viewController animated:animated];
    
    CGRect rect = self.tabBarController.tabBar.frame;
    rect.origin.y = [UIScreen mainScreen].bounds.size.height - rect.size.height;
    self.tabBarController.tabBar.frame = rect;
}

@end
