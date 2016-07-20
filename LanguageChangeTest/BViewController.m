//
//  BViewController.m
//  LanguageChangeTest
//
//  Created by flowdev on 16/7/20.
//  Copyright © 2016年 com.Flow. All rights reserved.
//

#import "AppDelegate.h"
#import "BViewController.h"
#import "RootTabbarController.h"

@interface BViewController ()

@property (nonatomic, strong) UIButton *button;

@end

@implementation BViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.button = [[UIButton alloc] init];
    [self.button setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.button setTitle:_(@"个人中心") forState:UIControlStateNormal];
    [self.button addTarget:self action:@selector(buttonAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:self.button];
}

- (void)viewWillLayoutSubviews {
    self.button.frame = CGRectMake(0, 0, 200, 50);
    self.button.center = self.view.center;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

- (void)buttonAction {
    [self showActionSheet];
}

- (void)showActionSheet {
    LanguageManager *languageManager = [LanguageManager sharedInstance];
    UIAlertController *alert = [UIAlertController alertControllerWithTitle:@"切换语言" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    UIAlertAction *enAction = [UIAlertAction actionWithTitle:_(@"英语")
                                                       style:UIAlertActionStyleDefault
                                                     handler:^(UIAlertAction * _Nonnull action) {
                                                         
                                                         [languageManager setNewLanguage:EN handler:^{
                                                             [self resetRootViewController];
                                                         }];
                                                     }];
    
    UIAlertAction *chsAction = [UIAlertAction actionWithTitle:_(@"中文简体")
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          [languageManager setNewLanguage:CNS handler:^{
                                                              [self resetRootViewController];
                                                          }];;
                                                      }];
    
    UIAlertAction *chtAction = [UIAlertAction actionWithTitle:_(@"中文繁体")
                                                        style:UIAlertActionStyleDefault
                                                      handler:^(UIAlertAction * _Nonnull action) {
                                                          
                                                          [languageManager setNewLanguage:CNT handler:^{
                                                              [self resetRootViewController];
                                                          }];
                                                      }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:_(@"取消")
                                                           style:UIAlertActionStyleCancel
                                                         handler:nil];
    
    [alert addAction:enAction];
    [alert addAction:chsAction];
    [alert addAction:chtAction];
    [alert addAction:cancelAction];
    
    [self presentViewController:alert animated:YES completion:nil];
}

-(void)resetRootViewController {
    AppDelegate *appDelegate = (AppDelegate *)[[UIApplication sharedApplication] delegate];
    RootTabbarController *tabbar = [[RootTabbarController alloc] init];
    [tabbar setSelectedIndex:[[NSUserDefaults standardUserDefaults] integerForKey:TabbarSelectedIndex]];
    appDelegate.window.rootViewController = tabbar;
    
}

@end
