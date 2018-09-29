//
//  ColorConversionWindowController.h
//  TaoMiTools
//
//  Created by MixReality on 2018/9/29.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import <Cocoa/Cocoa.h>



NS_ASSUME_NONNULL_BEGIN


@protocol ColorConversionWindowClosedDelegate <NSObject>

@optional


/**
 编码窗口关闭
 */
- (void)colorConversionWindowWillClose;

@end

@interface ColorConversionWindowController : NSWindowController

@property (weak) IBOutlet NSTextField *rTextField;

@property (weak) IBOutlet NSTextField *gTextField;

@property (weak) IBOutlet NSTextField *bTextField;

@property (weak) IBOutlet NSTextField *showDecimalTextField;


- (IBAction)rgbConversionDecimalAction:(NSButton *)sender;

@property (weak) IBOutlet NSImageView *rgbImageView;


@property (weak) IBOutlet NSTextField *decimalTextField;

- (IBAction)decimalConversionRGBAction:(NSButton *)sender;

@property (weak) IBOutlet NSTextField *rgbTextField;

@property (nonatomic, weak, nullable) id<ColorConversionWindowClosedDelegate> delegate;

@end

NS_ASSUME_NONNULL_END
