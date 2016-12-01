//
//  Feed.m
//  MasonryAndFDTemplateLayoutCell
//
//  Created by 晨希 on 11/30/16.
//  Copyright © 2016 cx. All rights reserved.
//

#import "Feed.h"

@implementation Feed

- (instancetype)initWithdict:(NSDictionary *)dict {
    if (self = [super init]) {
        _title = dict[@"title"];
        _content = dict[@"content"];
        _username = dict[@"username"];
        _time = dict[@"time"];
        _imageName = dict[@"imageName"];
    }
    return self;
}

@end
