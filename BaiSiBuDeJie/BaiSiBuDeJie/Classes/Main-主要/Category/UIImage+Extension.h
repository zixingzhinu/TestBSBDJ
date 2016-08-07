//
//  UIImage+Extension.h
//
//  Created by apple on 14-4-2.
//  Copyright (c) 2014年 apple. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIImage (Extension)
/**
 *  自由拉伸图片并保持图片不变形
 *
 */
+ (UIImage *)resizableImage:(NSString *)name;

/**
 *  打水印
 *
 *  @param bg   背景图片
 *  @param logo 右下角的水印图片
 */
+ (instancetype)waterImageWithBg:(NSString *)bg logo:(NSString *)logo;

/**
 *  图片裁剪,生成一个带圆环的图片
 *
 *  @param name        图片的名称
 *  @param borderWidth 圆环的宽度
 *  @param borderColor 圆环的颜色
 *
 */
+ (instancetype)circleImageWithName:(NSString *)name borderWidth:(CGFloat)borderWidth borderColor:(UIColor *)borderColor;

/**
 *  截屏
 *
 *  @param view 需要截屏的视图
 *
 */
+ (instancetype)imageWithCaptureView:(UIView *)view;

@end