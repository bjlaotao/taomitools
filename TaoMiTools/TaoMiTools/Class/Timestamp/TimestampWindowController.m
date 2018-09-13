//
//  TimestampWindowController.m
//  TaoMiTools
//
//  Created by MixReality on 2018/9/12.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import "TimestampWindowController.h"

@interface TimestampWindowController ()

@property (weak) IBOutlet NSTextField *tsTextField;

@property (weak) IBOutlet NSTextField *timeTextField;

@property (weak) IBOutlet NSTextField *f_tsTextField;

@property (weak) IBOutlet NSTextField *f_timeTextField;

@property (weak) IBOutlet NSTextField *s_timeTextField;

@property (weak) IBOutlet NSTextField *s_tsTextField;

@end

@implementation TimestampWindowController {
    NSDate *_date;
    NSDateFormatter *_formatter;
}

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [self configDate];
    [self configData];
}

#pragma mark - 初始化控件
- (void)configData {
    
    NSTimeInterval timeInterval = [_date timeIntervalSince1970];
    
    //时间戳
    NSString *timestamp = [NSString stringWithFormat:@"%.f", timeInterval];
    _tsTextField.stringValue = timestamp;
    _tsTextField.editable = NO;
    
    _f_tsTextField.stringValue = timestamp;
    _s_tsTextField.stringValue = timestamp;
    
    NSString *time = [self timeTsToTime:timeInterval];
    _timeTextField.stringValue = time;
    _f_timeTextField.stringValue = time;
    _s_timeTextField.stringValue = time;
    
}

#pragma mark - 时间
- (void)configDate {
    _date = [NSDate date];
    _formatter = [[NSDateFormatter alloc] init];
    _formatter.dateStyle = NSDateFormatterShortStyle;
    _formatter.dateFormat = @"yyyy-MM-dd HH:mm:ss";
}

#pragma mark - 返回时间戳
- (NSTimeInterval)timeTimeToTs:(NSString *)time {
    
    NSDate *date = [_formatter dateFromString:time];
    return [date timeIntervalSince1970];
}

#pragma mark - 返回时间
- (NSString *)timeTsToTime:(NSTimeInterval)timeInterval {
    NSDate *date = [[NSDate date] initWithTimeIntervalSince1970:timeInterval];
    return [_formatter stringFromDate:date];
}

- (IBAction)stopAction:(NSButton *)sender {
    
}

- (IBAction)timeIntervalToTime:(NSButton *)sender {
    _f_timeTextField.stringValue = [self timeTsToTime:_f_tsTextField.doubleValue];
}

- (IBAction)timeToTimeInterval:(NSButton *)sender {
    NSTimeInterval timeInterval = [self timeTimeToTs:_s_timeTextField.stringValue];
    
    _s_tsTextField.stringValue = [NSString stringWithFormat:@"%.f", timeInterval];
}

- (void)dealloc {
    NSLog(@"我自由啦");
}

@end
