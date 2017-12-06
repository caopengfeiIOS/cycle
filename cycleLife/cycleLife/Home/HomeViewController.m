//
//  HomeViewController.m
//  cycleLife
//
//  Created by hbgl on 17/12/4.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "HomeViewController.h"
#import "SelectedCell.h"
@interface HomeViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSInteger _pageNum;
}
//**    **//
@property (strong, nonatomic)  BaseTableView *tableView;
//@property (strong, nonatomic) BaseTableView * tableView;
@property (nonatomic, strong) NSMutableArray *statuses;
@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addUI];
}
-(void)addUI
{
    self.tableView = [[BaseTableView alloc]initWithFrame:CGRectMake(0, 0, __ScreenWidth, __ScreenHeight-64-44  ) style:UITableViewStylePlain];
//        self.tableView.tableFooterView = view;
    self.tableView.tableFooterView.hidden = NO;
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    //    self.tableView.estimatedRowHeight = 190.0;
    [self.tableView registerNib:[UINib nibWithNibName:@"SelectedCell" bundle:nil] forCellReuseIdentifier:@"Cell"];
        [self.view addSubview:self.tableView];
    __weak __typeof(self) weakSelf  = self;
    self.tableView.completionHeader = ^(BOOL first){
        
        // 下拉刷新的时候需设置_pageNum
        [weakSelf setHeaderRefresh];
    };
    self.tableView.completionFooter = ^(BOOL first){
        
        // 加载数据
        [weakSelf loadDataFirst:NO];
    };
    
    
}
-(void)setHeaderRefresh
{
    _pageNum = 1;
    [self loadDataFirst:YES];
}
#pragma mark === 加载数据
- (void)loadDataFirst:(BOOL)first
{
    Bre002 * req = [[Bre002 alloc]init];
    req.page =@(_pageNum);
    req.pageSize = @(10);
    req.isOfficial = @(0);
    req.type = @(4);
    req.dataType = (0);
    req.userId =  [UserInfo DefaultUser].usinfo.userId;
    [NetManager POST:C_SquareList parameters:req progress:^(int64_t bytesRead, int64_t totalBytesRead) {
        
    } success:^(id responseObject) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
        Bre002Res * result = (Bre002Res*)responseObject;
        if ([result.result intValue]==1) {
            if (first) {
                self.statuses = [NSMutableArray arrayWithArray:result.list];
            }else
            {
                [self.statuses addObjectsFromArray:result.list];
            }
            _pageNum++;
            [self.tableView reloadData];
            
        }
    } failure:^(NSError *error) {
        [self.tableView.mj_header endRefreshing];
        [self.tableView.mj_footer endRefreshing];
    }];
    
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.statuses.count>0?self.statuses.count:0;
}
-(UITableViewCell*)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    SelectedCell * cell = [tableView dequeueReusableCellWithIdentifier:@"Cell"];
    return cell;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 140.0;
}

@end
