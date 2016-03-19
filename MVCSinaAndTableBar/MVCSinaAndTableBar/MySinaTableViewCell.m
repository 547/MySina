
//
//  MySinaTableViewCell.m===== 自定义cell
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/27.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "MySinaTableViewCell.h"
#import "UIImageView+WebCache.h"
#import "NSString+More.h"
@implementation MySinaTableViewCell

- (void)awakeFromNib {
    // Initialization code
    
}
#pragma mark===初始化单元格
-(id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self=[super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
//        NSLog(@"cellinit");
        //头像
        _iconView=[[UIImageView alloc]init];
       
        [self.contentView addSubview:_iconView];
        //昵称
        _nameLabel=[[UILabel alloc]init];
        _nameLabel.font=nameFont;
        [self.contentView addSubview:_nameLabel];
        //时间
        _timeLabel=[[UILabel alloc]init];
        _timeLabel.font=timeFont;
        [self.contentView addSubview:_timeLabel];
        //来源
        _soureLabel=[[UILabel alloc]init];
        _soureLabel.font=timeFont;
        [self.contentView addSubview:_soureLabel];
        //正文
        _contentLabel=[[UILabel alloc]init];
        _contentLabel.font=contentFont;
        _contentLabel.numberOfLines=0;
        [self.contentView addSubview:_contentLabel];
        //配图
        _contentImage=[[UIImageView alloc]init];
        _contentImage.contentMode=UIViewContentModeScaleAspectFit;
        [self.contentView addSubview:_contentImage];
        //转发体视图
        _repostView=[[UIImageView alloc]init];
        _repostView.layer.cornerRadius=6;
        _repostView.layer.masksToBounds=YES;
        _repostView.backgroundColor=[UIColor colorWithWhite:0.95 alpha:1];
        [self.contentView addSubview:_repostView];
        //转发体昵称
        _repostNameLabel=[[UILabel alloc]init];
        _repostNameLabel.font=repostNameFont;
        _repostNameLabel.backgroundColor=[UIColor clearColor];
        _repostNameLabel.textColor=[UIColor blueColor];
        [_repostView addSubview:_repostNameLabel];
        //转发体正文
        _repostTextLabel=[[UILabel alloc]init];
        _repostTextLabel.numberOfLines=0;
        _repostTextLabel.font=repostTextFont;
        _repostTextLabel.backgroundColor=[UIColor clearColor];
        [_repostView addSubview:_repostTextLabel];
        //转发体配图
        _repostImage=[[UIImageView alloc]init];
        _repostImage.contentMode=UIViewContentModeScaleAspectFit;
        [_repostView addSubview:_repostImage];
        
    }
  

    return self;
}
#pragma mask==设置单元格
-(void)setMyFrame:(MyFrame *)myFrame//重写set方法
{
//    NSLog(@"setMyFrame");
    _myFrame=myFrame;
//     NSLog(@"my");
    [self setCellView];//设置单元格内容
    [self setCellRealFrame];//设置单元格frame布局

}
#pragma mask===设置单元格内容
-(void)setCellView{
//     NSLog(@"setCellView");
//    Friends *friend=_myFrame.friend;
    //设置头像
    [_iconView setImageWithURL:[NSURL URLWithString:_myFrame.friend.picUrl] placeholderImage:[UIImage imageNamed:@"2.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    //设置昵称
    _nameLabel.text=_myFrame.friend.name;
    //设置时间
    _timeLabel.text=[NSString changeTime:_myFrame.friend.time];
    //设置来源
    _soureLabel.text=_myFrame.friend.source;
    //设置正文
    _contentLabel.numberOfLines=0;
    _contentLabel.text=_myFrame.friend.text;
    //设置配图
    if (_myFrame.friend.contentPicUrls.count) {//第一种情况：带有配图的微博
        _contentImage.hidden=NO;
        _repostView.hidden=YES;//影藏转发体视
        [_contentImage setImageWithURL:[NSURL URLWithString:_myFrame.friend.contentPicUrls[0][@"thumbnail_pic"]] placeholderImage:[UIImage imageNamed:@"1.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
    }else if (_myFrame.friend.textAge!=nil){//第二种情况：转发微博
        _contentImage.hidden=YES;
        _repostView.hidden=NO;
        //设置转发体昵称
        _repostNameLabel.text=[NSString stringWithFormat:@"原创：%@",_myFrame.friend.repostName];
    //设置转发体正文
        _repostTextLabel.numberOfLines=0;
        _repostTextLabel.text=_myFrame.friend.textAge;
        //设置转发体配图
        if (_myFrame.friend.repostPicUrls.count>0) {//第二种情况之转发体有配图
            _repostImage.hidden=NO;
            NSLog(@"+++58888878787+++++++%@",[_myFrame.friend.repostPicUrls[0]objectForKey:@"profile_image_url"]);
            [_repostImage setImageWithURL:[NSURL URLWithString:[_myFrame.friend.repostPicUrls[0]objectForKey:@"profile_image_url"]] placeholderImage:[UIImage imageNamed:@"1.png"] options:SDWebImageRetryFailed|SDWebImageLowPriority];
        }else{//第二种情况之转发体无配图
            _repostImage.hidden=YES;
        
        }
    
    }else{//不带图的微博
    
        _contentImage.hidden=YES;
        _repostView.hidden=YES;
    }

}
#pragma mask==设置单元格frame布局
-(void)setCellRealFrame{
//    NSLog(@"setCellRealFrame");
//设置头像的尺寸位置
    _iconView.frame=_myFrame.profile;
    _iconView.layer.cornerRadius=_myFrame.profile.size.height/2;
    _iconView.layer.masksToBounds=YES;
    //设置昵称的尺寸位置
    _nameLabel.frame=_myFrame.name;
    //设置时间的尺寸位置
    _timeLabel.frame=_myFrame.time;
    //设置来源的尺寸位置
    _soureLabel.frame=_myFrame.source;
    //设置正文的尺寸位置
    _contentLabel.frame=_myFrame.contentText;
    //设置正文配图的尺寸位置
    _contentImage.frame=_myFrame.contentImage;
    //设置转发体的尺寸位置
    _repostView.frame=_myFrame.retweet;
    //设置转发体昵称尺寸位置
    _repostNameLabel.frame=_myFrame.reName;
//设置转发体正文尺寸位置
    _repostTextLabel.frame=_myFrame.reText;
    //设置转发体图片尺寸位置
    _repostImage.frame=_myFrame.reImage;
    
}
#pragma mask==设置单元格的标识符
+(NSString *)ID
{
return @"cell";
}







- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
