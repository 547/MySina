//
//  HttpRequest.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "HttpRequest.h"

@implementation HttpRequest
{
    

}
-(void)getTokenWitnCode:(NSString *)urlString code:(NSString *)code
{
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.tag=100;
    request.timeOutSeconds=30;
    request.delegate=self;
    [request addPostValue:@"3869885678" forKey:@"client_id"];
    [request addPostValue:@"df6f3306721ae1d0daf78c07a7bd6aa6" forKey:@"client_secret"];
    [request addPostValue:@"authorization_code" forKey:@"grant_type"];
    [request addPostValue:@"https://api.weibo.com/oauth2/default.html" forKey:@"redirect_uri"];
    [request addPostValue:code forKey:@"code"];
    [request startAsynchronous];
}
-(void)getFriendsWith:(NSString *)urlString
{
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.tag=101;
    request.timeOutSeconds=30;
    request.delegate=self;
    [request startAsynchronous];
}
-(void)getFriendsWithPage:(NSString *)urlString page:(int)page
{
    ASIHTTPRequest *request=[ASIHTTPRequest requestWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@?page=%d&access_token=%@",urlString,page,[[NSUserDefaults standardUserDefaults] stringForKey:@"access_token"]]]];
    request.tag=103;
    request.timeOutSeconds=30;
    request.delegate=self;
    [request startAsynchronous];
}

-(void)sentMessageWithContent:(NSString *)urlString content:(NSString *)content
{
    ASIFormDataRequest *request=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlString]];
    request.timeOutSeconds=20;
    request.delegate=self;
    request.tag=102;
    [request addPostValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"access_token"] forKey:@"access_token"];
    [request addPostValue:content forKey:@"status"];
    [request startAsynchronous];
}
-(void)repostWithId:(NSString *)Id status:(NSString *)status urlString:(NSString *)urlString
{
    
    ASIFormDataRequest *requestRepost=[ASIFormDataRequest requestWithURL:[NSURL URLWithString:urlString]];
    NSNumberFormatter *f=[[NSNumberFormatter alloc]init];
//    [requestRepost addPostValue:[f numberFromString:Id] forKey:@"id"];
 
//    [requestRepost addPostValue:[NSNumber numberWithLongLong:Id] forKey:@"id"];
    [requestRepost addPostValue:[[NSUserDefaults standardUserDefaults] stringForKey:@"access_token"]  forKey:@"access_token"];
    [requestRepost addPostValue:status forKey:@"status"];
    requestRepost.timeOutSeconds=30;
    requestRepost.tag=104;
    requestRepost.delegate=self;
    [requestRepost startAsynchronous];
//    [requestRepost setCompletionBlock:^{
//        NSLog(@"%@",[requestRepost responseString]);
//    }];
//    [requestRepost setFailedBlock:^{
//        NSLog(@"%@",[requestRepost error].userInfo);
//    }];
//    __weak HttpRequest *weakRequest=requestRepost;
    
}
-(void)requestFinished:(ASIHTTPRequest *)request
{
    if (request.tag==100) {
        [self.delegate httpRequestGetTokenFished:request];
    }
    if (request.tag==101) {
        [self.delegate httpRequestGetFriendsFished:request];
    }
    if (request.tag==102) {
        [self.delegate httpRequestSentFished:request];
    }
    if (request.tag==103) {
        [self.delegate httpRequestgetFriendsWithPageFished:request];
    }
    
    if (request.tag==104) {
        [self.delegate httpRequestRepostFished:request];
    }

}
-(void)requestFailed:(ASIHTTPRequest *)request
{
    if (request.tag==100) {
        [self.delegate httpRequestGetTokenFailed:request];
    }
    
    if (request.tag==101) {
        [self.delegate httpRequestGetFriendsFailed:request];
    }
    if (request.tag==102) {
        [self.delegate httpRequestSentFailed:request];
    }
    if (request.tag==103) {
        [self.delegate httpRequestgetFriendsWithPageFailed:request];
    }
    if (request.tag==104) {
        [self.delegate httpRequestRepostFailed:request];
    }
}
@end
