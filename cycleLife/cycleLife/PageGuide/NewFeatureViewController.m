//
//  NewFeatureViewController.m
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "NewFeatureViewController.h"
#define K_ImageCount 3
@interface NewFeatureViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *pageScrollView;

@end

@implementation NewFeatureViewController{
     UIPageControl *_pageControl;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
     [self setupGuidePage];
   
}
#pragma mark === 引导页
- (void)setupGuidePage
{
    self.pageScrollView.contentSize = CGSizeMake(__ScreenWidth * 3, 0);
    [self.pageScrollView setContentOffset:CGPointMake(0, 0)];
    self.pageScrollView.delegate = self;
    
    NSString *imageName = [[NSString alloc] init];
    for (int i = 0; i < 3; i++)
    {
        imageName = [NSString stringWithFormat:@"引导页%d", i + 1];
        
        UIImageView *imageView = [[UIImageView alloc] initWithFrame:CGRectMake(__ScreenWidth * i, 0, __ScreenWidth, __ScreenHeight)];
        imageView.image = [UIImage imageNamed:imageName];
        
        [self.pageScrollView addSubview:imageView];
        // 如果是最后一个imageView 就添加一些按钮
        if (i==K_ImageCount-1) {
            [self setupLastImageView:imageView];
        }

    }
    //2.添加分页
    _pageControl = [[UIPageControl alloc]init];
    _pageControl.numberOfPages = K_ImageCount;
    _pageControl.frame = CGRectMake(10, __ScreenHeight-20, __ScreenWidth-20, 0);
    _pageControl.pageIndicatorTintColor = AHColor(189, 189, 189);
    _pageControl.currentPageIndicatorTintColor = K_AppColor;
    [self.view addSubview:_pageControl];
    
}
-(void)setupLastImageView:(UIImageView *)imageView
{
    imageView.userInteractionEnabled = YES;
    
    CGFloat btnX = 45;
    CGFloat btnW = __ScreenWidth - 2*btnX;
    CGFloat btnH = 30;
    
    CGFloat btnY = __ScreenHeight-49-btnH;
    if (Iphone4) {
        btnY+=10;
    }else if (Iphone5){
        
    }else if (Iphone6){
        
    }
    
    UIButton *startBtn = [[UIButton alloc]initWithFrame:CGRectMake(btnX, btnY, btnW, btnH)];
    startBtn.layer.cornerRadius = 5.0f;
    startBtn.layer.masksToBounds = YES;
    startBtn.layer.borderWidth = 1.5f;
    startBtn.layer.borderColor = [UIColor whiteColor].CGColor;
    [startBtn setATitle:@"马上体验"];
    [startBtn setATitleColor:[UIColor whiteColor]];
    startBtn.titleLabel.font = [UIFont boldSystemFontOfSize:17];
    [startBtn addTarget:self action:@selector(GoClick:) forControlEvents:UIControlEventTouchUpInside];
    [imageView addSubview:startBtn];

}
- (void)GoClick:(UIButton *)startBtn{
    
    [BraschTool SetAutoLogin:K_IsLoginAuto window:[UIApplication sharedApplication].keyWindow DoHandle:^{
        
    }];
    
}

// scroll代理
//监听滚动
- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    
    _pageControl.currentPage = scrollView.contentOffset.x / __ScreenWidth;
    
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
