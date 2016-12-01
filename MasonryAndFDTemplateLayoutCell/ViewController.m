//
//  ViewController.m
//  MasonryAndFDTemplateLayoutCell
//
//  Created by 晨希 on 11/30/16.
//  Copyright © 2016 cx. All rights reserved.
//

#import "ViewController.h"
#import "FeedTableViewCell.h"
#import "Feed.h"
#import <UITableView+FDTemplateLayoutCell/UITableView+FDTemplateLayoutCell.h>
#import <Masonry/Masonry.h>
#import "YYFPSLabel.h"

@interface ViewController ()<UITableViewDataSource, UITableViewDelegate>
@property (nonatomic, copy) NSArray *feeds;
@property (nonatomic, strong) UITableView *tableView;
@property (nonatomic, strong) YYFPSLabel *fpsLabel;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    
    self.tableView = [[UITableView alloc] init];
    [self.view addSubview:self.tableView];
    
    [self.tableView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.edges.mas_equalTo(self.view);
    }];
    
    self.tableView.backgroundColor = [UIColor whiteColor];
    self.tableView.delegate = self;
    self.tableView.dataSource = self;
    
    [self.tableView registerClass:[FeedTableViewCell class] forCellReuseIdentifier:@"feed"];
    
    _fpsLabel = [YYFPSLabel new];
    [self.view addSubview:_fpsLabel];
    [_fpsLabel mas_makeConstraints:^(MASConstraintMaker *make) {
        make.top.mas_equalTo(@10);
        make.right.mas_equalTo(@-10);
    }];
    [_fpsLabel sizeToFit];
    
    
    NSString *dataFilePath = [[NSBundle mainBundle] pathForResource:@"data" ofType:@"json"];
    NSData *data = [NSData dataWithContentsOfFile:dataFilePath];
    NSDictionary *rootDict = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:nil];
    NSArray *feedDict = rootDict[@"feed"];
    
    NSMutableArray *entities = @[].mutableCopy;
    [feedDict enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        [entities addObject:[[Feed alloc]initWithdict:obj]];
    }];
    self.feeds = entities;
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.feeds.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {

    FeedTableViewCell *cell = [[FeedTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"feed"];
    
    cell.feed = self.feeds[indexPath.row];
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    CGFloat tableViewWidth = [tableView frame].size.width;
    CGFloat rowHeight = .0f;
    if (tableViewWidth > 0){
        rowHeight = [tableView fd_heightForCellWithIdentifier:@"feed" cacheByIndexPath:indexPath configuration:^(FeedTableViewCell *cell) {
             cell.feed = self.feeds[indexPath.row];
        }];
    }
    return rowHeight;
}

@end
