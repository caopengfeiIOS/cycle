//
//  URPickerView.h
//  UnitRepair
//
//  Created by bruthlee on 15/10/9.
//  Copyright © 2015年 bruthlee.app. All rights reserved.
//

#import <UIKit/UIKit.h>

@class URPickerView;
typedef void(^URPickerViewToolbarBlock)(URPickerView *pickerView , NSInteger index);

@interface URPickerView : UIView

@property (nonatomic,strong) UIPickerView *pickerView;

- (void)showInView:(UIView *)parentView withBlock:(URPickerViewToolbarBlock)block;

@end



#pragma mark -  城市选择器
#pragma mark URAreaPickerView

@class URAreaPickerView;

typedef void(^URAreaPickerViewBlock)(BOOL result, NSString *province, NSString *city, NSString *area,NSString *resultStr);

@interface URAreaPickerView : URPickerView

- (void)showInView:(UIView *)parentView withBlock:(URAreaPickerViewBlock)block;

@end

#pragma mark -  选项选择器
#pragma mark URAreaPickerView

@class URAreaPickerView;

typedef void(^URChoosePickerViewBlock)(NSString *title);

@interface URChoosePickerView : URPickerView

- (void)showInView:(UIView *)parentView withBlock:(URChoosePickerViewBlock)block;
- (instancetype)initWithFrame:(CGRect)frame titleArray:(NSArray*)titleArr;

@end

