//
//  MenuView.h
//  BreachApp
//
//  Created by ah on 16/5/5.
//  Copyright © 2016年 ah. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^menuViewBlock)(NSInteger index,NSString *title);

@interface MenuView : UIView

@property (nonatomic,strong)NSArray *titleArr;

@property (nonatomic,strong)NSArray *leftTabArr;

@property (nonatomic,strong)NSArray *rightTabArr;

- (void)fire;

@property (nonatomic,copy)menuViewBlock leftHandle;
@property (nonatomic,copy)menuViewBlock rightHandle;

@end
