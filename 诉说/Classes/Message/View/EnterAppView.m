//
//  EnterAppView.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "EnterAppView.h"
#import "Appbutton.h"
#import "HeaderSeting.h"

//声明一个类扩展，定义一个数组来接收存放数据
@interface EnterAppView () <NSObject>

@property (nonatomic, strong) NSArray *arrDatas;

@end

@implementation EnterAppView
//懒加载数据
- (NSArray *)arrDatas
{
    if (!_arrDatas) {
        NSString *strPath = [[NSBundle mainBundle] pathForResource:@"ListData" ofType:@"plist"];
        _arrDatas = [NSArray arrayWithContentsOfFile:strPath];
    }
    return _arrDatas;
}
- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self loadDefaultSetting];
    }
    return self;
}
/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    CGFloat marginLeft = 30;
    CGFloat marginTop = 13;
    CGFloat width = 60;
    CGFloat height = 80;
    CGFloat spacing = (QLScreenWidth- marginLeft * 2 - 4 * width) / 3;
    NSUInteger count = 8;
    for (NSUInteger index = 0; index < count; index ++) {
        Appbutton *btnApp = [Appbutton new];
        CGFloat X = marginLeft + (index % 4) * (width + spacing);
        CGFloat Y = marginTop + (index / 4) * (height + marginTop);
        CGRect rectBtnApp = CGRectMake(X, Y, width, height);
        btnApp.frame = rectBtnApp;
        btnApp.dict = self.arrDatas[index];
        [btnApp addTarget:self action:@selector(tapAction:) forControlEvents:UIControlEventTouchUpInside];
        [self addSubview:btnApp];
    }
}

- (void)tapAction:(Appbutton *)button
{
    if (self.blkDidModel) {
        self.blkDidModel(button.dict);
    }
}
@end
