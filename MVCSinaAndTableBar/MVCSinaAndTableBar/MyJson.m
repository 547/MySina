//
//  MyJson.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "MyJson.h"
#import "ASIHTTPRequest.h"
#import "Friends.h"
@implementation MyJson
{
    NSMutableArray *friendsArray;
}
-(instancetype)init
{
    self=[super init];
    friendsArray=[[NSMutableArray alloc]init];
    return self;
}
-(NSMutableArray *)JsonRequest:(ASIHTTPRequest *)request
{
   NSDictionary *dic = [NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
//    NSLog(@"===%@",dic);
   NSArray *statusesArray= [dic objectForKey:@"statuses"];
    for (NSDictionary *dict in statusesArray) {
        NSString *time=[dict objectForKey:@"created_at"];
//        long long Id=(long long)[dict objectForKey:@"mid"];
        NSMutableArray *pic_urls=[dict objectForKey:@"pic_urls"];
        NSLog(@"++++++555______%@",pic_urls);
        NSString *Id=[dict objectForKey:@"idstr"];
        
//        NSLog(@"%@",Id);
        NSString *text=[dict objectForKey:@"text"];
        NSString *contentPicUrl=[dict objectForKey:@"bmiddle_pic"];
        NSDictionary *user=[dict objectForKey:@"user"];
        NSString *name=[user objectForKey:@"name"];
        NSString *picUrl=[user objectForKey:@"profile_image_url"];
        NSDictionary *retweeted_status=[dict objectForKey:@"retweeted_status"];
        NSString *text1=[retweeted_status objectForKey:@"text"];
        int reposts_count= (int)[retweeted_status objectForKey:@"reposts_count"];
        int comments_count=(int)[retweeted_status objectForKey:@"comments_count"];
        int attitudes_count=(int)[retweeted_status objectForKey:@"attitudes_count"];
//        NSString *source=[retweeted_status objectForKey:@"source"];
//        NSLog(@"retweeted_status+++++++++%@",source);
//        Friends *friend=[Friends createFriend:name time:time text:text contentPicUrl:contentPicUrl picUrl:picUrl reposts_count:reposts_count comments_count:comments_count attitudes_count:attitudes_count textAge:text1 Id:Id];
        Friends *friend=[Friends createNewFriend:name time:time text:text picUrl:picUrl reposts_count:reposts_count comments_count:comments_count attitudes_count:attitudes_count textAge:text1 repostPicUrls:pic_urls];
        [friendsArray addObject:friend];
    }
//    for (Friends *f in friendsArray) {
//        NSLog(@"===%@",f.time);
//    }
    return friendsArray;

}
@end
