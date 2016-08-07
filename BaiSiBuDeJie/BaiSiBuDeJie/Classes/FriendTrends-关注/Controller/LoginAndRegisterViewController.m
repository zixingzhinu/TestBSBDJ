//
//  LoginAndRegisterViewController.m
//  BaiSiBuDeJie
//
//  Created by James on 16/7/13.
//  Copyright © 2016年 James. All rights reserved.
//

#import "LoginAndRegisterViewController.h"

@interface LoginAndRegisterViewController ()
@property (weak, nonatomic) IBOutlet UIView *loginLayoutView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *loginLayoutViewConstraint;

@end

@implementation LoginAndRegisterViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (IBAction)back:(UIButton *)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}

- (IBAction)loginAndRegisterChangeBtnDidClick:(UIButton *)sender {
    [self.view endEditing:YES];
    if (sender.isSelected) {
        sender.selected = NO;
        self.loginLayoutViewConstraint.constant = 0;
    }
    else {
        sender.selected = YES;
        self.loginLayoutViewConstraint.constant = -self.view.width;
    }
    [UIView animateWithDuration:0.25 animations:^{
        [self.view setNeedsLayout];
        [self.view layoutIfNeeded];
    } completion:nil];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
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
