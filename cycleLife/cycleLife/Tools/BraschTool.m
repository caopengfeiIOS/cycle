//
//  BraschTool.m
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "BraschTool.h"
#import "MainTabBarViewController.h"
#import "LoginViewController.h"
@implementation BraschTool
#pragma mark - UIImagePickerControllerDelegate

+ (instancetype)DefaultTool{
    
    static BraschTool *tool = nil;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        
        tool = [[BraschTool alloc]init];
    });
    return tool;
}

+ (void)SetAutoLogin:(BOOL)Auto window:(UIWindow *)window DoHandle:(void(^)())Dohandle{
        NSString *userphone = [MyTools ObjectForAKey:Breach_userphone];
        NSString *pwd = [MyTools ObjectForAKey:Breach_pwd];
    //
        if (Auto && [userphone isAvaliable]&&[pwd isAvaliable]&& [MyTools BoolForAKey:Breach_isreme]) {
    
            Bre001 * req = [[Bre001 alloc]init];
            req.password = pwd;
            req.loginName = userphone;
            [NetManager POST:C_SIGN_URL parameters:req progress:^(int64_t bytesRead, int64_t totalBytesRead) {
                
            } success:^(id responseObject) {
                
                
                Bre001Res * result = (Bre001Res*)responseObject;
                if ([result.result integerValue]==1) {
                    [UserInfo DefaultUser].usinfo = result;
                    [UserInfo DefaultUser].Login = YES;
                    [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarViewController alloc]init];
                }
                
                
            } failure:^(NSError *error) {
                
            }];
        }else{
           
            LoginViewController * login = [[LoginViewController alloc]init];
            MainNavController * nav = [[MainNavController alloc]initWithRootViewController:login];
            window.rootViewController = nav;
            
        }

}
@end
