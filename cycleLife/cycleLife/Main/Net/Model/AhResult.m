//
//  AhResult.m
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "AhResult.h"

@implementation AhResult

@end

#pragma mark- 用户信息
@implementation UserInfo

+ (instancetype)DefaultUser{
    
    static UserInfo *user = nil;
    static dispatch_once_t onceToken;
    
    dispatch_once(&onceToken, ^{
        
        user = [[UserInfo alloc]init];
        user.IsReme = [MyTools BoolForAKey:Breach_isreme];
        
        MYLog(@"%zd",user.IsReme);
    });
    return user;
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        _DownVideoDataArr = [[NSMutableArray alloc]init];
        _DownVideoArr = [[NSMutableArray alloc]init];
        _DownVideoFilePath = [NSTemporaryDirectory() stringByAppendingPathComponent:@"videoList.data"];
        _Brea_VideoUrl = [[NSMutableArray alloc]init];
        _Brea_PicUrl = [[NSMutableArray alloc]init];
        _Brea_TitleUrl = [[NSMutableArray alloc]init];
    }
    return self;
}

- (NSMutableArray *)Brea_VideoUrl{
    
    if (_Brea_VideoUrl==nil) {
        _Brea_VideoUrl = [[NSMutableArray alloc]init];
    }
    return _Brea_VideoUrl;
}
- (NSMutableArray *)Brea_PicUrl{
    
    if (_Brea_PicUrl==nil) {
        _Brea_PicUrl = [[NSMutableArray alloc]init];
    }
    return _Brea_PicUrl;
}
- (NSMutableArray *)Brea_TitleUrl{
    
    if (_Brea_TitleUrl==nil) {
        _Brea_TitleUrl = [[NSMutableArray alloc]init];
    }
    return _Brea_TitleUrl;
}
@end

@implementation Bre001Res
+ (NSDictionary *)mj_replacedKeyFromPropertyName
{
    return @{@"userMsg" : @"msg",
             
             };
}

@end
@implementation Bre002Res

+ (NSDictionary *)mj_objectClassInArray
{
    return @{
             @"list" : @"Bre002ResItem",
             };
}

@end


