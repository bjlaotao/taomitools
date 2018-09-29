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
#import "CodingWindowController.h"
#import "ColorConversionWindowController.h"

@interface MainViewController ()<NSTableViewDelegate, NSTableViewDataSource, TimestampWindowClosedDelegate, CodingWindowClosedDelegate>

@end

@implementation MainViewController {
    NSArray *_listArray;
    TimestampWindowController *_timestampWC;
    CodingWindowController *_codingWC;
    ColorConversionWindowController *_colorConversionWC;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    _listArray = @[@"时间戳", @"编码", @"16进制颜色与RGB转换"];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    
}

#pragma mark - 选中的响应
- (void)tableViewSelectionDidChange:(NSNotification *)notification {
//    NSLog(@"%@", notification);
    NSTableView *tableView = notification.object;
//    NSLog(@"%d, %d", tableView.selectedColumn, tableView.selectedRow);
    switch (tableView.selectedRow) {
        case 0: {
            if (!_timestampWC) {
                _timestampWC = [[TimestampWindowController alloc] initWithWindowNibName:@"TimestampWindowController"];
                _timestampWC.delegate = self;
                [_timestampWC showWindow:notification];
                [_timestampWC.window center];
            }
        }
            break;
        case 1: {
            if (!_codingWC) {
                _codingWC = [[CodingWindowController alloc] initWithWindowNibName:@"CodingWindowController"];
                _codingWC.delegate = self;
                [_codingWC showWindow:nil];
                [_codingWC.window center];
            }
        }
            break;
        case 2: {
            if (!_colorConversionWC) {
                _colorConversionWC = [[ColorConversionWindowController alloc] initWithWindowNibName:@"ColorConversionWindowController"];
                [_colorConversionWC showWindow:notification];
                [_colorConversionWC.window center];
            }
        }
            break;
        default:
            break;
    }
    
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

- (void)timestampWindowWillClose {
    _timestampWC = nil;
}

- (void)codingWindowWillClose {
    _codingWC = nil;
}

- (void)colorConversionWindowWillClose {
    _colorConversionWC = nil;
}


@end
