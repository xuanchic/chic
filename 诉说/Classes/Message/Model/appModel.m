//
//  appModel.m
//  诉说
//
//  Created by qingyun on 16/8/5.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "appModel.h"

@implementation appModel

+ (instancetype)initWithDict:(NSDictionary *)dict
{
    if (dict == nil || [dict isKindOfClass:[NSNull class]]) return nil;
    appModel *appModel = [self new];
    
    appModel.strContent = dict[@"content"];
    appModel.strCreatedAt = dict[@"createdAt"];
    appModel.strObjectID = dict[@"objectId"];
    appModel.strPic_h = dict[@"pic_h"];
    appModel.strPic_w = dict[@"pic_w"];
    appModel.strUser = dict[@"user"];
    appModel.strUserIcon = dict[@"usericon"];
    appModel.strUserName = dict[@"username"];
    appModel.strIconPath = dict[@"iconPath"];
    return appModel;
}

//+ (appModel *)kvcParse:(NSDictionary *)dict
//{
//    appModel *appDatas = [[appModel alloc] init];
//    NSMutableArray *arrData = dict[@"data"];
//    for (NSUInteger index = 0; index < arrData.count; index++) {
//        NSDictionary *dic = arrData[index];
////        appModel *appData = [[appModel alloc] init];
////        appDatas = appData;
//        [appDatas setValuesForKeysWithDictionary:dic];
//        [arrData addObject:appDatas];
//    }
//    return appDatas;
//}

@end
