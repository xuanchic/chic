//
//  EnterAppView.h
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EnterAppView : UIView

@property (nonatomic, copy) void(^blkDidModel)(NSDictionary *dictData);

@end
