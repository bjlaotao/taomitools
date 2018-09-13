//
//  TimestampWindowController.h
//  TaoMiTools
//
//  Created by MixReality on 2018/9/12.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol TimestampWindowClosedDelegate <NSObject>

@optional


/**
 时间戳窗口关闭
 */
- (void)timestampWindowWillClose;

@end

@interface TimestampWindowController : NSWindowController

@property (nonatomic, weak) id<TimestampWindowClosedDelegate> delegate;

@end
