//
//  ColorConversionWindowController.m
//  TaoMiTools
//
//  Created by MixReality on 2018/9/29.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import "ColorConversionWindowController.h"

@interface ColorConversionWindowController ()

@end

@implementation ColorConversionWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeWindow) name:NSWindowWillCloseNotification object:nil];
}


- (void)closeWindow {
    NSLog(@"close");
    if ([_delegate respondsToSelector:@selector(colorConversionWindowWillClose)]) {
        [_delegate colorConversionWindowWillClose];
    }
}

- (IBAction)rgbConversionDecimalAction:(NSButton *)sender {
    
    NSInteger r = strtol([_rTextField.stringValue UTF8String], 0, 10);
    NSInteger g = strtol([_gTextField.stringValue UTF8String], 0, 10);
    NSInteger b = strtol([_bTextField.stringValue UTF8String], 0, 10);
    
//    NSLog(@"%lx, %lx, %lx", (long)r, (long)g, (long)b);
    NSString *showValue = [NSString stringWithFormat:@"0x%lx%lx%lx",  (long)r, (long)g, (long)b];
    _showDecimalTextField.stringValue = showValue;
    
    _rgbImageView.layer.backgroundColor = [NSColor colorWithRed:r / 255.0 green:g / 255.0 blue:b / 255.0 alpha:1].CGColor;
}

- (IBAction)decimalConversionRGBAction:(NSButton *)sender {
    NSLog(@"%@", _decimalTextField.stringValue);
    NSString *stringValue = _decimalTextField.stringValue;
    
    NSInteger value = strtol([stringValue UTF8String], 0, 16);
    
//    NSLog(@"%lx", (long)value);
    NSInteger r = (value>>16)&0xFF;
    NSInteger g = (value>>8)&0xFF;
    NSInteger b = (value>>0)&0XFF;
//    NSLog(@"%ld, %ld, %ld", (long)r, (long)g, (long)b);
    NSString *showValue = [NSString stringWithFormat:@"R: %ld, G: %ld, B: %ld", (long)r, (long)g, (long)b];
    _rgbTextField.stringValue = showValue;
}

- (void)keyDown:(NSEvent *)event {
    NSLog(@"%@", event);
}

- (void)keyUp:(NSEvent *)event {
    
}

@end
