//
//  MCTabBarController.m
//  UITabBarDemo
//
//  Created by 邓兴 on 2018/1/3.
//  Copyright © 2018年 邓兴. All rights reserved.
//

#import "MCTabBarController.h"
#import "MCNavigationController.h"
#import "MCTabBar.h"
#import "ViewController.h"

@interface MCTabBarController ()<UITabBarControllerDelegate>

@property (nonatomic, strong) MCTabBar *mcTabber;

@end

@implementation MCTabBarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.mcTabber = [[MCTabBar alloc] init];
    [self.mcTabber.centerBtn addTarget:self action:@selector(buttonAction:) forControlEvents:UIControlEventTouchUpInside];
    self.mcTabber.tintColor = [UIColor colorWithRed:27.0/255.0 green:118.0/255.0 blue:208/255.0 alpha:1];
    //透明设置为NO，显示白色，view的高度到tabbar顶部截止，YES的话到底部
    self.mcTabber.translucent = NO;
    [self setValue:self.mcTabber forKey:@"tabBar"];
    
    self.delegate = self;
    
    [self addChildViewControllers];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

// -------------------------------------------------------------------------------
//  addChildViewControllers
//  添加子控制器 -------------------------------------------------------------------------------
- (void)addChildViewControllers {
    
    [self addChildViewController:[ViewController new] andTitle:@"首页" andImageName:@"tab1_n" andSelectImage:@"tab1_p"];
    [self addChildViewController:[ViewController new] andTitle:@"扩展" andImageName:@"tab2_n" andSelectImage:@"tab2_p"];
    [self addChildViewController:[ViewController new] andTitle:@"旋转" andImageName:@"" andSelectImage:@""];
    [self addChildViewController:[ViewController new] andTitle:@"发现" andImageName:@"tab3_n" andSelectImage:@"tab3_p"];
    [self addChildViewController:[ViewController new] andTitle:@"我" andImageName:@"tab4_n" andSelectImage:@"tab4_p"];
}

// -------------------------------------------------------------------------------
//  addChildViewController:andTitle:andImageName:andSelectImage:
//  添加子控制器的方法 -------------------------------------------------------------------------------
- (void)addChildViewController:(UIViewController *)childController andTitle:(NSString *_Nullable) title andImageName:(NSString *_Nullable)imageName andSelectImage:(NSString *)selectImage {
    
    childController.tabBarItem.image = [UIImage imageNamed:imageName];
    childController.tabBarItem.selectedImage = [UIImage imageNamed:selectImage];
    childController.title = title;
    
    MCNavigationController *mcnav = [[MCNavigationController alloc] initWithRootViewController:childController];
    [self addChildViewController:mcnav];
}

// -------------------------------------------------------------------------------
//  buttonAction:
// -------------------------------------------------------------------------------
- (void)buttonAction:(UIButton *)sender {
    
    self.selectedIndex = 2;
    [self rotationAnimation];
}

// -------------------------------------------------------------------------------
//  rotationAnimation
// -------------------------------------------------------------------------------
- (void)rotationAnimation{
    CABasicAnimation *rotationAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    rotationAnimation.toValue = [NSNumber numberWithFloat:M_PI*2.0];
    rotationAnimation.duration = 3.0;
    rotationAnimation.repeatCount = HUGE;
    [self.mcTabber.centerBtn.layer addAnimation:rotationAnimation forKey:@"key"];
}

#pragma mark UITabBarControllerDelegate
// -------------------------------------------------------------------------------
//  tabBarController:didSelectViewController:
// -------------------------------------------------------------------------------
- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    
    if (tabBarController.selectedIndex == 2) {
        
        [self rotationAnimation];
    } else {
        
        [self.mcTabber.centerBtn.layer removeAllAnimations];
    }
}

@end
