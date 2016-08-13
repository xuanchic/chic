//
//  InfoModel.m
//  Recount
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "InfoModel.h"

@implementation InfoModel

+ (instancetype)initWithDict:(NSDictionary *)dict
{
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    InfoModel *user = [self new];
    
    user.strContent = dict[@"content"];
    user.strCreatedAt = dict[@"createdAt"];
    user.strObjectId = dict[@"objectId"];
    user.strPic_h = dict[@"pic_h"];
    user.strPic_w = dict[@"pic_w"];
    user.strUser = dict[@"user"];
    user.strUsericon = dict[@"usericon"];
    user.strUsername = dict[@"username"];
    user.strIconPath = dict[@"iconPath"];
    
    return user;
}

@end
