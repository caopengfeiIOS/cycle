//
//  TimeZhuanhuan.m
//  BreachApp
//
//  Created by 王向垒 on 16/6/10.
//  Copyright © 2016年 ah. All rights reserved.
//

#import "TimeZhuanhuan.h"

@implementation TimeZhuanhuan


+ (NSString *)timeInfoWithDateString:(NSString *)dateString {
    // 把日期字符串格式化为日期对象
    NSDateFormatter *formatter = [[NSDateFormatter alloc]init];
    [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
    NSDate *date = [formatter dateFromString:dateString];
    
    NSDate *curDate = [NSDate date];
    NSTimeInterval time = -[date timeIntervalSinceDate:curDate];
    
    NSTimeInterval retTime = 1.0;
    // 小于一小时
    if (time < 3600 && time >= 60) {
        retTime = time / 60;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f分钟前", retTime];
    }else if (time < 60){
        return @"刚刚";
    }
    // 小于一天，也就是今天
    else if (time < 3600 * 24 && time > 3600) {
        retTime = time / 3600;
        retTime = retTime <= 0.0 ? 1.0 : retTime;
        return [NSString stringWithFormat:@"%.0f小时前", retTime];
    }
    // 昨天
    else if (time < 3600 * 24 * 2 && time > 3600 * 24) {
        return @"昨天";
    }
    // 第一个条件是同年，且相隔时间在一个月内
    // 第二个条件是隔年，对于隔年，只能是去年12月与今年1月这种情况
    else{
        return dateString;
    }
}


@end
