//
//  Friends.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "Friends.h"

@implementation Friends
+(id)createFriend:(NSString *)aName time:(NSString *)aTime text:(NSString *)aText contentPicUrl:(NSString *)aContentPicUrl picUrl:(NSString *)aPicUrl reposts_count:(int)aReposts_count comments_count:(int)aComments_count attitudes_count:(int)aAttitudes_count textAge:(NSString *)aTextAge Id:(NSString *)aId
{
    
   Friends *friend= [[Friends alloc]init];
    friend.reposts_count=aReposts_count;
    friend.comments_count=aComments_count;
    friend.attitudes_count=aAttitudes_count;
    friend.textAge=aTextAge;
    friend.name=aName;
    friend.text=aText;
    friend.time=aTime;
    friend.contentPicUrl=aContentPicUrl;
    friend.picUrl=aPicUrl;
    friend.Id=aId;
    return friend;
}
+(id)createNewFriend:(NSString *)aName time:(NSString *)aTime text:(NSString *)aText picUrl:(NSString *)aPicUrl reposts_count:(int)aReposts_count comments_count:(int)aComments_count attitudes_count:(int)aAttitudes_count textAge:(NSString *)aTextAge repostPicUrls:(NSMutableArray *)aRepostPicUrls{

    Friends *friend= [[Friends alloc]init];
    friend.reposts_count=aReposts_count;
    friend.comments_count=aComments_count;
    friend.attitudes_count=aAttitudes_count;
    friend.textAge=aTextAge;
    friend.name=aName;
    friend.text=aText;
    friend.time=aTime;
    friend.picUrl=aPicUrl;
    friend.repostPicUrls=aRepostPicUrls;
    return friend;
}
@end
