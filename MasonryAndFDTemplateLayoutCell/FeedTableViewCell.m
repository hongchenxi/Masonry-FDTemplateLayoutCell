//
//  FeedTableViewCell.m
//  MasonryAndFDTemplateLayoutCell
//
//  Created by 晨希 on 11/30/16.
//  Copyright © 2016 cx. All rights reserved.
//

#import "FeedTableViewCell.h"
#import <Masonry/Masonry.h>

@interface FeedTableViewCell()
@property (nonatomic, strong) UILabel *titleLabel;
@property (nonatomic, strong) UILabel *contentLabel;
@property (nonatomic, strong) UIImageView *contentImageView;
@property (nonatomic, strong) UILabel *userNameLabel;
@property (nonatomic, strong) UILabel *timeLabel;

@end

@implementation FeedTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}


- (instancetype)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier {
    if (self = [super initWithStyle:style reuseIdentifier:reuseIdentifier]) {
        [self configSubView];
    }
    return self;
}

- (void)configSubView {
    self.titleLabel = [UILabel new];
    [self.contentView addSubview:self.titleLabel];
    [self.titleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.top.mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
    }];
    self.titleLabel.textColor = [UIColor blueColor];
    
    self.contentLabel = [UILabel new];
    [self.contentView addSubview:self.contentLabel];
    [self.contentLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.titleLabel.mas_bottom).with.offset(6);
        make.right.mas_equalTo(@-10);
    }];
    self.contentLabel.textColor = [UIColor redColor];
    self.contentLabel.numberOfLines = 0;
    
    self.contentImageView = [UIImageView new];
    [self.contentView addSubview:self.contentImageView];
    [self.contentImageView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.contentLabel.mas_bottom).with.offset(8);
    }];
    
    self.userNameLabel = [UILabel new];
    [self.contentView addSubview:self.userNameLabel];
    [self.userNameLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.equalTo(self.titleLabel);
        make.top.equalTo(self.contentImageView.mas_bottom).with.offset(8);
        make.bottom.mas_equalTo(@-4);
    }];
    
    self.timeLabel = [UILabel new];
    [self.contentView addSubview:self.timeLabel];
    [self.timeLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.right.mas_equalTo(-10);
        make.centerY.equalTo(self.userNameLabel);
    }];
}

- (void)setFeed:(Feed *)feed {
    _feed = feed;
    
    self.titleLabel.text = feed.title;
    self.contentLabel.text = feed.content;
    self.contentImageView.image = [UIImage imageNamed:feed.imageName];
    self.userNameLabel.text = feed.username;
    self.timeLabel.text = feed.time;
}


@end
