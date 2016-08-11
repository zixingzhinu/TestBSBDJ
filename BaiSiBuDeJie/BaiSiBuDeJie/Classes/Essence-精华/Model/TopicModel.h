//
//  TopicModel.h
//  BaiSiBuDeJie
//
//  Created by James on 16/8/7.
//  Copyright © 2016年 James. All rights reserved.
//

#import <Foundation/Foundation.h>

typedef NS_ENUM(NSUInteger, TopicModelType) {
    TopicModelTypeAll = 1,  //全部
    TopicModelTypePicture = 10, //图片
    TopicModelTypeWord = 29,    //段子
    TopicModelTypeAudio = 31,   //音频
    TopicModelTypeVideo = 41,   //视频
};

@interface TopicModel : NSObject

/*
 {
	info = {
	maxid = 1470534241,
	vendor = hide.jie.c,
	count = 2000,
	maxtime = 1470534241,
	page = 100
 },
	list = [
 {
	cache_version = 2,
	created_at = 2016-08-07 17:32:01,
	id = 19583105,
	is_gif = 1,
	voicetime = 0,
	image2 = http://ww3.sinaimg.cn/bmiddle/c28796abjw1f6akcf1esag206o08w4qq.gif,
	voicelength = 0,
	top_cmt = [
 ],
	repost = 68,
	bimageuri = ,
	image1 = http://ww3.sinaimg.cn/large/c28796abjw1f6akcf1esag206o08w4qq.gif,
	text = 看看人家小萝莉打拳击，以后小学生的业务也不能随便接啦,
	theme_type = 0,
	hate = 37,
	image0 = http://ww3.sinaimg.cn/mw240/c28796abjw1f6akcf1esag206o08w4qq.gif,
	comment = 45,
	passtime = 2016-08-07 17:32:01,
	ding = 425,
	type = 10,
	tag = ,
	cdn_img = http://wimg.spriteapp.cn/ugc/2016/07/29/579a888fd0282.gif,
	theme_name = ,
	create_time = 2016-07-29 06:34:55,
	favourite = 39,
	themes = [
 ],
	name = 丁未,
	height = 320,
	status = 4,
	videotime = 0,
	bookmark = 39,
	cai = 37,
	screen_name = 丁未,
	profile_image = http://wimg.spriteapp.cn/profile/large/2016/05/22/5740d9fd3e43c_mini.jpg,
	love = 425,
	user_id = 17523284,
	theme_id = 0,
	original_pid = 0,
	gifFistFrame = http://wimg.spriteapp.cn/ugc/2016/07/29/579a888fd0282_a_1.jpg,
	t = 1470562321,
	weixin_url = http://c.f.zk111.com.cn/share/19583105.html?wx.qq.com&appname=,
	voiceuri = ,
	videouri = ,
	width = 240
 }]}
 */
/**
*  头像的图片url地址
*/
@property (copy, nonatomic) NSString *profile_image;
/**
 *  发帖人的昵称
 */
@property (copy, nonatomic) NSString *screen_name;
/**
 *  帖子的内容
 */
@property (copy, nonatomic) NSString *text;
/**
 *  系统审核通过后创建帖子的时间
 */
@property (copy, nonatomic) NSString *created_at;
@property (copy, nonatomic) NSString *ding;
/**
 *  踩的人数
 */
@property (copy, nonatomic) NSString *cai;
/**
 *  转发的数量
 */
@property (copy, nonatomic) NSString *repost;
/**
 *  帖子的被评论数量
 */
@property (copy, nonatomic) NSString *comment;
/**
 *  是否是新浪会员
 */
@property (assign, nonatomic) NSInteger sina_v;


@end
