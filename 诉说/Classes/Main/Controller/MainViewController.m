//
//  MainViewController.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MainViewController.h"
#import "NavigationController.h"
#import "HomeViewController.h"
#import "MessageViewController.h"
#import "ProfileViewController.h"
#import "SearchViewController.h"

@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
}
/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    HomeViewController *vcHome = [[HomeViewController alloc] init];
    [self addViewController:vcHome imageName:@"tabbar_home" title:@"首页"];
    MessageViewController *vcMessage = [[MessageViewController alloc] init];
    [self addViewController:vcMessage imageName:@"tabbar_message_center" title:@"消息"];
    SearchViewController *vcDiscover = [SearchViewController new];
    [self addViewController:vcDiscover imageName:@"tabbar_discover" title:@"发现"];
//    ProfileViewController *vcProfile = [[ProfileViewController alloc] init];
//    [self addViewController:vcProfile imageName:@"tabbar_profile" title:@"我"];
    self.tabBar.tintColor = [UIColor orangeColor];
//    // 修改TabBar的背景色
//    self.tabBar.barTintColor = [UIColor purpleColor];
}

-(void)addViewController:(UIViewController *)Controller imageName:(NSString *)imageName title:(NSString *)title
{
    Controller.tabBarItem.image = [UIImage imageNamed:imageName];
    Controller.tabBarItem.selectedImage = [UIImage imageNamed:[NSString stringWithFormat:@"%@_selected",imageName]];
    Controller.title = title;
    Controller.tabBarItem.titlePositionAdjustment = UIOffsetMake(0, -3);

    //创建一个导航控制器
    NavigationController *vcNav = [[NavigationController alloc] initWithRootViewController:Controller];
    //设置透明度
    self.navigationController.navigationBar.translucent = YES;
    // 把导航控制器添加到TanBarController中
    [self addChildViewController:vcNav];
}

@end
