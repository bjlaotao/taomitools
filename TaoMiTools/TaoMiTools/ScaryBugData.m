//
//  ScaryBugData.m
//  TaoMiTools
//
//  Created by MixReality on 2018/9/12.
//  Copyright © 2018年 MixReality. All rights reserved.
//

#import "ScaryBugData.h"

@implementation ScaryBugData

- (instancetype)initWithTitle:(NSString *)title
                       rating:(float)rating {
    if (self = [super init]) {
        self.title = title;
        self.rating = rating;
    }
    return self;
}

@end
