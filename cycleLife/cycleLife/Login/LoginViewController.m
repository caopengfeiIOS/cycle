//
//  LoginViewController.m
//  cycleLife
//
//  Created by hbgl on 17/11/30.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "LoginViewController.h"
#import "AhRequest.h"
#import "NetManager.h"
#import "AhResult.h"
@interface LoginViewController ()
@property (weak, nonatomic) IBOutlet UITextField *userName;
@property (weak, nonatomic) IBOutlet UITextField *passWord;
@property (weak, nonatomic) IBOutlet UIButton *loginBtn;

@end

@implementation LoginViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
- (IBAction)loginClick:(id)sender {
    Bre001 * req = [[Bre001 alloc]init];
    req.loginName = self.userName.text;
    req.password = self.passWord.text;
    [NetManager POST:C_SIGN_URL parameters:req progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
    } success:^(id responseObject) {
        
        
        Bre001Res * result = (Bre001Res*)responseObject;
        if ([result.result integerValue]==1) {
            [UserInfo DefaultUser].usinfo = result;
            [UserInfo DefaultUser].Login = YES;
            [UIApplication sharedApplication].keyWindow.rootViewController = [[MainTabBarViewController alloc]init];
        }else
        {
            [MBProgressHUD showTitleMessage:result.msg];
        }
        
        
    } failure:^(NSError *error) {
        
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
