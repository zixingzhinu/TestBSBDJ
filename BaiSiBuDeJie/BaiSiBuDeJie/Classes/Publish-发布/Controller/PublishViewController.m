//
//  PublishViewController.m
//  BaiSiBuDeJie
//
//  Created by James on 16/8/25.
//  Copyright © 2016年 James. All rights reserved.
//

#import "PublishViewController.h"
#import "VerticalButton.h"

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
        button.y = i / MAX_COL_COUNT * button.height + SCREEN_HEIGHT / 2 - button.height;
        CGFloat margin_middle = (SCREEN_WIDTH - MARGIN_LEFT_RIGHT * 2 - button.width * MAX_COL_COUNT) / 2;
        button.x = i % MAX_COL_COUNT * (button.width + margin_middle) + MARGIN_LEFT_RIGHT;
        [self.view addSubview:button];
    }
    UILabel *label = [[UILabel alloc] init];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)cancel {
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
