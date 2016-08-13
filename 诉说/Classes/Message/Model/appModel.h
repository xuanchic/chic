//
//  appModel.h
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface appModel : NSObject

@property (nonatomic, copy) NSString *strObjectID;
@property (nonatomic, copy) NSString *strContent;
@property (nonatomic, copy) NSString *strIconPath;
@property (nonatomic, copy) NSString *strUserName;
@property (nonatomic, copy) NSString *strUserIcon;
@property (nonatomic, copy) NSString *strPic_h;
@property (nonatomic, copy) NSString *strPic_w;
@property (nonatomic, copy) NSString *strCreatedAt;
@property (nonatomic, copy) NSString *strUser;

+ (instancetype)initWithDict:(NSDictionary *)dict;
//kvc方式解析json数据
//+(appModel *)kvcParse:(NSDictionary *)dict;
@end
