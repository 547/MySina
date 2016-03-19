//
//  SinaLoginViewController.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "SinaLoginViewController.h"
#import "HttpRequest.h"
#import "FriendsViewController.h"
@interface SinaLoginViewController ()<UIWebViewDelegate,HttpRequestDelegate>

@end

@implementation SinaLoginViewController

{
    HttpRequest *httpRequest;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
}
-(void)initUI
{
    UIWebView *web=[[UIWebView alloc]initWithFrame:self.view.bounds];
    web.scalesPageToFit=YES;
    [self.view addSubview:web];
    [web loadRequest:[NSURLRequest requestWithURL:[NSURL URLWithString:@"https://api.weibo.com/oauth2/authorize?client_id=3869885678&response_type=code&redirect_uri=https://api.weibo.com/oauth2/default.html"]]];
    web.delegate=self;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{
   NSRange range= [request.URL.absoluteString rangeOfString:@"code"];
    if (range.length>0) {
       NSString *code = [[request.URL.absoluteString componentsSeparatedByString:@"="]lastObject];
        httpRequest=[[HttpRequest alloc]init];
        [httpRequest getTokenWitnCode:@"https://api.weibo.com/oauth2/access_token" code:code];
        httpRequest.delegate=self;
    }
    
    return YES;
}
-(void)httpRequestGetTokenFished:(ASIHTTPRequest *)request
{
    NSDictionary *dic=[NSJSONSerialization JSONObjectWithData:request.responseData options:NSJSONReadingAllowFragments error:nil];
   NSDate *access_token= [dic objectForKey:@"access_token"];
   NSString *expires_in= [dic objectForKey:@"expires_in"];
  NSDate *date = [NSDate dateWithTimeIntervalSinceNow:[expires_in doubleValue]];
    [[NSUserDefaults standardUserDefaults]setObject:access_token forKey:@"access_token"];
    
    [[NSUserDefaults standardUserDefaults]setObject:date forKey:@"date"];
    if (access_token) {
        [self goToFriendsViewController];//成功获取到access_token、expires_in后进入主页面
    }

    
}
//进入主页面
-(void)goToFriendsViewController
{
    [self dismissViewControllerAnimated:YES completion:nil];
    FriendsViewController *friend=[[FriendsViewController alloc]init];
    [self presentViewController:friend animated:YES completion:nil];
    NSLog(@"123");
}




- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
