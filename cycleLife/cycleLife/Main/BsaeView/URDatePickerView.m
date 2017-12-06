//
//  URDatePickerView.m
//  UnitRepair
//
//  Created by bruthlee on 15/10/12.
//  Copyright © 2015年 bruthlee.app. All rights reserved.
//

#import "URDatePickerView.h"

#import "UIView+ViewStyle.h"

@interface URDatePickerView()
@property (nonatomic,strong) UIDatePicker *datePicker;
@property (nonatomic,strong) UIToolbar *toolBar;
@property (nonatomic,strong) DatePickerViewBlock handleBlock;
@end

@implementation URDatePickerView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        self.backgroundColor = [[UIColor blackColor] colorWithAlphaComponent:0.5];
    }
    return self;
}

- (void)dealloc
{
    if (self.handleBlock) {
        self.handleBlock = nil;
    }
}

- (void)setMaxDate:(NSDate *)maxDate {
    _maxDate = maxDate;
    self.datePicker.maximumDate = maxDate;
}

- (void)setMinDate:(NSDate *)minDate {
    _minDate = minDate;
    self.datePicker.minimumDate = minDate;
}

- (void)showInView:(UIView *)parentView block:(DatePickerViewBlock)block {
    self.handleBlock = block;
    [parentView addSubview:self];
    [self showWithAnimate];
}

- (void)showInView:(UIView *)parentView withDateModel:(UIDatePickerMode)model block:(DatePickerViewBlock)block {
    self.datePicker.datePickerMode = model;
    [self showInView:parentView block:block];
}

- (void)touchCancelPickerDate {
    if (self.handleBlock) {
        self.handleBlock(NO,nil);
    }
    [self hideWithAnimate];
}

- (void)touchSurePickerDate {
    if (self.handleBlock) {
        
        self.handleBlock(YES, [self getDateStr]);
    }
    [self hideWithAnimate];
}
#pragma mark- 修改返回时间字符串格式
- (NSString *)getDateStr{
    
    NSDate *date = self.datePicker.date;
    NSDateFormatter *pickerFormate= [[NSDateFormatter alloc]init];
    [pickerFormate setDateFormat:@"yyyy/MM/dd HH:mm"];
    return [pickerFormate stringFromDate:date];
}

- (void)showWithAnimate {
    self.toolBar.top = ScreenHeight;
    [self addSubview:self.toolBar];
    self.datePicker.top = CGRectGetMaxY(self.toolBar.frame);
    [self addSubview:self.datePicker];
    
    [UIView animateWithDuration:0.3 animations:^{
        self.toolBar.top = ScreenHeight - self.toolBar.height - self.datePicker.height - self.top-64;
        self.datePicker.top = CGRectGetMaxY(self.toolBar.frame);;
    }];
}

- (void)hideWithAnimate {
    [UIView animateWithDuration:0.3 animations:^{
        self.toolBar.top = ScreenHeight;
        self.datePicker.top =  CGRectGetMaxY(self.toolBar.frame);;
    } completion:^(BOOL finished) {
        [self.toolBar removeFromSuperview];
        [self.datePicker removeFromSuperview];
        [self removeFromSuperview];
    }];
}



- (UIDatePicker *)datePicker {
    if (_datePicker == nil) {
        _datePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 240)];
        _datePicker.backgroundColor = [UIColor whiteColor];
        _datePicker.datePickerMode = UIDatePickerModeDate;
        _datePicker.minuteInterval = 10;
        _datePicker.calendar =[NSCalendar currentCalendar];
        [_datePicker setLocale:[[NSLocale alloc]initWithLocaleIdentifier:@"zh_Hans_CN"]];
        
    }
//    _datePicker.minimumDate =[NSDate date];
    return _datePicker;
}

- (UIToolbar *)toolBar {
    if (_toolBar == nil) {
        _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, 44)];
        [_toolBar setBackgroundImage:[UIView generateImage:K_AppColor] forToolbarPosition:UIBarPositionAny barMetrics:UIBarMetricsDefault];
        _toolBar.tintColor = [UIColor whiteColor];
        
        UIBarButtonItem *clear = [[UIBarButtonItem alloc] initWithTitle:@"" style:UIBarButtonItemStylePlain target:self action:@selector(touchCancelPickerDate)];
        UIBarButtonItem *flex = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:nil action:nil];
        UIBarButtonItem *sure = [[UIBarButtonItem alloc] initWithTitle:@"确定" style:UIBarButtonItemStylePlain target:self action:@selector(touchSurePickerDate)];
        _toolBar.items = @[clear,flex,sure];
    }
    return _toolBar;
}

#pragma mark - Class Methods

+ (void)showDatePickerInView:(UIView *)parentView block:(DatePickerViewBlock)block {
    URDatePickerView *pickerView = [[URDatePickerView alloc] initWithFrame:CGRectMake(0, 0, ScreenWidth, ScreenHeight)];
    [pickerView showInView:parentView block:block];
}

@end
