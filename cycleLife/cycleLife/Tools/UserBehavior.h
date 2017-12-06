//
//  UserBehavior.h
//  HBDSBank
//
//  Created by ah on 16/6/1.
//  Copyright © 2016年 Administrator.Fyxrhyry. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LocalAuthentication/LAContext.h"
#import <LocalAuthentication/LocalAuthentication.h>
#import <CoreLocation/CoreLocation.h>

@interface UserBehavior : NSObject

+ (instancetype)defaultUser;


/**运营商类别*/
@property (copy,nonatomic,readonly) NSString *OperatorName;
/**手机型号*/
@property (copy,nonatomic,readonly) NSString *PlatformName;
/**当前位置*/
@property (copy,nonatomic,readonly) NSString *City;
/**注册渠道*/
@property (nonatomic,copy,readonly)NSString *RegistrationChannel;


/**初始化定位*/
- (void)configLocation;
/**定位*/
- (void)StartLoca;


@end
