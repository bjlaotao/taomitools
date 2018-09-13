//
//  AppDelegate.m
//  TaoMiTools
//
//  Created by MixReality on 2018/9/12.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import "AppDelegate.h"


@interface AppDelegate ()





@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    
    self.mainViewController = [[MainViewController alloc] initWithNibName:@"MainViewController" bundle:nil];
    
    [self.window.contentView addSubview:self.mainViewController.view];
    
    self.mainViewController.view.frame = self.window.contentView.bounds;
}


- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}


@end
