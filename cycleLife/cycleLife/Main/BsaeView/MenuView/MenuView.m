//
//  MenuView.m
//  BreachApp
//
//  Created by ah on 16/5/5.
//  Copyright © 2016年 ah. All rights reserved.
//

#import "MenuView.h"
#import "MenuButton.h"
#import "UIView+Extension.h"

@interface MenuView ()<UITableViewDataSource,UITableViewDelegate>

@property (nonatomic,strong) MenuButton *leftBtn;

@property (nonatomic,strong) MenuButton *rightBtn;

@property (nonatomic,strong) UITableView *leftTableView;

@property (nonatomic,strong) UITableView *rightTableView;

@end

@implementation MenuView

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configData];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
         [self configData];
    }
    return self;
}

- (void)leAction{
    
    if (_leftHandle) {
        
        _leftHandle(0,@"全部");
    }
}

- (void)rightAction{
    
    if (_rightHandle) {
        _rightHandle(0,@"全部");
    }
    
}

- (void)fire{
    
    
    if (self.titleArr!=nil && self.titleArr.count>1) {
        
        [self.leftBtn setATitle:self.titleArr.firstObject];
        [self.rightBtn setATitle:self.titleArr.lastObject];
        
//        [self.leftBtn addTarget:self  action:@selector(leAction) forControlEvents:UIControlEventTouchUpInside];
//        [self.rightBtn addTarget:self action:@selector(rightAction) forControlEvents:UIControlEventTouchUpInside];
    }
    if (self.leftTabArr.count>0) {
        
        self.leftTableView = [[UITableView alloc]initWithFrame: CGRectMake(0, self.height, K_ScreenWidth, 0) style:UITableViewStylePlain];
        [self addSubview:self.leftTableView];
    }
    if (self.rightTabArr.count>0) {
        
         self.rightTableView = [[UITableView alloc]initWithFrame: CGRectMake(0, self.height, K_ScreenWidth, 0) style:UITableViewStylePlain];
        [self addSubview:self.rightTableView];
    }
    
    self.leftTableView.delegate = self;
    
    self.leftTableView.dataSource = self;
    self.rightTableView.delegate = self;
    self.rightTableView.dataSource = self;
    
    self.leftTableView.layer.cornerRadius = 3.0f;
    self.rightTableView.layer.cornerRadius = 3.0f;
    
    self.leftTableView.bounces = NO;
    self.rightTableView.bounces = NO;
    
//    self.leftTableView.separatorColor = [UIColor redColor];
    
    
    [self.leftTableView reloadData];
    [self.rightTableView reloadData];
    
    
}

- (void)configData{
    
    self.clipsToBounds = NO;
     MenuButton*leftBtn = [[MenuButton alloc]init];
    [leftBtn addTarget:self action:@selector(leftAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:leftBtn];
    self.leftBtn = leftBtn;
    
    MenuButton *rigthBtn = [[MenuButton alloc]init];
    [rigthBtn addTarget:self action:@selector(rightAction:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview: rigthBtn];
    self.rightBtn = rigthBtn;
    
//    self.leftBtn.backgroundColor = [UIColor blackColor];
//    self.rightBtn.backgroundColor = [UIColor blueColor];
}

- (void)layoutSubviews{
    
    self.leftBtn.frame = CGRectMake(0, 0, self.width*0.5, self.height);
    self.rightBtn.frame = CGRectMake(self.width*0.5, 0, self.width*0.5, self.height);
}

- (void)cancleAllBtnSlected{
    
    self.leftBtn.selected = NO;
    self.rightBtn.selected = NO;
}

- (void)leftAction:(MenuButton*)btn{
    
    self.rightBtn.selected = NO;
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        
        [self HiddenAlltab];
        [UIView animateWithDuration:0.3 animations:^{
            
            if (self.leftTabArr.count>0) {
                self.leftTableView.height = 44 * self.leftTabArr.count;
            }
        }];
    }else{
        [self HiddenAlltab];
    }
}



- (void)rightAction:(MenuButton*)btn{
    
    self.leftBtn.selected = NO;
    btn.selected = !btn.selected;
    
    if (btn.selected) {
        
        [self HiddenAlltab];
        [UIView animateWithDuration:0.3 animations:^{
            
            if (self.rightTabArr.count>0) {
                self.rightTableView.height = 44 * self.rightTabArr.count;
            }
        }];
    }else{
        [self HiddenAlltab];
    }
}

- (void)HiddenAlltab{
    
    [UIView animateWithDuration:0.3 animations:^{
        self.leftTableView.height=0;
        self.rightTableView.height=0;
    }];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    
    if (tableView==self.leftTableView) {
        
        return self.leftTabArr.count>0?self.leftTabArr.count:1;
    }else{
        return self.rightTabArr.count>0?self.rightTabArr.count:1;
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    static NSString *cellID = @"hh";
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellID];
    if (cell==nil) {
        
        cell = [[UITableViewCell alloc]initWithStyle:0 reuseIdentifier:cellID];
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    if (tableView==self.leftTableView) {
        
        cell.textLabel.text = self.leftTabArr[indexPath.row];
    }else{
        cell.textLabel.text = self.rightTabArr[indexPath.row];
    }
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    
    [self HiddenAlltab];
    if (tableView==self.leftTableView) {
        
        NSString *title = self.leftTabArr[indexPath.row];
        if (_leftHandle) {
            _leftHandle(indexPath.row,title);
        }
    }else{
        NSString *title = self.rightTabArr[indexPath.row];
        if (_rightHandle) {
            _rightHandle (indexPath.row,title);
        }
    }
}

- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event {
    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint tp = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, tp)) {
                view = subView;
            }
        }
    }
    
    return view;
}




@end
