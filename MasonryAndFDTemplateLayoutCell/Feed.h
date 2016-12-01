//
//  Feed.h
//  MasonryAndFDTemplateLayoutCell
//
//  Created by 晨希 on 11/30/16.
//  Copyright © 2016 cx. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Feed : NSObject
@property (nonatomic, copy, readonly) NSString *title;
@property (nonatomic, copy, readonly) NSString *content;
@property (nonatomic, copy, readonly) NSString *username;
@property (nonatomic, copy, readonly) NSString *time;
@property (nonatomic, copy, readonly) NSString *imageName;

- (instancetype)initWithdict:(NSDictionary *)dict;

@end
