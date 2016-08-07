//
//  EssenceViewController.m
//  BaiSiBuDeJie
//
//  Created by James on 16/7/2.
//  Copyright © 2016年 James. All rights reserved.
//

#import "EssenceViewController.h"
#import "UIView+Extension.h"
#import "RecommendTagsTableViewController.h"
#import "TopicTableViewController.h"


@interface EssenceViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *titleLayoutView;
@property (weak, nonatomic) IBOutlet UIScrollView *contentScrollView;
@property (strong, nonatomic) NSArray *titleButtonTexts;
@property (weak, nonatomic) UIButton *currentTitleButton;
@property (weak, nonatomic) UIView *indicatorView;
@end

static NSInteger titleButtonCount = 5;

@implementation EssenceViewController

- (NSArray *)titleButtonTexts {
    if (!_titleButtonTexts) {
        _titleButtonTexts = [[NSArray alloc] initWithObjects:@"全部", @"图片", @"视频", @"声音", @"段子", nil];
    }
    return _titleButtonTexts;
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initNavBar];
    [self initChildControllers];
    [self initTitleBar];
    [self initContentScrollView];
}

/**
 *  初始化内容
 */
- (void)initContentScrollView {
    self.automaticallyAdjustsScrollViewInsets = NO;
    self.contentScrollView.contentSize = CGSizeMake(SCREEN_WIDTH * titleButtonCount, SCREEN_HEIGHT);
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

- (void)initChildControllers {
    TopicTableViewController *allTopic = [[TopicTableViewController alloc] init];
    [self addChildViewController:allTopic];
    TopicTableViewController *picTopic = [[TopicTableViewController alloc] init];
    [self addChildViewController:picTopic];
    TopicTableViewController *videoTopic = [[TopicTableViewController alloc] init];
    [self addChildViewController:videoTopic];
    TopicTableViewController *audioTopic = [[TopicTableViewController alloc] init];
    [self addChildViewController:audioTopic];
    TopicTableViewController *wordTopic = [[TopicTableViewController alloc] init];
    [self addChildViewController:wordTopic];
}

/**
 *  初始化标题栏
 */
- (void)initTitleBar {
    CGFloat titleButtonW = SCREEN_WIDTH / titleButtonCount;
    
    UIView *indicatorView = [[UIView alloc] init];
    indicatorView.backgroundColor = [UIColor redColor];
    CGFloat indicatorH = 2;
    indicatorView.y = self.titleLayoutView.height - indicatorH;
    indicatorView.height = indicatorH;
    [self.titleLayoutView addSubview:indicatorView];
    self.indicatorView = indicatorView;
    
    for (int i = 0; i < titleButtonCount; i++) {
        UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
        [button setTitle:self.titleButtonTexts[i] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:[UIFont systemFontSize]];
        [button setTitleColor:[UIColor redColor] forState:UIControlStateDisabled];
        [button setTitleColor:[UIColor grayColor] forState:UIControlStateNormal];
        button.tag = i + 1;
        button.x = i * titleButtonW;
        button.y = 0;
        button.width = titleButtonW;
        button.height = self.titleLayoutView.height;
        [button addTarget:self action:@selector(titleButtonDidClick:) forControlEvents:UIControlEventTouchUpInside];
        [self.titleLayoutView addSubview:button];
        
        if (i == 0) {
            button.enabled = NO;
            [button.titleLabel sizeToFit];
            indicatorView.width = button.titleLabel.width;
            indicatorView.centerX = button.centerX;
            self.currentTitleButton = button;
        }
    }
    
}
/**
 *  点击titleButton
 *
 *  @param titleButton titleButton description
 */
- (void)titleButtonDidClick:(UIButton *)titleButton {
//    NSLog(@"");
    self.currentTitleButton.enabled = YES;
    titleButton.enabled = NO;
    self.currentTitleButton = titleButton;
    [UIView animateWithDuration:0.25f animations:^{
        self.indicatorView.centerX = titleButton.centerX;
    }];
//    CGRect pageRect = CGRectMake((titleButton.tag - 1) * SCREEN_WIDTH, 0, SCREEN_WIDTH, SCREEN_HEIGHT);
    //想使用这个方法，tableView的contentSize两个参数必须不能为0，且满足滑动
//    [self.contentScrollView scrollRectToVisible:pageRect animated:YES];
    CGPoint pagePoint = CGPointMake((titleButton.tag - 1) * SCREEN_WIDTH, 0);
    [self.contentScrollView setContentOffset:pagePoint animated:NO];
    [self scrollViewDidEndScrollingAnimation:self.contentScrollView];
}

/**
 *  初始化
 */
- (void)initNavBar {
    self.navigationItem.titleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"MainTitle"]];
    UIButton *leftBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [leftBtn setImage:[UIImage imageNamed:@"MainTagSubIcon"] forState:UIControlStateNormal];
    [leftBtn setImage:[UIImage imageNamed:@"MainTagSubIconClick"] forState:UIControlStateHighlighted];
    leftBtn.width = 18;
    leftBtn.height = 15;
    [leftBtn addTarget:self action:@selector(RecommentTagsBtnDidClick) forControlEvents:UIControlEventTouchUpInside];
    self.navigationItem.leftBarButtonItem = [[UIBarButtonItem alloc] initWithCustomView:leftBtn];
}
/**
 *  获取“标签订阅”页面中“推荐标签”中的内容
 */
- (void)RecommentTagsBtnDidClick {
    RecommendTagsTableViewController *recommendTags = [[RecommendTagsTableViewController alloc] init];
    [self.navigationController pushViewController:recommendTags animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - UIScrollViewDelegate
- (void)scrollViewDidEndScrollingAnimation:(UIScrollView *)scrollView {
//    NSLog(@"");
    NSArray *childVcs = self.childViewControllers;
    NSInteger pageIndex = scrollView.contentOffset.x / SCREEN_WIDTH;
//    NSLog(@"%ld", (long)pageIndex);
    UIViewController *vc = childVcs[pageIndex];
    vc.view.width = scrollView.width;
    vc.view.x = pageIndex * vc.view.width;
    vc.view.y = 0;
    vc.view.height = scrollView.height;
//    ((UITableView *)vc.view).contentInset = UIEdgeInsetsMake(64, 0, 49, 0);
    UITableView *tableView = (UITableView *)vc.view;
//    NSLog(@"%@", NSStringFromCGRect(tableView.frame));
    tableView.contentInset = UIEdgeInsetsMake(CGRectGetMaxY(self.titleLayoutView.frame), 0, self.tabBarController.tabBar.height, 0);
    tableView.scrollIndicatorInsets = tableView.contentInset;
    [scrollView addSubview:vc.view];
}

- (void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView {
//    NSLog(@"");
//    [self scrollViewDidEndScrollingAnimation:scrollView];
    NSInteger pageIndex = scrollView.contentOffset.x / scrollView.width;
    [self titleButtonDidClick:[self.titleLayoutView viewWithTag:pageIndex + 1]];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
