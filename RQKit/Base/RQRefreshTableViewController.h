//
//  RQRefreshTableViewController.h
//  RQKit_Example
//
//  Created by xrq on 2020/6/5.
//  Copyright © 2020 CoderXie. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface RQRefreshTableViewController : UIViewController
<UITableViewDelegate,UITableViewDataSource>

// 默认的tableFooterView
@property (nonatomic, strong) UIView *defaultFooterView;
// tableView
@property (nonatomic, strong) UITableView *tableView;
// tableView的数据源
@property (nonatomic, strong) NSMutableArray *dataArray;

@property (nonatomic, strong) NSMutableDictionary *dataDictionary;
// 当前加载的页数
@property (nonatomic, assign) int page;
// 是否启用下拉加载更多，默认为NO
@property (nonatomic, assign) BOOL showRefreshHeader;
// 是否启用上拉加载更多，默认为NO
@property (nonatomic, assign) BOOL showRefreshFooter;

- (instancetype)initWithStyle:(UITableViewStyle)style;
- (void)tableViewDidHeaderRefresh;
- (void)tableViewDidFooterRefresh;
- (void)tableViewDidFinishHeader:(BOOL)isHeader reload:(BOOL)reload;

@end

NS_ASSUME_NONNULL_END
