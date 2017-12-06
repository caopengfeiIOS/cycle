 //
//  AppDelegate.m
//  cycleLife
//
//  Created by hbgl on 17/11/28.
//  Copyright © 2017年 cpf. All rights reserved.
//
#define K_Version @"CFBundleShortVersionString"
#import "AppDelegate.h"
#import "MainTabBarViewController.h"
#import "NewFeatureViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    self.window = [[UIWindow alloc]initWithFrame:[UIScreen mainScreen].bounds];
   [self gotoNewFeture];
    [self.window makeKeyAndVisible];
    //开机视频
    UIImageView *gifImageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 0, __ScreenWidth, __ScreenHeight)];
    
    NSMutableArray *arrayTemp = [[NSMutableArray alloc] init];
    for (int i = 1; i < 51; i++)
    {
        NSString *imageName= [NSString stringWithFormat:@"%d.jpg", i];
       
        UIImage *image = [UIImage imageNamed:imageName];
        [arrayTemp addObject:image];
    }
    gifImageView.animationImages = arrayTemp; //动画图片数组
    gifImageView.animationDuration = 2; //执行一次完整动画所需的时长
    gifImageView.animationRepeatCount = 1;  //动画重复次数
    [gifImageView startAnimating];
    
    [self.window addSubview:gifImageView];
    [gifImageView performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:gifImageView.animationDuration];

    return YES;
}
-(void)gotoNewFeture  
{
    // 读取存储在沙盒中的版本号
    NSString *lastVersion = [[NSUserDefaults standardUserDefaults]stringForKey:K_Version];
    // 当前软件的版本号
    NSString *currentVersion =  [NSBundle mainBundle].infoDictionary[K_Version];
    //Bundle version
    if ([currentVersion isEqualToString:lastVersion]) {
        
        //  设置自动登录
        [BraschTool SetAutoLogin:K_IsLoginAuto window:self.window DoHandle:nil];
        
    }else{// 版本不一样 显示新特性
        self.window.rootViewController = [[NewFeatureViewController alloc]init];
        // 更新沙盒中版本号
        [[NSUserDefaults standardUserDefaults] setObject:currentVersion forKey:K_Version];
        // 同步
        [[NSUserDefaults standardUserDefaults]synchronize];
    }

}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and invalidate graphics rendering callbacks. Games should use this method to pause the game.
}


- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}


- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the active state; here you can undo many of the changes made on entering the background.
}


- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}


- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}


@end
