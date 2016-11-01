//
//  ViewController.m
//  RefreshGifDemo
//
//  Created by lingzhi on 2016/10/31.
//  Copyright © 2016年 lingzhi. All rights reserved.
//

#import "ViewController.h"

#import "RocketRefreshGifHeader.h"
#import "UIScrollView+MJRefresh.h"
#import "MJRefresh.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>

@property (nonatomic,strong)UITableView *tableView;

@end

@implementation ViewController

- (UITableView *)tableView
{
    if (_tableView == nil) {
        _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStylePlain];
        _tableView.backgroundColor = [UIColor whiteColor];
        
        _tableView.delegate = self;
        _tableView.dataSource = self;
    }
    return _tableView;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    [self.view setBackgroundColor:[UIColor whiteColor]];
    [self.view addSubview:self.tableView];
    
  
    
    
    __weak typeof(self)weakSelf = self;
    RocketRefreshGifHeader *header = [RocketRefreshGifHeader headerWithRefreshingBlock:^{
        
        [weakSelf performSelector:@selector(endRefreashAction) withObject:nil afterDelay:3.0];
        
    }];
    //隐藏时间
    header.lastUpdatedTimeLabel.hidden = YES;
    
    //隐藏状态
    header.stateLabel.hidden = YES;
    
    
    self.tableView.mj_header = header;
    
}

- (void)endRefreashAction
{
    [self.tableView.mj_header endRefreshing];
}

#pragma mark- UITableViewDelegate,UITableViewDataSource

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"CELL"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:@"CELL"];
    }
    
    cell.textLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row];
    return cell;
    
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 100;
}


- (void)reloadAction
{
    
    
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
