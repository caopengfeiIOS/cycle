//
//  AhRequest.h
//  cycleLife
//
//  Created by hbgl on 17/11/29.
//  Copyright © 2017年 cpf. All rights reserved.
//

#import "BaseObject.h"

@interface AhRequest : BaseObject

@end

@interface Bre001 : AhRequest

@property (nonatomic,copy) NSString * loginName;

@property (nonatomic,copy) NSString * password;



@end

@interface Bre002 : AhRequest

//**    **//
@property (strong, nonatomic) NSString * userId;

//**    **//
@property (strong, nonatomic) NSNumber * page;

//**    **//
@property (strong, nonatomic) NSNumber * pageSize;
//**    **//
@property (strong, nonatomic) NSNumber *isOfficial;

//**    **//
@property (strong, nonatomic) NSNumber *type;
//**    **//
@property (strong, nonatomic) NSNumber * dataType;
@end
