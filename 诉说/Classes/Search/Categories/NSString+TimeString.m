//
//  NSString+TimeString.m
//  诉说
//
//  Created by qingyun on 16/8/7.
//  Copyright © 2016年 qingyun. All rights reserved.
//

#import "NSString+TimeString.h"

@implementation NSString (TimeString)

+ (NSString *)descriptionWithString:(NSString *)strTime
{
    NSString *strTimes = [strTime substringWithRange:NSMakeRange(0, 10)];
    NSDate *dateNow = [NSDate date];
    NSDateFormatter *formatter = [NSDateFormatter new];
    formatter.dateFormat = @"EEE MMM dd HH:mm:ss zzzz yyyy";
    
    NSTimeInterval time = [strTimes doubleValue];
    NSDate *dates = [NSDate dateWithTimeIntervalSince1970:time];
    
    

    NSTimeInterval interval = [dateNow timeIntervalSinceDate:dates];
    
    NSString *strDateDes = nil;
    if (interval <= 60) {
        strDateDes = @"刚刚";
    }else if(interval <= 60 * 60) {
        strDateDes = [NSString stringWithFormat:@"%ld分钟前",(NSInteger)interval / 60 + 1];
    }else if(interval <= 60 * 60 * 24) {
        strDateDes = [NSString stringWithFormat:@"%ld小时",(NSInteger)interval / (60 * 60) +1];
    } else { // 几天前
        strDateDes = [NSString stringWithFormat:@"%ld天前",(NSInteger)interval/(60 * 60 * 24)+1];
       
    }
    return strDateDes;
}

@end
