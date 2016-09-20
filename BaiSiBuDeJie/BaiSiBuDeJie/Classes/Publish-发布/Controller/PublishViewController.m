//
//  PublishViewController.m
//  BaiSiBuDeJie
//
//  Created by James on 16/8/25.
//  Copyright © 2016年 James. All rights reserved.
//

#import "PublishViewController.h"
#import "VerticalButton.h"
#import <POP.h>

#define MAX_COUNT 6
#define MAX_COL_COUNT 3
#define MARGIN_TOP 100
#define MARGIN_LEFT_RIGHT 15

@interface PublishViewController ()

@end

@implementation PublishViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initSubViews];
}
/**
 *  初始化子控件
 */
- (void)initSubViews {
    // 数据
    NSArray *images = @[@"publish-video", @"publish-picture", @"publish-text", @"publish-audio", @"publish-review", @"publish-offline"];
    NSArray *titles = @[@"发视频", @"发图片", @"发段子", @"发声音", @"审帖", @"离线下载"];
    for (NSInteger i = 0; i < MAX_COUNT; i++) {
        VerticalButton *button = [VerticalButton buttonWithType:UIButtonTypeCustom];
        [button setImage:[UIImage imageNamed:images[i]] forState:UIControlStateNormal];
        [button setTitle:titles[i] forState:UIControlStateNormal];
        [button setTitleColor:[UIColor lightGrayColor] forState:UIControlStateNormal];
        button.titleLabel.font = [UIFont systemFontOfSize:14];
        button.width = button.currentImage.size.width;
        button.height = button.currentImage.size.height + 30;
        CGFloat buttonX = i / MAX_COL_COUNT * button.height + SCREEN_HEIGHT / 2 - button.height;
        CGFloat margin_middle = (SCREEN_WIDTH - MARGIN_LEFT_RIGHT * 2 - button.width * MAX_COL_COUNT) / 2;
        CGFloat buttonY = i % MAX_COL_COUNT * (button.width + margin_middle) + MARGIN_LEFT_RIGHT;
        button.x = buttonX;
        button.y = -button.height + button.height / 2;
        [self.view addSubview:button];
        
        //组织动画
        POPSpringAnimation *enterAnim = [POPSpringAnimation animationWithPropertyNamed:kPOPViewCenter];
//        enterAnim.fromValue = [NSValue valueWithCGPoint:CGPointMake(buttonX + button.width / 2, -button.height + button.height / 2)];
        enterAnim.toValue = [NSValue valueWithCGPoint:CGPointMake(buttonX + button.width / 2, buttonY + button.height / 2)];
        enterAnim.springSpeed = 12;
        enterAnim.springBounciness = 8;
        enterAnim.beginTime = CACurrentMediaTime() + 0.1 * i;
        [button pop_addAnimation:enterAnim forKey:@"enterAnim"];
    }
    UIImageView *sloganView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"app_slogan"]];
    sloganView.center = CGPointMake(SCREEN_WIDTH / 2, 100);
    [self.view addSubview:sloganView];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel {
    [self dismissViewControllerAnimated:NO completion:nil];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event {
    
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
