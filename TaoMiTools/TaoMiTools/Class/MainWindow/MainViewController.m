//
//  MainViewController.m
//  TaoMiTools
//
//  Created by MixReality on 2018/9/12.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import "MainViewController.h"
#import "AppDelegate.h"
#import "TimestampWindowController.h"

@interface MainViewController ()<NSTableViewDelegate, NSTableViewDataSource>

@end

@implementation MainViewController {
    NSArray *_listArray;
    TimestampWindowController *_timestampWC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    _listArray = @[@"时间戳", @"编码"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
}

- (IBAction)buttonAction:(id)sender {
    NSLog(@"===");
}

#pragma mark - 选中的响应
- (void)tableViewSelectionDidChange:(NSNotification *)notification {
//    NSLog(@"%@", notification);
    NSTableView *tableView = notification.object;
//    NSLog(@"%d, %d", tableView.selectedColumn, tableView.selectedRow);
    if (tableView.selectedRow == 0) {
        if (!_timestampWC) {
            _timestampWC = [[TimestampWindowController alloc] initWithWindowNibName:@"TimestampWindowController"];
            [_timestampWC showWindow:notification];
            [_timestampWC.window center];
        }
    }
    
    
    
//    TestViewController *testVC = [[TestViewController alloc] initWithNibName:@"TestViewController" bundle:nil];
    
//    AppDelegate *appDelegate = (AppDelegate *)[NSApplication sharedApplication].delegate;
//    [appDelegate.window.contentView addSubview:testVC.view];

//    NSRect bounds = appDelegate.window.contentView.bounds;
//
//    testVC.view.frame = CGRectMake(bounds.origin.x + 100, bounds.origin.y + 100, bounds.size.width, bounds.size.height);
    
//    TimeWindowController *timeWC = [[TimeWindowController alloc] initWithWindowNibName:@"TimeWindowController"];
////    [timeWC showWindow:nil];
////    [[NSApplication sharedApplication] runModalForWindow:timeWC.window];
//    [timeWC showWindow:nil];
//    [timeWC.window center];
}

- (NSInteger)numberOfRowsInTableView:(NSTableView *)tableView {
    return _listArray.count;
}

- (NSView *)tableView:(NSTableView *)tableView viewForTableColumn:(nullable NSTableColumn *)tableColumn row:(NSInteger)row {
    NSString *columnID = tableColumn.identifier;
//    NSLog(@"columnID : %@ ,row : %ld",columnID,(long)row);
    
    
    if ([tableColumn.identifier isEqualToString:@"first"]) {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"first" owner:self];
        cellView.textField.stringValue = _listArray[row];
        return cellView;
    }else {
        NSTableCellView *cellView = [tableView makeViewWithIdentifier:@"second" owner:self];
        cellView.textField.stringValue = @"第二行";
        return cellView;
    }
}

@end
