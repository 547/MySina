//
//  EditViewController.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "EditViewController.h"
#import "HttpRequest.h"
@interface EditViewController ()<HttpRequestDelegate>

@end

@implementation EditViewController
{
    HttpRequest *httpRequest;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}
-(void)initUI
{
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
- (IBAction)sentButton:(UIButton *)sender {
//    httpRequest=[[HttpRequest alloc]init];
//    [httpRequest sentMessageWithContent:@"https://api.weibo.com/2/statuses/update.json" content:self.text.text];
//    httpRequest.delegate=self;
    
}
-(void)httpRequestSentFished:(ASIHTTPRequest *)request
{
    
    
   NSRange range= [request.responseString rangeOfString:@"created_at"];
    if (range.length>0) {
        NSLog(@"发送成功 ======%@",request.responseString);
        self.tiShi.text=@"微博发布成功";
        self.myText.text=@"";
        [self performSelector:@selector(xiaoShi) withObject:nil afterDelay:3];
    }
}
-(void)xiaoShi
{
    self.tiShi.text=@"";
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (IBAction)myButton:(UIButton *)sender {
    
        httpRequest=[[HttpRequest alloc]init];
        [httpRequest sentMessageWithContent:@"https://api.weibo.com/2/statuses/update.json" content:self.myText.text];
        httpRequest.delegate=self;
    
}
@end
