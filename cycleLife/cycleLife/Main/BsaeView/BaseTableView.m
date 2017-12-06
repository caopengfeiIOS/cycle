//
//  BaseTableView.m
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "BaseTableView.h"

@implementation BaseTableView
-(instancetype)initWithFrame:(CGRect)frame style:(UITableViewStyle)style
{
    if (self = [super initWithFrame:frame style:style]) {
        _header = [MJAmitionHeader headerWithRefreshingTarget:self refreshingAction:@selector(setHeaderRefresh)];
        _header.lastUpdatedTimeLabel.hidden = YES;
        _header.stateLabel.hidden = YES;
        self.mj_header = _header;
        [_header beginRefreshing];
        
        // Footer
        _footer = [MJAminationFooter footerWithRefreshingTarget:self refreshingAction:@selector(loadMoreData)];
        _footer.triggerAutomaticallyRefreshPercent = 0;
        _footer.refreshingTitleHidden = YES;
        _footer.stateLabel.hidden = YES;
        [_footer setTitle:@"没有更多数据了" forState:MJRefreshStateIdle];
        self.mj_footer = _footer;

    }
    return self;
}
#pragma mark === 下拉刷新
- (void)setHeaderRefresh
{
    if (self.completionHeader)
    {
        self.completionHeader(YES);
    }
}


#pragma mark === 下拉加载
- (void)loadMoreData
{
    _footer.stateLabel.hidden = NO;
    
    if (self.completionFooter)
    {
        self.completionFooter(NO);
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
