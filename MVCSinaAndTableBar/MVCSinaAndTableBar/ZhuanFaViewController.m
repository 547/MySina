//
//  ZhuanFaViewController.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ZhuanFaViewController.h"
#import "Friends.h"
#import "NSString+More.h"
#import "HttpRequest.h"
//#include "FriendsViewController.h"
@interface ZhuanFaViewController ()<HttpRequestDelegate>

@end

@implementation ZhuanFaViewController
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
//    FriendsViewController *f=[[FriendsViewController alloc]init];
//    f.delegate=self;
    
    
    if (_friend.textAge==nil) {
        self.content.text=_friend.text;
    } else {
        self.content.text=[NSString stringWithFormat:@"%@\n原文：%@",_friend.text,_friend.textAge];
    }
    NSLog(@"%@",_friend.name);
    self.time.text=[NSString changeTime:_friend.time];
    [self.zhuanFa setTitle:[NSString stringWithFormat:@"转发 %d",_friend.reposts_count] forState:UIControlStateNormal];
    
    
    [self.pingLun setTitle:[NSString stringWithFormat:@"评论 %d",_friend.comments_count] forState:UIControlStateNormal];
    
    [self.dianZan setTitle:[NSString stringWithFormat:@"点赞 %d",_friend.attitudes_count] forState:UIControlStateNormal];
    
    
    
}
- (IBAction)shouCang:(UIButton *)sender {
}
- (IBAction)zhuanFaButton:(UIButton *)sender {
    
    httpRequest=[[HttpRequest alloc]init];
    
    [httpRequest repostWithId:self.friend.Id status:self.zhuanFaContent.text urlString:@"https://api.weibo.com/2/statuses/repost.json"];
    httpRequest.delegate=self;
    
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)nextButton:(UIButton *)sender {
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)httpRequestRepostFished:(ASIHTTPRequest *)request
{
    NSLog(@"====%@",request.responseString);

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
