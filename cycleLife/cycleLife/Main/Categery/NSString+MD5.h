//
//  NSString+MD5.h
//  BreachApp
//
//  Created by ah on 16/5/12.
//  Copyright © 2016年 ah. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface NSString (MD5)
/**小写 32位加密*/
- (NSString*)md532BitLower;
/**大写 32位加密*/
- (NSString*)md532BitUpper;

@end
