//
//  BaseTableView.h
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface BaseTableView : UITableView
//**    **//
@property (strong, nonatomic) MJAmitionHeader *header;
//**    **//
@property (strong, nonatomic) MJAminationFooter * footer;
@property (nonatomic, copy) void (^completionHeader) (BOOL first);
@property (nonatomic, copy) void (^completionFooter) (BOOL first);
@end
