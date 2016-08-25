//
//  TabBar.m
//  BaiSiBuDeJie
//
//  Created by James on 16/8/25.
//  Copyright © 2016年 James. All rights reserved.
//

#import "TabBar.h"
#import "PublishViewController.h"

#define MAX_COUNT 5

@implementation TabBar

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
        [self initView];
    }
    return self;
}

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        [self initView];
    }
    return self;
}

- (void)initView {
    self.backgroundImage = [UIImage imageNamed:@"tabbar-light"];

    UIButton *button = [UIButton buttonWithType:UIButtonTypeCustom];
    [button setImage:[UIImage imageNamed:@"tabBar_publish_icon"] forState:UIControlStateNormal];
    [button setImage:[UIImage imageNamed:@"tabBar_publish_click_icon"] forState:UIControlStateHighlighted];
    [button addTarget:self action:@selector(publishBtnDidClick:) forControlEvents:UIControlEventTouchUpInside];
    [self addSubview:button];
}

- (void)publishBtnDidClick:(UIButton *)publishBtn {
    PublishViewController *publishVc = [[PublishViewController alloc] init];
    [[UIApplication sharedApplication].keyWindow.rootViewController presentViewController:publishVc animated:NO completion:nil];
}

- (void)layoutSubviews {
    [super layoutSubviews];
    CGFloat tabButtonW = self.width / MAX_COUNT;
    CGFloat tabButtonH = self.height;
    NSInteger index = 0;
    for (NSInteger i = 0; i < self.subviews.count; i++) {
        UIView *view = self.subviews[i];
//        NSLog(@"%@", view);
        if ([view isKindOfClass:NSClassFromString(@"UITabBarButton")]) {
//            if (index >= 2) {
//                view.x = (index + 1) * tabButtonW;
//            }
//            else {
//                view.x = index * tabButtonW;
//            }
            view.x = (index >= 2 ? (index + 1) : index) * tabButtonW;
            view.width = tabButtonW;
            view.height = tabButtonH;
            index++;
        }
        else if ([view isKindOfClass:[UIButton class]]) {
            view.center = CGPointMake(self.width / 2, self.height / 2);
            view.width = tabButtonW;
            view.height = tabButtonH;
        }
    }
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
