//
//  CodingWindowController.m
//  TaoMiTools
//
//  Created by MixReality on 2018/9/13.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import "CodingWindowController.h"

@interface CodingWindowController ()

@property (unsafe_unretained) IBOutlet NSTextView *firstTextView;

@property (unsafe_unretained) IBOutlet NSTextView *secondTextView;

@end

@implementation CodingWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(closeWindow) name:NSWindowWillCloseNotification object:nil];
}

- (IBAction)uft8ToChinaAction:(NSButton *)sender {
    
}


- (void)closeWindow {
    NSLog(@"close");
    if ([_delegate respondsToSelector:@selector(codingWindowWillClose)]) {
        [_delegate codingWindowWillClose];
    }
}

- (void)dealloc {
    NSLog(@"放飞自我了");
}

@end
