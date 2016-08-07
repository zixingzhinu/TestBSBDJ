//
//  RecommendTagsTableViewController.m
//  BaiSiBuDeJie
//
//  Created by James on 16/7/9.
//  Copyright © 2016年 James. All rights reserved.
//

#import "RecommendTagsTableViewController.h"
#import "RecommendTagsTableViewCell.h"
#import "RecommendTags.h"
#import <MJExtension.h>
#import <SVProgressHUD.h>


@interface RecommendTagsTableViewController ()

@property (strong, nonatomic) NSMutableArray *recommendTagsArrayM;

@end

@implementation RecommendTagsTableViewController

static NSString * const ID = @"recommendTags";

- (NSMutableArray *)recommendTagsArrayM {
    if (!_recommendTagsArrayM) {
        _recommendTagsArrayM = [NSMutableArray array];
    }
    return _recommendTagsArrayM;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initTableView];
    
    [self requestRecommendTagsData];
}

- (void)requestRecommendTagsData {
    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    
    HttpsTool *httpsTool = [HttpsTool sharedHttpsTool];
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"a"] = @"tag_recommend";
    params[@"action"] = @"sub";
    params[@"c"] = @"topic";
    [httpsTool GET:@"api_open.php" parameters:params success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"%@", responseObject);
        NSArray *array = [RecommendTags mj_objectArrayWithKeyValuesArray:responseObject];
//        NSLog(@"%@", array);
        [self.recommendTagsArrayM addObjectsFromArray:array];
        [self.tableView reloadData];
        [SVProgressHUD dismiss];
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        [SVProgressHUD showErrorWithStatus:@"获取数据失败"];
    }];
}

- (void)initTableView {
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([RecommendTagsTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
    self.tableView.rowHeight = 55;
    self.tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor = GlobalBg;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.recommendTagsArrayM.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    RecommendTagsTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID];
    cell.recommendTags = self.recommendTagsArrayM[indexPath.row];
    return cell;
}

@end
