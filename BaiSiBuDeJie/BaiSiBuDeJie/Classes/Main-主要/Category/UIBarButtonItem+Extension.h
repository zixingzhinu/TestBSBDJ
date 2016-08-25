//
//  UIBarButtonItem+Extension.h
//
//  Created by apple on 14-10-7.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)
/**
 *  自定义UIBarButtonItem
 *
 *  @param target    target
 *  @param action    action
 *  @param image     源图片
 *  @param highImage 选中的高亮图片
 */
+ (UIBarButtonItem *)itemWithTarget:(id)target action:(SEL)action image:(NSString *)image highImage:(NSString *)highImage;
@end
