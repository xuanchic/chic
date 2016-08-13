//
//  AppCell.m
//  诉说
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "AppCell.h"
#import "Masonry.h"
#import "appModel.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"


@interface AppCell ()
/** 头像 */
@property (nonatomic, weak) UIButton *btnHeader;
/** 名字 */
@property (nonatomic, weak) UILabel *lblName;
/** 时间 */
@property (nonatomic, weak) UILabel *lblTime;
/** 来源 */
@property (nonatomic, weak) UILabel *lblSource;
/** 内容 */
@property (nonatomic, weak) UILabel *lblContent;
/** 图片 */
@property (nonatomic, weak) UIImageView *viewImage;
/** 图片的高 */
@property (weak, nonatomic) NSLayoutConstraint *lcImageHeight;


@end

@implementation AppCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *strID = @"AppCell";
    AppCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
//        cell = [[[NSBundle mainBundle] loadNibNamed:@"AppCell" owner:nil options:nil]firstObject];
        cell = [[AppCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    return cell;
}

- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier{
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self loadDefaultSetting];
    }
    return self;
}

/**加载默认设置和UI*/
- (void)loadDefaultSetting
{
    UIButton *btn = [[UIButton alloc] init];
    [self addSubview:btn];
    self.btnHeader = btn;
    btn.layer.cornerRadius = 25;
    btn.layer.masksToBounds = YES;
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(8);
        make.leading.mas_equalTo(self).offset(8);
        make.width.and.height.mas_equalTo(50);
    }];
    
    UILabel *lblName = [[UILabel alloc] init];
    [self addSubview:lblName];
    self.lblName = lblName;
    [lblName mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn);
        make.leading.mas_equalTo(btn.mas_trailing).offset(8);
    }];
    
    UILabel *lblTime = [[UILabel alloc] init];
    [self addSubview:lblTime];
    self.lblTime = lblTime;
    [lblTime mas_makeConstraints:^(MASConstraintMaker *make) {
        make.bottom.mas_equalTo(btn);
        make.leading.mas_equalTo(btn.mas_trailing).offset(8);
    }];
    
    UILabel *lblSource = [[UILabel alloc] init];
    [self addSubview:lblSource];
    self.lblSource = lblSource;
    [lblSource mas_makeConstraints:^(MASConstraintMaker *make) {
        make.centerY.mas_equalTo(lblTime);
        make.leading.mas_equalTo(lblTime.mas_trailing).offset(8);
    }];
    
    UILabel *lblContent = [[UILabel alloc] init];
    [self addSubview:lblContent];
    lblContent.numberOfLines = 0;
    self.lblContent = lblContent;
    [lblContent mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(btn.mas_bottom).offset(8);
        make.leading.mas_equalTo(btn);
        make.trailing.mas_equalTo(self.mas_trailing).offset(-8);
    }];
    
    UIImageView *viewImage = [[UIImageView alloc] init];
    [self addSubview:viewImage];
    self.viewImage = viewImage;
    [viewImage setContentMode:UIViewContentModeScaleToFill];
    [viewImage setClipsToBounds:YES];
    [viewImage mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lblContent.mas_bottom).offset(8);
        make.leading.and.trailing.mas_equalTo(self).offset(1);
        make.bottom.mas_equalTo(self.mas_bottom).offset(-8);
    }];
}

- (void)setStatus:(appModel *)status
{
    _status = status;
    //设置头像
    NSURL *url = [NSURL URLWithString:status.strUserIcon];
    [self.btnHeader sd_setImageWithURL:url forState:UIControlStateNormal];
    self.lblName.text = status.strUserName;
    self.lblTime.text = status.strCreatedAt;
    self.lblSource.text = status.strUser;
    self.lblContent.text = status.strContent;
    NSURL *urlImage = [NSURL URLWithString:status.strIconPath];
    [_viewImage sd_setImageWithURL:urlImage];
}

@end
