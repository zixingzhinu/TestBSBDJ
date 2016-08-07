//
//  TabBarController.m
//  BaiSiBuDeJie
//
//  Created by James on 16/7/2.
//  Copyright © 2016年 James. All rights reserved.
//

#import "TabBarController.h"
#import "EssenceViewController.h"
#import "NewViewController.h"
#import "FriendTrendsViewController.h"
#import "MeViewController.h"
#import "NavigationViewController.h"

@interface TabBarController ()

@end

@implementation TabBarController

+ (void)initialize {
    UITabBar *tabBar = [UITabBar appearance];
    tabBar.backgroundImage = [UIImage imageNamed:@"tabbar-light"];
    
    UITabBarItem *item = [UITabBarItem appearance];
    NSMutableDictionary *attrs = [NSMutableDictionary dictionaryWithCapacity:1];
    [attrs setObject:[UIColor darkGrayColor] forKey:NSForegroundColorAttributeName];
    [item setTitleTextAttributes:attrs forState:UIControlStateSelected];
}

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self setViewControllers:[self tabChildControllers] animated:YES];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (NSArray *)tabChildControllers {
    NSMutableArray *vcArrayM = [NSMutableArray arrayWithCapacity:4];
    EssenceViewController *essenceVc = [[EssenceViewController alloc] init];
    [vcArrayM addObject:[self tabChildControllerWithViewController:essenceVc title:@"精华" imageName:@"tabBar_essence_icon" selectedImageName:@"tabBar_essence_click_icon"]];
    NewViewController *newVc = [[NewViewController alloc] init];
    [vcArrayM addObject:[self tabChildControllerWithViewController:newVc title:@"新帖" imageName:@"tabBar_new_icon" selectedImageName:@"tabBar_new_click_icon"]];
    FriendTrendsViewController *friendTrendsVc = [[FriendTrendsViewController alloc] init];
    [vcArrayM addObject:[self tabChildControllerWithViewController:friendTrendsVc title:@"关注" imageName:@"tabBar_friendTrends_icon" selectedImageName:@"tabBar_friendTrends_click_icon"]];
    MeViewController *meVc = [[MeViewController alloc] init];
    [vcArrayM addObject:[self tabChildControllerWithViewController:meVc title:@"我" imageName:@"tabBar_me_icon" selectedImageName:@"tabBar_me_click_icon"]];
    return vcArrayM;
}

- (UIViewController *)tabChildControllerWithViewController:(UIViewController *)vc title:(NSString *)title imageName:(NSString *)imageName selectedImageName:(NSString *)selectedImageName {
    vc.title = title;
    vc.tabBarItem.image = [UIImage imageNamed:imageName];
    vc.tabBarItem.selectedImage = [UIImage imageNamed:selectedImageName];
    NavigationViewController *nav = [[NavigationViewController alloc] initWithRootViewController:vc];
    return nav;
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
