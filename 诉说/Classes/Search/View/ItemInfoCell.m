//
//  ItemInfoCell.m
//  诉说
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ItemInfoCell.h"
#import "Masonry.h"
#import "ItemInfoModel.h"
#import "UIImageView+WebCache.h"
#import "HeaderSeting.h"

@interface ItemInfoCell ()
/** 容器 */
@property (nonatomic, weak) UIView *viewBj;
/** 图片 */
@property (nonatomic, weak) UIImageView *imagesView;
/** biaot */
@property (nonatomic, weak) UILabel *lblTitle;
/** 时间 */
@property (nonatomic, weak) UILabel *lblTime;
/** 赞 */
@property (nonatomic, weak) UIButton *btnPrise;
/** 评论 */
@property (nonatomic, weak) UIButton *btnComment;

@end

@implementation ItemInfoCell

+ (instancetype)cellWithTablView:(UITableView *)tablView
{
    static NSString *strID = @"ItemInfoCell";
    ItemInfoCell *cell = [tablView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
        cell = [[ItemInfoCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:strID];
    }
    //[cell loadDefaultSetting];
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
//    UIView *view = [UIView new];
//    [self addSubview:view];
//    [view mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(self).offset(8);
//        make.leading.mas_equalTo(self).offset(8);
//        make.trailing.mas_equalTo(self).offset(8);
//        make.bottom.mas_equalTo(self);
//    }];
    
    UILabel *lbltitle = [UILabel new];
    [self addSubview:lbltitle];
    lbltitle.textColor = [UIColor blackColor];
    lbltitle.numberOfLines = 0;
    self.lblTitle = lbltitle;
    [lbltitle mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(self).offset(8);
        make.leading.mas_equalTo(self).offset(8);
        make.trailing.mas_equalTo(self).offset(-8);
    }];
    
    UIImageView *imagesView = [UIImageView new];
    [self addSubview:imagesView];
    CGRect frame = imagesView.frame;
    frame.size.height = 200;
    imagesView.frame = frame;
//    imagesView.userInteractionEnabled = YES;
//    [imagesView setContentMode:UIViewContentModeTop];
//    [imagesView setClipsToBounds:YES];
    self.imagesView = imagesView;
    [imagesView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(lbltitle.mas_bottom).offset(8);
        make.leading.mas_equalTo(self).offset(50);
        make.trailing.mas_equalTo(self).offset(-50);
    }];
    
    UILabel *time = [UILabel new];
    [self addSubview:time];
    time.font = [UIFont systemFontOfSize:12];
    time.textColor = [UIColor blackColor];
    self.lblTime = time;
    [time mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.mas_equalTo(lbltitle);
        make.top.mas_equalTo(imagesView.mas_bottom).offset(8);
        make.bottom.mas_equalTo(self).offset(-8);
    }];
    
//    UIButton *btnPrise = [UIButton new];
//    [self addSubview:btnPrise];
//    [btnPrise setImage:[UIImage imageNamed:@"statusdetail_icon_like"] forState:UIControlStateNormal];
//    btnPrise.titleLabel.font = [UIFont systemFontOfSize:12];
//    self.btnPrise = btnPrise;
//    [btnPrise mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.top.mas_equalTo(time);
//        make.leading.mas_equalTo(time.mas_trailing).offset(8);
//        make.centerY.mas_equalTo(time);
//    }];
    
//    UIButton *btnComment = [UIButton new];
//    [self addSubview:btnComment];
//    [btnComment setImage:[UIImage imageNamed:@"statusdetail_icon_comment"] forState:UIControlStateNormal];
//    btnComment.titleLabel.font = [UIFont systemFontOfSize:12];
//    self.btnComment = btnComment;
//    [btnComment mas_makeConstraints:^(MASConstraintMaker *make) {
//        make.leading.mas_equalTo(btnPrise.mas_trailing).offset(8);
//        make.centerY.mas_equalTo(btnPrise);
//    }];
}


- (void)setItemModels:(ItemInfoModel *)itemModels
{
    _itemModels = itemModels;
    self.lblTitle.text = itemModels.strTitle;
    NSURL *urlImage = [NSURL URLWithString:itemModels.strImageUrl];
    [_imagesView sd_setImageWithURL:urlImage];

    self.lblTime.text = itemModels.strTimeDes;
    [self.btnPrise setTitle:itemModels.strLikeNum forState:UIControlStateNormal];
    [self.btnPrise setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self.btnComment setTitle:itemModels.strComment forState:UIControlStateNormal];
    [self.btnComment setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
}

@end
