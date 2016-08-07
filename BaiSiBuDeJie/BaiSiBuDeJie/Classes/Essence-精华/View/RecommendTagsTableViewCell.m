//
//  RecommendTagsTableViewCell.m
//  BaiSiBuDeJie
//
//  Created by James on 16/7/9.
//  Copyright © 2016年 James. All rights reserved.
//

#import "RecommendTagsTableViewCell.h"
#import <UIImageView+WebCache.h>
#import "RecommendTags.h"

@interface RecommendTagsTableViewCell ()
@property (weak, nonatomic) IBOutlet UIImageView *imageListImageView;
@property (weak, nonatomic) IBOutlet UILabel *themeNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *subNumberLabel;
@property (weak, nonatomic) IBOutlet UIButton *themeSubBtn;

@end

@implementation RecommendTagsTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
}

- (void)setRecommendTags:(RecommendTags *)recommendTags {
    _recommendTags = recommendTags;
    [_imageListImageView sd_setImageWithURL:[NSURL URLWithString:recommendTags.image_list] placeholderImage:[UIImage imageNamed:@"post_placeholderImage"]];
    self.themeNameLabel.text = recommendTags.theme_name;
    NSString *fansNum = nil;
    if (recommendTags.sub_number.integerValue > 10000) {
        CGFloat subNum = recommendTags.sub_number.integerValue / 10000;
        fansNum = [NSString stringWithFormat:@"已有%.1f万人订阅", subNum];
    }
    else {
        fansNum = [NSString stringWithFormat:@"已有%@万人订阅", recommendTags.sub_number];
    }
    self.subNumberLabel.text = fansNum;
}

- (void)setFrame:(CGRect)frame {
    frame.origin.x = 5;
    frame.size.width -= 2 * frame.origin.x;
    frame.size.height -= 1;
    [super setFrame:frame];
}

@end
