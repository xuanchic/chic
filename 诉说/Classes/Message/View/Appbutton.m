//
//  Appbutton.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "Appbutton.h"

@implementation Appbutton

- (instancetype)initWithCoder:(NSCoder *)aDecoder
{
    if (self = [super initWithCoder:aDecoder]) {
        [self loadDefaultSetting];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    if (self = [super initWithFrame:frame]) {
        [self loadDefaultSetting];
    }
    return self;
}
/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    self.titleLabel.textAlignment = NSTextAlignmentCenter;
    self.titleLabel.font = [UIFont systemFontOfSize:15];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
     self.imageView.contentMode = UIViewContentModeCenter;
}

- (void)setDict:(NSDictionary *)dict
{
    _dict = dict;
    [self setImage:[UIImage imageNamed:dict[@"iconStr"]] forState:UIControlStateNormal];
    [self setTitle:dict[@"title"] forState:UIControlStateNormal];
}
// 图片占据整个Button的70%
/** 设置图片的frame */
- (CGRect)imageRectForContentRect:(CGRect)contentRect
{
    CGRect rectImageView = CGRectMake(0, 0, CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * 0.7);
    return rectImageView;
}
/** 设置Button标题的frame */
- (CGRect)titleRectForContentRect:(CGRect)contentRect
{
    CGRect rectTitle = CGRectMake(0, CGRectGetHeight(contentRect) * 0.7,  CGRectGetWidth(contentRect), CGRectGetHeight(contentRect) * 0.3);
    return rectTitle;
}



@end
