//
//  LineGrayView.m
//  BreachApp
//
//  Created by ah on 16/4/23.
//  Copyright © 2016年 ah. All rights reserved.
//

#import "LineGrayView.h"

@implementation LineGrayView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self confingView];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self confingView];
    }
    return self;
}

- (void)confingView{
    
    self.width = 1.0f;
    self.backgroundColor = K_LineColor;
}

@end
