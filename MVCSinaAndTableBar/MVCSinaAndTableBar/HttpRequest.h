//
//  HttpRequest.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIFormDataRequest.h"
@protocol HttpRequestDelegate;
@interface HttpRequest : NSObject<ASIHTTPRequestDelegate>
@property(nonatomic,assign)id<HttpRequestDelegate>delegate;

-(void)repostWithId:(NSString *)Id status:(NSString *)status urlString:(NSString *)urlString;
-(void)getFriendsWithPage:(NSString *)urlString page:(int)page;
-(void)getTokenWitnCode:(NSString *)urlString code:(NSString *)code;
-(void)getFriendsWith:(NSString *)urlString;
-(void)sentMessageWithContent:(NSString *)urlString content:(NSString *)content;
@end
@protocol HttpRequestDelegate <NSObject>
-(void)httpRequestgetFriendsWithPageFished:(ASIHTTPRequest *)request;
-(void)httpRequestgetFriendsWithPageFailed:(ASIHTTPRequest *)request;
-(void)httpRequestSentFished:(ASIHTTPRequest *)request;
-(void)httpRequestSentFailed:(ASIHTTPRequest *)request;
-(void)httpRequestGetTokenFished:(ASIHTTPRequest *)request;
-(void)httpRequestGetTokenFailed:(ASIHTTPRequest *)request;
-(void)httpRequestGetFriendsFished:(ASIHTTPRequest *)request;
-(void)httpRequestGetFriendsFailed:(ASIHTTPRequest *)request;
-(void)httpRequestRepostFished:(ASIHTTPRequest *)request;
-(void)httpRequestRepostFailed:(ASIHTTPRequest *)request;
@end