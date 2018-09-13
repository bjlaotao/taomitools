//
//  CodingWindowController.h
//  TaoMiTools
//
//  Created by MixReality on 2018/9/13.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@protocol CodingWindowClosedDelegate <NSObject>

@optional


/**
 编码窗口关闭
 */
- (void)codingWindowWillClose;

@end

@interface CodingWindowController : NSWindowController

@property (nonatomic, weak) id<CodingWindowClosedDelegate> delegate;

@end
