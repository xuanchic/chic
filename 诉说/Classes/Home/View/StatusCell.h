//
//  StatusCell.h
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>
@class InfoModel;
@interface StatusCell : UITableViewCell

@property (nonatomic, strong) InfoModel *status;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
