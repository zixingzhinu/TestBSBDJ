//
//  TopicTableViewController.m
//  BaiSiBuDeJie
//
//  Created by James on 16/8/7.
//  Copyright © 2016年 James. All rights reserved.
//

#import "TopicTableViewController.h"
#import <SVProgressHUD.h>
#import <MJRefresh.h>
#import <MJExtension.h>
#import "TopicTableViewCell.h"

static NSString * const ID = @"cell_topic";

@interface TopicTableViewController ()

@property (strong, nonatomic) NSArray *topics;

@end

@implementation TopicTableViewController

#pragma mark - lazy
- (NSArray *)topics {
    if (!_topics) {
        _topics = [[NSArray alloc] init];
    }
    return _topics;
}
#pragma mark - lifecycle
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
    [self initTableView];
    [self initRefreshView];
//    [self requestTopicData];
}
/**
 *  初始化tableView
 */
- (void)initTableView {
    self.tableView.backgroundColor = [UIColor lightGrayColor];
    [self.tableView registerNib:[UINib nibWithNibName:NSStringFromClass([TopicTableViewCell class]) bundle:nil] forCellReuseIdentifier:ID];
}

/**
 *  初始化刷新控件
 */
- (void)initRefreshView {
    self.tableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestTopicData];
    }];
    self.tableView.mj_header.automaticallyChangeAlpha = YES;
    [self.tableView.mj_header beginRefreshing];
    self.tableView.mj_footer = [MJRefreshAutoNormalFooter footerWithRefreshingBlock:^{
//        [self requestTopicData];
    }];
}
/**
 *  请求首页数据
 */
- (void)requestTopicData {
//    [SVProgressHUD showWithMaskType:SVProgressHUDMaskTypeBlack];
    HttpsTool *httpTool = [HttpsTool sharedHttpsTool];
    NSMutableDictionary *paramsM = [NSMutableDictionary dictionary];
    paramsM[@"a"] = @"list";
    paramsM[@"c"] = @"data";
    paramsM[@"type"] = @(self.type);
    [httpTool GET:OPEN_URL parameters:paramsM success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
//        [SVProgressHUD dismiss];
//        NSLog(@"%@", responseObject);
        self.topics = [TopicModel mj_objectArrayWithKeyValuesArray:responseObject[@"list"]];
        [self.tableView reloadData];
        [self.tableView.mj_header endRefreshing];
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"%@", error);
        [SVProgressHUD showErrorWithStatus:error.localizedDescription];
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.topics.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    TopicTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    TopicModel *topicModel = self.topics[indexPath.row];
//    cell.textLabel.text = topicModel.text;
    cell.topicModel = topicModel;
    
    return cell;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return 400;
}


/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
