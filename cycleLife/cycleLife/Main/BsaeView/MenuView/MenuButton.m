//
//  MenuButton.m
//  BreachApp
//
//  Created by ah on 16/5/5.
//  Copyright © 2016年 ah. All rights reserved.
//


// 图片占button得高度比例
#define AhTabBarButtonTitleRatio 0.65

#import "MenuButton.h"

@implementation MenuButton


- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self configData];
    }
    return self;
}

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self configData];
    }
    return self;
}


- (void)configData{
    
    self.imageView.contentMode = UIViewContentModeCenter;
    self.titleLabel.textAlignment = NSTextAlignmentRight;
    self.titleLabel.font = [UIFont systemFontOfSize:16];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
    [self setTitleColor:[UIColor blackColor] forState:UIControlStateHighlighted];
    [self setImage:[UIImage imageNamed:@"hb_common_arrowdown"] forState:UIControlStateNormal];
    [self setImage:[UIImage imageNamed:@"hb_common_arrowup"] forState:UIControlStateSelected];
    
}

- (CGRect)imageRectForContentRect:(CGRect)contentRect{
    
    CGFloat imageW = contentRect.size.width* (1-AhTabBarButtonTitleRatio);
    CGFloat imageH = contentRect.size.height;
    CGFloat imageX = contentRect.size.width*AhTabBarButtonTitleRatio;
    return CGRectMake(imageX, 0, imageW, imageH);
}
//
//- (CGRect)titleRectForContentRect:(CGRect)contentRect{
//    
//
//    CGFloat titleH = contentRect.size.height;
//    CGFloat titleW = contentRect.size.width*AhTabBarButtonTitleRatio;
//    return CGRectMake(0, 0, titleW, titleH);
//}

- (void)setHighlighted:(BOOL)highlighted{
    
    
}


@end
