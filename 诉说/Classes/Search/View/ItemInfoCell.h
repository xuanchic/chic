//
//  ItemInfoCell.h
//  诉说
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class ItemInfoModel;
@interface ItemInfoCell : UITableViewCell

@property (nonatomic, strong) ItemInfoModel *itemModels;

+ (instancetype)cellWithTablView:(UITableView *)tablView;

@end
