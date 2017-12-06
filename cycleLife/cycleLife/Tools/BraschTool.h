//
//  BraschTool.h
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BraschTool : NSObject
+ (instancetype)DefaultTool;
/**
 *  自动登录功能
 *
 */
+ (void)SetAutoLogin:(BOOL)Auto window:(UIWindow *)window DoHandle:(void(^)())Dohandle;
@end
