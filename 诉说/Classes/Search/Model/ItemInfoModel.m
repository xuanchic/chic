//
//  itemModel.m
//  诉说
//
//  Created by qingyun on 16/8/6.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "ItemInfoModel.h"
#import "NSString+TimeString.h"

@implementation ItemInfoModel

+ (instancetype)modelWithDictionary:(NSDictionary *)dictData {
    if (dictData == nil || [dictData isKindOfClass:[NSNull class]]) {
        return nil;
    }
    ItemInfoModel *model = [[[self class] alloc] init];
    
    model.strId = dictData[@"item"][@"id"];
    model.strNameHtml = dictData[@"item"][@"name"];
    model.strTime = dictData[@"item"][@"creationTime"];
    model.strTitle = dictData[@"item"][@"metadata"];
    
    NSInteger count = [dictData[@"numUsersLikeIt"] integerValue] + [dictData[@"numUsersWithoutNameLikeIt"] integerValue];
    model.strLikeNum = [@(count) stringValue];
    model.strImageUrl = dictData[@"item"][@"thumbnailUrl"];
    NSInteger count1 = [dictData[@"numUsersCommentIt"] integerValue] +[dictData[@"numWeiboCommentIt"] integerValue];
    model.strComment = [@(count1) stringValue];
    
    return model;
}

- (void)setStrTime:(NSString *)strTime
{
    _strTime = [strTime copy];
    
  self.strTimeDes = [NSString descriptionWithString:_strTime];
}

@end
