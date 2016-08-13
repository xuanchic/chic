//
//  MessageViewController.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "MessageViewController.h"
#import "HeaderSeting.h"
#import "Masonry.h"
#import "EnterAppView.h"
#import "AppTableViewController.h"

@interface MessageViewController ()<UITableViewDelegate>

@end

@implementation MessageViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self loadDefaultSetting];
    [self.view setBackgroundColor:QLColorWithRGB(239, 239, 244)];
}
/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    EnterAppView *enterView = [EnterAppView new];
    [self.view addSubview:enterView];
    enterView.userInteractionEnabled = YES;
    __weak typeof(self) selfWeak = self;
    [enterView setBlkDidModel:^(NSDictionary *dicData) {
        AppTableViewController *tableVC = [AppTableViewController new];
        tableVC.title = dicData[@"title"];
        tableVC.index = [dicData[@"tag"] integerValue];
        [selfWeak.navigationController pushViewController:tableVC animated:YES];
    }];
    [enterView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.and.trailing.equalTo(self.view);
        make.top.equalTo(self.view).offset(80);
        make.bottom.equalTo(self.view).offset(-40);
    }];
    
}


@end
