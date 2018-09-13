//
//  AppDelegate.h
//  TaoMiTools
//
//  Created by MixReality on 2018/9/12.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "MainViewController.h"

@interface AppDelegate : NSObject <NSApplicationDelegate>

@property (nonatomic, strong) MainViewController *mainViewController;

@property (weak) IBOutlet NSWindow *window;


@end

