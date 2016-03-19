//
//  Friends.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface Friends : NSObject
@property(nonatomic,assign)int reposts_count;
@property(nonatomic,assign)int comments_count;
@property(nonatomic,assign)int attitudes_count;
@property(nonatomic,copy)NSString *source;
@property(nonatomic,copy)NSString *textAge;
@property(nonatomic,assign)NSString *Id;
@property(nonatomic,copy)NSString *name;
@property(nonatomic,copy)NSString *repostName;
@property(nonatomic,copy)NSString *time;
@property(nonatomic,copy)NSString *text;
@property(nonatomic,copy)NSString *contentPicUrl;
@property(nonatomic,copy)NSString *picUrl;
@property(nonatomic,strong)NSArray *contentPicUrls;
@property(nonatomic,strong)NSArray *repostPicUrls;
+(id)createFriend:(NSString *)aName time:(NSString *)aTime text:(NSString *)aText contentPicUrl:(NSString *)aContentPicUrl picUrl:(NSString *)aPicUrl reposts_count:(int)aReposts_count comments_count:(int)aComments_count attitudes_count:(int)aAttitudes_count textAge:(NSString *)aTextAge Id:(NSString *)aId;
+(id)createNewFriend:(NSString *)aName time:(NSString *)aTime text:(NSString *)aText picUrl:(NSString *)aPicUrl reposts_count:(int)aReposts_count comments_count:(int)aComments_count attitudes_count:(int)aAttitudes_count textAge:(NSString *)aTextAge repostPicUrls:(NSMutableArray *)aRepostPicUrls;
@end
