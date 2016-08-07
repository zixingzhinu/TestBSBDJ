//
//  RecommendTags.h
//  BaiSiBuDeJie
//
//  Created by James on 16/7/10.
//  Copyright © 2016年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface RecommendTags : NSObject
/*
 is_sub	int	是否含有子标签
 theme_id	string	此标签的id
 theme_name	string	标签名称
 sub_number	string	此标签的订阅量
 is_default	int	是否是默认的推荐标签
 image_list	string	推荐标签的图片url地址
 */

@property (assign, nonatomic) NSInteger is_sub;
@property (copy, nonatomic) NSString *theme_id;
@property (copy, nonatomic) NSString *theme_name;
@property (copy, nonatomic) NSString *sub_number;
@property (assign, nonatomic) NSInteger is_default;
@property (copy, nonatomic) NSString *image_list;

@end
