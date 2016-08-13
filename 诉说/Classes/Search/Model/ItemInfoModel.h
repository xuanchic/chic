//
//  itemModel.h
//  诉说
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ItemInfoModel : NSObject

@property (nonatomic, copy) NSString *strLikeNum;

@property (nonatomic, copy) NSString *strId;

@property (nonatomic, copy) NSString *strNameHtml;

@property (nonatomic, copy) NSString *strTime;

@property (nonatomic, copy) NSString *strImageUrl;

@property (nonatomic, copy) NSString *strTitle;

@property (nonatomic, copy) NSString *strComment;

@property (nonatomic, copy) NSString *strTimeDes;

+ (instancetype)modelWithDictionary:(NSDictionary *)dictData;

@end
