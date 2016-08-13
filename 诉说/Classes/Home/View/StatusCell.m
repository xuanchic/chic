//
//  StatusCell.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "StatusCell.h"
#import "InfoModel.h"
#import "UIButton+WebCache.h"
#import "UIImageView+WebCache.h"
#import "HeaderSeting.h"
#import "Masonry.h"

// cell中所有的判断必须全面, 否则信息会不对称
@interface StatusCell ()
/** 头像按钮 */
@property (weak, nonatomic) IBOutlet UIButton *btnHead;
/** 昵称 */
@property (weak, nonatomic) IBOutlet UILabel *lblName;
/** 创建时间 */
@property (weak, nonatomic) IBOutlet UILabel *lblTime;
/** 发布来源 */
@property (weak, nonatomic) IBOutlet UILabel *lblSource;
/** 主内容 */
@property (weak, nonatomic) IBOutlet UILabel *lblContent;
/** 内容的图片 */
@property (weak, nonatomic) IBOutlet UIView *viewImages;

@property (nonatomic, strong) NSMutableArray *arrMutImageUrls;

@end

@implementation StatusCell

+ (instancetype)cellWithTableView:(UITableView *)tableView
{
    static NSString *strID = @"StatusCell";
    StatusCell *cell = [tableView dequeueReusableCellWithIdentifier:strID];
    if (cell == nil) {
        cell = [[[NSBundle mainBundle] loadNibNamed:@"StatusCell" owner:nil options:nil]firstObject];
    }
    return cell;
}
/** nib加载完毕的时候调用(所有的outlet属性都已经赋值) */
- (void)awakeFromNib {
    [super awakeFromNib];
    /** 切圆图 */
    self.btnHead.layer.cornerRadius = 25;
    self.btnHead.layer.masksToBounds = YES;
}

- (void)setStatus:(InfoModel *)status
{
    _status = status;
    //设置头像
    NSURL *url = [NSURL URLWithString:status.strUsericon];
    [self.btnHead sd_setBackgroundImageWithURL:url forState:UIControlStateNormal];
    //设置昵称
    self.lblName.text = status.strUsername;
    //设置时间
    self.lblTime.text = status.strCreatedAt;
    // 设置来源
    self.lblSource.text = status.strUser;
    //设置内容
    self.lblContent.text = status.strContent;
    //设置图片
    NSURL *url2 = [NSURL URLWithString:status.strIconPath];
    UIImageView *imgView = [[UIImageView alloc] init];
    [imgView sd_setImageWithURL:url2];
    [self.viewImages addSubview:imgView];
    [imgView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.leading.top.mas_equalTo(1);
        make.trailing.bottom.mas_equalTo(-1);
    }];
}

@end
