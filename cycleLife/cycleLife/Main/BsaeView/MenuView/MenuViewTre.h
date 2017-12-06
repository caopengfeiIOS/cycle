//
//  MenuViewTre.h
//  BreachApp
//
//  Created by ah on 16/6/29.
//  Copyright © 2016年 ah. All rights reserved.
//

#import <UIKit/UIKit.h>


typedef void(^MenuViewTreBlock)(NSInteger index,NSString *title);
@interface MenuViewTre : UIView

@property (nonatomic,strong)NSArray *titleArr;

@property (nonatomic,strong)NSArray *leftTabArr;

@property (copy,nonatomic) NSArray *midTabArr;

@property (nonatomic,strong)NSArray *rightTabArr;

- (void)fire;

@property (nonatomic,copy)MenuViewTreBlock leftHandle;
@property (nonatomic,copy)MenuViewTreBlock midHandle;
@property (nonatomic,copy)MenuViewTreBlock rightHandle;

@end
