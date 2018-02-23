//
//  ViewController.m
//  UITabBarDemo
//
//  Created by 邓兴 on 2018/1/3.
//  Copyright © 2018年 邓兴. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    UIColor *randomColor = [UIColor colorWithRed:(arc4random()%255)*1.0f/255.0
                                           green:(arc4random()%255)*1.0f/255.0
                                            blue:(arc4random()%255)*1.0f/255.0 alpha:0.6];
    self.view.backgroundColor = randomColor;
    
    UIButton *sender = [UIButton buttonWithType:UIButtonTypeCustom];
    [sender setTitle:@"Push" forState:UIControlStateNormal];
    sender.frame = CGRectMake(0, 0, 80, 40);
    sender.center = self.view.center;
    [sender addTarget:self action:@selector(handleTouchHit:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:sender];
}


- (void)handleTouchHit:(UIButton *)sender {
    
    ViewController *vc = [ViewController new];
    [self.navigationController pushViewController:vc animated:YES];
}

@end
