//
//  AppCell.h
//  诉说
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@class appModel;
@interface AppCell : UITableViewCell

@property (nonatomic, strong) appModel *status;

+ (instancetype)cellWithTableView:(UITableView *)tableView;

@end
