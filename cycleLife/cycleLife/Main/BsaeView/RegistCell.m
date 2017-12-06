//
//  RegistCell.m
//  BreachApp
//
//  Created by ah on 16/5/12.
//  Copyright © 2016年 ah. All rights reserved.
//

#import "RegistCell.h"

@interface RegistCell ()

@property (weak, nonatomic) IBOutlet UILabel *lableTitle;
@property (weak, nonatomic) IBOutlet UILabel *lableContent;

@end

@implementation RegistCell{
    NSArray *_titleArr;
}

- (void)setContent:(NSString *)content{
    
    _content = content;
    self.lableContent.text = content;
}

- (void)awakeFromNib {
    [super awakeFromNib];
      self.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
     _titleArr = @[@"昵称",@"年龄",@"锋位",@"城市",@"喜欢的球星"];
}

- (void)makeContentRowAtIndexPath:(NSIndexPath *)indexPath{
    
    self.lableTitle.text = _titleArr[indexPath.row];
}

@end
