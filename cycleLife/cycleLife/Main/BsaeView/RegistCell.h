//
//  RegistCell.h
//  BreachApp
//
//  Created by ah on 16/5/12.
//  Copyright © 2016年 ah. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface RegistCell : UITableViewCell

- (void)makeContentRowAtIndexPath:(NSIndexPath *)indexPath;

@property (nonatomic,copy)NSString *content;

@end
