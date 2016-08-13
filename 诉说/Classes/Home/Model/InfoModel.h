//
//  InfoModel.h
//  Recount
//
//  Created by qingyun on 16/8/4.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface InfoModel : NSObject

@property (nonatomic, copy) NSString *strContent;
@property (nonatomic, copy) NSString *strCreatedAt;
@property (nonatomic, copy) NSString *strIconPath;
@property (nonatomic, copy) NSString *strObjectId;
@property (nonatomic, copy) NSString *strPic_h;
@property (nonatomic, copy) NSString *strPic_w;
@property (nonatomic, copy) NSString *strUser;
@property (nonatomic, copy) NSString *strUsericon;
@property (nonatomic, copy) NSString *strUsername;

+ (instancetype)initWithDict:(NSDictionary *)dict;

@end
