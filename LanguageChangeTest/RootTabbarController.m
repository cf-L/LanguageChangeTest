//
//  RootTabbarController.m
//  LanguageChangeTest
//
//  Created by flowdev on 16/7/20.
//  Copyright © 2016年 com.Flow. All rights reserved.
//

#import "RootTabbarController.h"
#import "AViewController.h"
#import "BViewController.h"

@interface RootTabbarController ()<UITabBarControllerDelegate>

@end

@implementation RootTabbarController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.delegate = self;
    
    AViewController *aViewController = [[AViewController alloc] init];
    aViewController.title = _(@"首页");
    UINavigationController *aNaivigationController = [[UINavigationController alloc] initWithRootViewController:aViewController];
    
    BViewController *bViewController = [[BViewController alloc] init];
    bViewController.title = _(@"个人中心");
    UINavigationController *bNaivigationController = [[UINavigationController alloc] initWithRootViewController:bViewController];
    
    self.viewControllers = @[aNaivigationController, bNaivigationController];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}


- (void)tabBarController:(UITabBarController *)tabBarController didSelectViewController:(UIViewController *)viewController {
    [[NSUserDefaults standardUserDefaults] setInteger:self.selectedIndex forKey:TabbarSelectedIndex];
}

@end
