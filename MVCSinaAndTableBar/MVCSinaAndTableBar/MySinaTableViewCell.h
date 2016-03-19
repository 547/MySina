//
//  MySinaTableViewCell.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/27.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyFrame.h"
#define nameFont [UIFont systemFontOfSize:14];//昵称字体大小
#define timeFont [UIFont systemFontOfSize:12];
#define contentFont [UIFont systemFontOfSize:16];//正文字体大小
#define repostTextFont [UIFont systemFontOfSize:14];
#define repostNameFont [UIFont systemFontOfSize:12];
@interface MySinaTableViewCell : UITableViewCell
@property(nonatomic,strong) MyFrame *myFrame;
//@property(nonatomic,strong) Friends *friends;
@property(nonatomic,strong) UIImageView *iconView;//头像
@property(nonatomic,strong) UILabel *nameLabel;//昵称
@property(nonatomic,strong) UILabel *timeLabel;//时间
@property(nonatomic,strong) UILabel *soureLabel;//来源
@property(nonatomic,strong) UIImageView *vipView;
@property(nonatomic,strong) UIImageView *repostView;//转发体视图
@property(nonatomic,strong) UILabel *contentLabel;//正文
@property(nonatomic,strong) UIImageView *contentImage;//正文配图
@property(nonatomic,strong) UILabel *repostNameLabel;//转发昵称

@property(nonatomic,strong) UILabel *repostTextLabel;//转发正文
@property(nonatomic,strong) UIImageView *repostImage;//转发配图
@property(nonatomic,strong) UIButton *SCButton;//收藏按钮
@property(nonatomic,strong) UIButton *ZFButton;//转发
@property(nonatomic,strong) UIButton *PLButton;//评论
@property(nonatomic,strong) UIButton *DZButton;//点赞
+(NSString *)ID;
-(void)setMyFrame:(MyFrame *)myFrame;
@end
