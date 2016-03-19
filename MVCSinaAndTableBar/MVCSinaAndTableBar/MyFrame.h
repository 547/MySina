//
//  MyFrame.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/27.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Friends.h"
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#define interval 10//间距
#define profileWH 40 //头像宽高
#define nameFont [UIFont systemFontOfSize:14];//昵称字体大小
#define timeFont [UIFont systemFontOfSize:12];
#define contentFont [UIFont systemFontOfSize:16];
#define repostTextFont [UIFont systemFontOfSize:14];
#define repostNameFont [UIFont systemFontOfSize:12];
@interface MyFrame : NSObject
@property(nonatomic,readonly) CGRect profile; //头像
@property(nonatomic,readonly) CGRect name;//昵称
@property(nonatomic,readonly) CGRect time;//时间
@property(nonatomic,readonly) CGRect source;//来源
@property(nonatomic,readonly) CGRect contentText;//正文
@property(nonatomic,readonly) CGRect contentImage;//正文图片
@property(nonatomic,readonly) CGRect retweet;//转发体视图
@property(nonatomic,readonly) CGRect reName;//转发昵称
@property(nonatomic,readonly) CGRect reText;//转发正文
@property(nonatomic,readonly) CGRect reImage;//转发图片
@property(nonatomic,readonly) CGFloat cellHeight;//cell行高
@property(nonatomic,strong) Friends *friend;//数据模型

//-(instancetype)initWithFriend:(Friends *)friend;
@end
