//
//  MainTabBarViewController.m
//  cycleLife
//
//  Created by hbgl on 17/11/28.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "MainTabBarViewController.h"

@interface MainTabBarViewController ()
//**    **//
@property (strong, nonatomic) NSMutableArray * vcArray;

@end

@implementation MainTabBarViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self creatTabbar];
    [self setVC];
    [self createBarItems];
}
-(NSMutableArray*)vcArray
{
    if (_vcArray==nil) {
        _vcArray = [NSMutableArray array];
    }
    return _vcArray;
}
-(void)creatTabbar
{
    self.tabBar.barTintColor = [UIColor whiteColor];
}
-(void)setVC
{
    self.view.backgroundColor = [UIColor whiteColor];
    
    NSArray * controllers = @[@"HomeViewController",@"SearchViewController",@"PhotoViewController",@"MessageViewController",@"MineViewController"];
    for (int i=0; i<controllers.count; i++) {
        Class class = NSClassFromString(controllers[i]);
        UIViewController *vc = [[class alloc]init];
       
        
        MainNavController *navi = [[MainNavController alloc]initWithRootViewController:vc];
        [self.vcArray addObject:navi];
        
    }
    self.viewControllers = self.vcArray;
}
-(void)createBarItems
{
   
    NSArray * images = @[@"首页",@"搜索",@"拍照",@"消息中心",@"我的"];
    NSArray * selectedImages = @[@"首页_1",@"搜索_1",@"拍照_1",@"消息中心_1",@"我的_1"];
    
    for (int i=0;i<images.count ; i++) {
        UITabBarItem * item = [[UITabBarItem alloc] initWithTitle:nil    image:[[UIImage imageNamed:images[i]] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]  selectedImage:[[UIImage imageNamed:selectedImages[i] ] imageWithRenderingMode:UIImageRenderingModeAlwaysOriginal]];
        UIViewController * vc = self.viewControllers[i];
        //tabBarItem是属于TabBarController的子视图控制器的
        vc.tabBarItem = item;
        
    }
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
