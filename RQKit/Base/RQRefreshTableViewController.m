//
//  RQRefreshTableViewController.m
//  RQKit_Example
//
//  Created by xrq on 2020/6/5.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import "RQRefreshTableViewController.h"
#import <MJRefresh/MJRefresh.h>

@interface RQRefreshTableViewController ()

@property (nonatomic, assign) UITableViewStyle style;

@end

@implementation RQRefreshTableViewController

- (instancetype)init
{
    return [self initWithStyle:UITableViewStylePlain];
}

- (instancetype)initWithStyle:(UITableViewStyle)style
{
    self = [super init];
    if (self) {
        _style = style;
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = UIColor.whiteColor;
    _page = 0;
    _showRefreshHeader = NO;
    _showRefreshFooter = NO;
    [self.view addSubview:self.tableView];
}

- (void)didLogout
{
    [self.tableView reloadData];
}

- (void)didLogin
{
    [self.tableView reloadData];
}

#pragma mark - ##########  setter

- (void)setShowRefreshHeader:(BOOL)showRefreshHeader
{
    if (_showRefreshHeader != showRefreshHeader) {
        _showRefreshHeader = showRefreshHeader;
        if (_showRefreshHeader) {
            __weak RQRefreshTableViewController *weakSelf = self;
            self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
                [weakSelf tableViewDidHeaderRefresh];
            }];
            self.tableView.mj_header.accessibilityIdentifier = @"refresh_header";
        }
        else
        {
            [self.tableView setMj_header:nil];
        }
    }
}

- (void)setShowRefreshFooter:(BOOL)showRefreshFooter
{
    if (_showRefreshFooter != showRefreshFooter) {
        _showRefreshFooter = showRefreshFooter;
        if (_showRefreshFooter) {
            __weak RQRefreshTableViewController *weakSelf = self;
            self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
                [weakSelf tableViewDidFooterRefresh];
            }];
            self.tableView.mj_footer.accessibilityIdentifier = @"refresh_footer";
        }
        else
        {
            [self.tableView setMj_footer:nil];
        }
    }
}

#pragma mark - ##########  getter

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray array];
    }
    return _dataArray;
}

- (NSMutableDictionary *)dataDictionary
{
    if (!_dataDictionary) {
        _dataDictionary = [NSMutableDictionary dictionary];
    }
    return _dataDictionary;
}

- (UIView *)defaultFooterView
{
    if (!_defaultFooterView) {
        _defaultFooterView = [[UIView alloc] init];
    }
    return _defaultFooterView;
}

#pragma mark - ##########  delegate
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"UITableViewCell";
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier];
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 50;
}

- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section
{
    return 0.f;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}

#pragma mark - ##########  public

- (void)autoHeaderRefresh
{
    if (self.showRefreshHeader) {
        [self tableViewDidHeaderRefresh];
    }
}

- (void)tableViewDidHeaderRefresh
{
    
}

- (void)tableViewDidFooterRefresh
{
    
}

- (void)tableViewDidFinishHeader:(BOOL)isHeader reload:(BOOL)reload
{
    __weak RQRefreshTableViewController *weakSelf = self;
    dispatch_async(dispatch_get_main_queue(), ^{
        if (reload)
        {
            [weakSelf.tableView reloadData];
        }
        
        if (isHeader)
        {
            [weakSelf.tableView.mj_header endRefreshing];
        }
        else
        {
            [weakSelf.tableView.mj_footer endRefreshing];
        }
    });
}

#pragma mark -
- (UITableView *)tableView
{
     if (!_tableView) {
          _tableView = [[UITableView alloc] initWithFrame:self.view.bounds style:self.style];
          _tableView.backgroundColor = [UIColor clearColor];
          _tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
          _tableView.accessibilityIdentifier = @"table_view";
          _tableView.autoresizingMask = UIViewAutoresizingFlexibleWidth | UIViewAutoresizingFlexibleHeight;
          _tableView.delegate = self;
          _tableView.dataSource = self;
          _tableView.tableFooterView = self.defaultFooterView;
          _tableView.estimatedRowHeight = 0;
          _tableView.estimatedSectionHeaderHeight = 0;
          _tableView.estimatedSectionFooterHeight = 0;
          _tableView.sectionFooterHeight = 0.1f;
     }
     return _tableView;
}

@end
