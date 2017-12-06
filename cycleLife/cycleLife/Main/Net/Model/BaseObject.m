//
//  BaseObject.m
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "BaseObject.h"

@implementation BaseObject
- (void)setValue:(id)value forUndefinedKey:(NSString *)key{
    
    
}

- (id)valueForUndefinedKey:(NSString *)key{
    
    MYLog(@"❌❌❌❌❌❌\n%@对应的键值伟找到\n",key);
    return nil;
}

- (void)setValue:(id)value forKey:(NSString *)key{
    
    [super setValue:value forKey:key];
}


- (instancetype)initWithDic:(NSDictionary *)dic{
    
    if (self= [super init]) {
        
        [self setValuesForKeysWithDictionary:dic];
    }
    return self;
}

+ (instancetype)modelWithDic:(NSDictionary *)dic{
    
    return [[self alloc]initWithDic:dic];
}

@end
