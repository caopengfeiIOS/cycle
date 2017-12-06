//
//  UserBehavior.m
//  HBDSBank
//
//  Created by ah on 16/6/1.
//  Copyright © 2016年 Administrator.Fyxrhyry. All rights reserved.
//

#import "UserBehavior.h"
#import <CoreTelephony/CTCarrier.h>
#import <CoreTelephony/CTTelephonyNetworkInfo.h>
#import <Foundation/Foundation.h>
#import <sys/sysctl.h>
#import "sys/utsname.h"
#import <UIKit/UIKit.h>




@interface UserBehavior ()<CLLocationManagerDelegate>

@property (nonatomic,strong)  CTTelephonyNetworkInfo *userInfo;
/**当前位置*/
@property (copy,nonatomic) NSString *City;
/**定位管理器*/
@property (strong, nonatomic) CLLocationManager* locationManager;

@end

@implementation UserBehavior

+ (instancetype)defaultUser{
    
    static UserBehavior *user = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        user = [[UserBehavior alloc]init];
        user.userInfo =[[CTTelephonyNetworkInfo alloc] init];
       
    });
    
    return user;
}

- (void)StartLoca{
    
    [self.locationManager startUpdatingLocation];
}

/**运营商类别*/
- (NSString *)OperatorName{
    
    return [NSString stringWithFormat:@"%@",[self.userInfo.subscriberCellularProvider carrierName]];
}
/**手机型号*/
- (NSString *)PlatformName{
    
    return [self getPlatformString];
}
/**注册渠道*/
- (NSString *)RegistrationChannel{
    
    return @"iOS";
}

#pragma mark- 手机型号相关
- (NSString *)getPlatformString
{
    NSString *platform = [self getDeviceVersion];
    
    //iPhone
    if ([platform isEqualToString:@"iPhone1,1"]) return @"iPhone 1";
    
    if ([platform isEqualToString:@"iPhone1,2"]) return @"iPhone 3";
    
    if ([platform isEqualToString:@"iPhone2,1"]) return @"iPhone 3GS";
    
    if ([platform isEqualToString:@"iPhone3,1"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,2"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone3,3"]) return @"iPhone 4";
    
    if ([platform isEqualToString:@"iPhone4,1"]) return @"iPhone 4s";
    
    if ([platform isEqualToString:@"iPhone5,1"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,2"]) return @"iPhone 5";
    
    if ([platform isEqualToString:@"iPhone5,3"]) return @"iPhone 5C";
    
    if ([platform isEqualToString:@"iPhone5,4"]) return @"iPhone 5C";
    
    if ([platform isEqualToString:@"iPhone6,1"]) return @"iPhone 5S";
    
    if ([platform isEqualToString:@"iPhone6,2"]) return @"iPhone 5S";
    
    if ([platform isEqualToString:@"iPhone7,2"]) return @"iPhone 6";
    
    if ([platform isEqualToString:@"iPhone7,1"]) return @"iPhone 6 Plus";
    
    if ([platform isEqualToString:@"iPhone8,1"]) return @"iPhone 6s";
    
    if ([platform isEqualToString:@"iPhone8,2"]) return @"iPhone 6s Plus";
    
    //iPot Touch
    if ([platform isEqualToString:@"iPod1,1"]) return @"iPod Touch";
    
    if ([platform isEqualToString:@"iPod2,1"]) return @"iPod Touch 2";
    
    if ([platform isEqualToString:@"iPod3,1"]) return @"iPod Touch 3";
    
    if ([platform isEqualToString:@"iPod4,1"]) return @"iPod Touch 4";
    
    if ([platform isEqualToString:@"iPod5,1"]) return @"iPod Touch 5";
    
    //iPad
    if ([platform isEqualToString:@"iPad1,1"]) return @"iPad";
    
    if ([platform isEqualToString:@"iPad2,1"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,2"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,3"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,4"]) return @"iPad 2";
    
    if ([platform isEqualToString:@"iPad2,5"]) return @"iPad Mini 1";
    
    if ([platform isEqualToString:@"iPad2,6"]) return @"iPad Mini 1";
    
    if ([platform isEqualToString:@"iPad2,7"]) return @"iPad Mini 1";
    
    if ([platform isEqualToString:@"iPad3,1"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,2"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,3"]) return @"iPad 3";
    
    if ([platform isEqualToString:@"iPad3,4"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,5"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad3,6"]) return @"iPad 4";
    
    if ([platform isEqualToString:@"iPad4,1"]) return @"iPad air";
    
    if ([platform isEqualToString:@"iPad4,2"]) return @"iPad air";
    
    if ([platform isEqualToString:@"iPad4,3"]) return @"iPad air";
    
    if ([platform isEqualToString:@"iPad4,4"]) return @"iPad mini 2";
    
    if ([platform isEqualToString:@"iPad4,5"]) return @"iPad mini 2";
    
    if ([platform isEqualToString:@"iPad4,6"]) return @"iPad mini 2";
    
    if ([platform isEqualToString:@"iPad4,7"]) return @"iPad mini 3";
    
    if ([platform isEqualToString:@"iPad4,8"]) return @"iPad mini 3";
    
    if ([platform isEqualToString:@"iPad4,9"]) return @"iPad mini 3";
    
    if ([platform isEqualToString:@"iPad5,3"]) return @"iPad air 2";
    
    if ([platform isEqualToString:@"iPad5,4"]) return @"iPad air 2";
    
    if ([platform isEqualToString:@"iPhone Simulator"] || [platform isEqualToString:@"x86_64"]) return @"iPhone Simulator";
    
    return platform;
    
}

- (NSString*)getDeviceVersion
{
    size_t size;
    sysctlbyname("hw.machine",NULL, &size, NULL,0);
    char *machine = (char*)malloc(size);
    sysctlbyname("hw.machine", machine, &size,NULL, 0);
    NSString *platform = [NSString stringWithCString:machine encoding:NSUTF8StringEncoding];
    //NSString *platform = [NSStringstringWithUTF8String:machine];二者等效
    NSLog(@"platform===%@",platform);
    free(machine);
    return platform;
}

#pragma mark- 定位相关
- (void)configLocation{
    
    if (nil == self.locationManager)
        
        self.locationManager = [[CLLocationManager alloc] init];
   
    //设置定位的精度
    self.locationManager.desiredAccuracy = kCLLocationAccuracyNearestTenMeters;
//    //设置移动多少距离后,触发代理.
//    self.locationManager.distanceFilter = 100;
    if ([[[UIDevice currentDevice] systemVersion] doubleValue]>=8.0)
    {
        [_locationManager requestWhenInUseAuthorization];// 前台定位
        [_locationManager requestAlwaysAuthorization];// 前后台同时定位
    }
     self.locationManager.delegate = self;
    
}

// 错误信息
-(void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error {
    NSLog(@"error%@",error);
    
    if(error.code == kCLErrorLocationUnknown)
    {
        NSLog(@"Currently unable to retrieve location.");
    }
    else if(error.code == kCLErrorNetwork)
    {
        NSLog(@"Network used to retrieve location is unavailable.");
    }
    else if(error.code == kCLErrorDenied)
    {
        NSLog(@"Permission to retrieve location is denied.");
        [self.locationManager stopUpdatingLocation];
        
        
        [AhAlertView alertViewWithTitle:@"提示" message:@"\n你的定位服务暂未开启,是否前往设置\n" leftButtonTitle:@"再想想" leftButtonHandle:^{
            
        } rightButtonTitle:@"去设置"  rightButtonHandle:^{
            
           // @"prefs:root=LOCATION_SERVICES"  UIApplicationOpenSettingsURLString
            NSURL *SetUrl = [NSURL URLWithString:UIApplicationOpenSettingsURLString];
            
            if ([[UIApplication sharedApplication] canOpenURL:SetUrl]) {
                
                [[UIApplication sharedApplication]openURL:SetUrl];
            }

        }];
        }
}
// 6.0 以上调用这个函数
-(void)locationManager:(CLLocationManager *)manager didUpdateLocations:(NSArray *)locations {

    CLLocation *newLocation = locations[0];
    
    CLGeocoder *geocoder = [[CLGeocoder alloc] init];

    [geocoder reverseGeocodeLocation:newLocation
                   completionHandler:^(NSArray *placemarks, NSError *error){

                       NSLog(@"%@",error);

                       for (CLPlacemark *place in placemarks) {

                           
                           MYLog(@"name============%@",place.name);//位置名
                           MYLog(@"街道======%@",place.thoroughfare);// 街道
                           MYLog(@"子街道======%@",place.subThoroughfare);//子街道
                           MYLog(@"市======%@",place.locality);//市
                           MYLog(@"区======%@",place.subLocality);//区
                           MYLog(@"国家======%@",place.country);//国家
                           MYLog(@"省======%@",place.administrativeArea);//省份
                           
                           self.City = [NSString stringWithFormat:@"%@%@%@%@",place.country,place.administrativeArea,place.locality,place.subLocality];
                           

                       }
                   }];
    
    [self.locationManager stopUpdatingLocation];
}



@end
