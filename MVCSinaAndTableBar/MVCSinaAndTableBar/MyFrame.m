//
//  MyFrame.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/27.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "MyFrame.h"
#import "Friends.h"
@implementation MyFrame

-(void)setFriend:(Friends *)friend//重写set方法
{
//    NSLog(@"MyFrame");
    _friend=friend;
    CGSize screenSize=[UIScreen mainScreen].bounds.size;
    
    //1.设置头像的尺寸位置
    CGFloat profileX=interval;
    CGFloat profileY=interval;
    _profile =CGRectMake(profileX, profileX, profileWH, profileWH);
    
    //2.设置昵称的尺寸
    CGFloat nameX=CGRectGetMaxX(_profile)+interval;
    CGFloat nameY=profileY;
    CGSize nameSize=[friend.name sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
    _name =(CGRect){{nameX,nameY},nameSize};
    
    //3.设置时间的尺寸
    CGFloat timeX=nameX;
    CGSize timeSize=[friend.time sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    CGFloat timeY=profileWH-timeSize.height;
    _time=(CGRect){{timeX,timeY},timeSize};
    
    //4.设置来源的尺寸
    CGFloat sourceX=CGRectGetMaxX(_time)+interval;
    CGFloat sourceY=timeY;
    CGSize sourceSize=[friend.source sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
    _source=(CGRect){{sourceX,sourceY},sourceSize};
    
    
    //5.设置正文的尺寸
    CGFloat contentTextX=profileX;
    CGFloat contentTextY=MAX(CGRectGetMaxY(_profile), CGRectGetMaxY(_time)+interval);
    CGFloat contentTextWidth=screenSize.width-2*interval;
//    CGSize contentTextSize=[friend.text sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:16]}];
   CGSize contentTextSize = [friend.text sizeWithFont:[UIFont systemFontOfSize:16] constrainedToSize:CGSizeMake(contentTextWidth, MAXFLOAT) lineBreakMode:NSLineBreakByTruncatingTail];
    _contentText=(CGRect){{contentTextX,contentTextY},contentTextSize};
    
    
    if (_friend.contentPicUrls.count) {//第一种情况：带配图的weibo
        //6.设置配图的尺寸位置
        
        CGFloat contentImageX=profileX;
        CGFloat contentImageY=CGRectGetMaxY(_contentText)+interval;
        CGSize contentImageSize={100,100};
        _contentImage=(CGRect){{contentImageX,contentImageY},contentImageSize};
        
        //无转发，带图微博的单元格高度
        _cellHeight=CGRectGetMaxY(_contentImage)+interval;

    }else if (_friend.textAge!=nil){//第二种情况：转发的微博
        //7.设置转发体的尺寸
        
        CGFloat retweetX=profileX;
        CGFloat retweetY=CGRectGetMaxY(_contentText)+interval;
        CGFloat retweetW=screenSize.width-2*interval;
        CGFloat retweetH=interval;
        _retweet=(CGRect){retweetX,retweetY,retweetW,retweetH};
        //8.设置转发的昵称的尺寸
        
        CGFloat reNameX=interval;
        CGFloat reNameY=interval;
        CGSize reNameSize=[[NSString stringWithFormat:@"原创：%@",friend.repostName] sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:12]}];
        _reName=(CGRect){{reNameX,reNameY},reNameSize};
        
        //9.设置转发体正文的尺寸
        CGFloat reTextX=reNameX;
        CGFloat reTextY=CGRectGetMaxY(_reName)+interval;
        CGFloat reTextWidth=retweetW-2*reNameX;
//        CGSize reTextSize=[friend.textAge sizeWithAttributes:@{NSFontAttributeName:[UIFont systemFontOfSize:14]}];
        CGSize reTextSize=[friend.textAge sizeWithFont:[UIFont systemFontOfSize:14] constrainedToSize:CGSizeMake(reTextWidth, MAXFLOAT) lineBreakMode:NSLineBreakByTruncatingTail];
        _reText=(CGRect){{reTextX,reTextY},reTextSize};

        if (friend.repostPicUrls.count>0) {//第二种情况之转发体有配图
            CGFloat reImageX=reNameX;
            CGFloat reImageY=CGRectGetMaxY(_reText)+interval;
            CGSize reImageSize={100,100};
            _reImage=(CGRect){{reImageX,reImageY},reImageSize};
        }else{//第二种情况之转发体无配图
            retweetH =CGRectGetMaxY(_reText)+interval;
            _retweet=(CGRect){reTextX,retweetY,retweetW,retweetH};
        
        }
    //有转发体的微博
        _cellHeight=CGRectGetMaxY(_retweet)+interval;
    
    }else{//第三种情况：不带配图的微博
        //11.设置单元格高度尺寸位置
        //无配图，无转发体单元格的高度
        _cellHeight=CGRectGetMaxY(_contentText)+interval;

    }


}
@end
