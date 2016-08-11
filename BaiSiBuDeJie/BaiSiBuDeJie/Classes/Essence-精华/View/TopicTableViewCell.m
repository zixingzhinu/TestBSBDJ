//
//  TopicTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by James on 16/8/10.
//  Copyright © 2016年 James. All rights reserved.
//

#import "TopicTableViewCell.h"
#import "TopicModel.h"
#import <UIImageView+WebCache.h>

@interface TopicTableViewCell ()
@property (weak, nonatomic) IBOutlet UIView *topLayoutView;
@property (weak, nonatomic) IBOutlet UIView *bottomLayoutView;
@property (weak, nonatomic) IBOutlet UIImageView *iconUserImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *createdAtTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *topicTextLabel;
@property (weak, nonatomic) IBOutlet UIButton *dingButton;
@property (weak, nonatomic) IBOutlet UIButton *caiButton;
@property (weak, nonatomic) IBOutlet UIButton *shareButton;
@property (weak, nonatomic) IBOutlet UIButton *commentButton;

@end

@implementation TopicTableViewCell

- (instancetype)initWithCoder:(NSCoder *)coder
{
    self = [super initWithCoder:coder];
    if (self) {
//        NSLog(@"");
        
    }
    return self;
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
//    NSLog(@"");
    UIImageView *backgroundView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"mainCellBackground"]];
    backgroundView.userInteractionEnabled = YES;
    self.backgroundView = backgroundView;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

- (void)setTopicModel:(TopicModel *)topicModel {
    _topicModel = topicModel;
    [self.iconUserImageView sd_setImageWithURL:[NSURL URLWithString:topicModel.profile_image] placeholderImage:[UIImage imageNamed:@"defaultUserIcon"]];
    self.userNameLabel.text = topicModel.screen_name;
    self.createdAtTimeLabel.text = topicModel.created_at;
    _topicTextLabel.text = topicModel.text;
}

@end
