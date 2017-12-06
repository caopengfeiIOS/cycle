//
//  BaseObject.h
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface BaseObject : NSObject
- (instancetype)initWithDic:(NSDictionary *)dic;

+ (instancetype)modelWithDic:(NSDictionary *)dic;

@property (nonatomic,copy)NSString *name;

@property (nonatomic,copy)NSString *price;

@end
