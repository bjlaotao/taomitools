//
//  ScaryBugData.h
//  TaoMiTools
//
//  Created by MixReality on 2018/9/12.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface ScaryBugData : NSObject

@property (nonatomic, strong) NSString *title;
@property (nonatomic, assign) float rating;

- (instancetype)initWithTitle:(NSString *)title
                       rating:(float)rating;

@end
