//
//  FriendsViewController.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "FriendsViewController.h"
#import "HttpRequest.h"
#import "MyJson.h"
#import "MyTableViewCell.h"
#import "MySinaTableViewCell.h"
#import "SVPullToRefresh.h"
#import "UIImageView+WebCache.h"
#import "ZhuanFaViewController.h"
#import "PingLunViewController.h"
#import "MyFrame.h"
#import "UIScrollView+SVPullToRefresh.h"
@interface FriendsViewController ()<HttpRequestDelegate,UITableViewDataSource,UITableViewDelegate>

@end

@implementation FriendsViewController
{
    HttpRequest *httpRequest;
    HttpRequest *httpRequestBottom;
//    MyFrame *myFrame;
    UITableView *table;
    NSMutableArray *frameArray;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self initData];
    [self stupData];
    [self initUI];
}
-(void)stupData
{
    _tableArray=[NSMutableArray array];
}
-(void)initUI
{
    frameArray=[[NSMutableArray alloc]init];
    table=[[UITableView alloc]initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    table.separatorStyle=UITableViewCellSeparatorStyleNone;
    table.rowHeight=200;
//    [table registerNib:[UINib nibWithNibName:@"MyTableViewCell" bundle:nil] forCellReuseIdentifier:@"cell"];
//    [table registerClass:[MySinaTableViewCell class] forCellReuseIdentifier:[MySinaTableViewCell ID]];
    table.delegate=self;
    table.dataSource=self;
    [self.view addSubview:table];
    __weak FriendsViewController *weakSelf=self;
    
    [table addPullToRefreshWithActionHandler:^{
        [weakSelf refreshData];
    }];
    
    [table addInfiniteScrollingWithActionHandler:^{
        [weakSelf refreshDataAtBottom];
    }];
    
    
}
//上推加载更多
-(void)refreshDataAtBottom
{
     __weak FriendsViewController *weakSelf=self;
    static int page=1;
    httpRequestBottom=[[HttpRequest alloc]init];
    page+=1;
    [httpRequestBottom getFriendsWithPage:@"https://api.weibo.com/2/statuses/home_timeline.json" page:page];
    NSLog(@"page====%d",page);
    httpRequestBottom.delegate=self;
    [weakSelf performSelector:@selector(stopRefreshAtBottom) withObject:nil afterDelay:2];
}
-(void)httpRequestgetFriendsWithPageFished:(ASIHTTPRequest *)request
{
    MyJson *js=[[MyJson alloc]init];
    NSMutableArray *a=[js JsonRequest:request];
    [_tableArray addObjectsFromArray:a];
//    [table insertRowsAtIndexPaths:@[[NSIndexPath indexPathForRow:tableArray.count-1 inSection:0]] withRowAnimation:UITableViewRowAnimationTop];
//    [table endUpdates];
    for (Friends *f in _tableArray) {
        MyFrame *fr=[[MyFrame alloc]init];
        fr.friend=f;
        [frameArray addObject:fr];
        
//        NSLog(@"=====%@",f.name);
    }
    [table reloadData];
}
-(void)stopRefreshAtBottom
{
    [table.infiniteScrollingView stopAnimating];
}
//下拉刷新
-(void)refreshData
{
    __weak FriendsViewController *weakSelf=self;
    [weakSelf initData];
    
    [weakSelf performSelector:@selector(stopRefresh) withObject:nil afterDelay:2];
}
-(void)stopRefresh
{
//    __weak FriendsViewController *weakSelf=self;
    [table.pullToRefreshView stopAnimating];
}
-(void)initData
{
   
    httpRequest=[[HttpRequest alloc]init];
    [httpRequest getFriendsWith:[NSString stringWithFormat:@"https://api.weibo.com/2/statuses/home_timeline.json?access_token=%@", [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"]]];
    httpRequest.delegate=self;
}

-(void)httpRequestGetFriendsFished:(ASIHTTPRequest *)request
{
    
    MyJson *js=[[MyJson alloc]init];
   _tableArray = [js JsonRequest:request];
    for (Friends *fr in [js JsonRequest:request]) {
        MyFrame *fra=[[MyFrame alloc]init];
        fra.friend=fr;
        [frameArray addObject:fra];
    }
//    [tableArray addObjectsFromArray:[js JsonRequest:request]];
 
    [table reloadData];
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"heightForRow");

//    return 300;
    MyFrame *fr=[frameArray objectAtIndex:indexPath.row];
    return fr.cellHeight;
    
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{

    return _tableArray.count;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    NSLog(@"cellForRow");
    MySinaTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:[MySinaTableViewCell ID]];
//        MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell"];
    if (cell==nil) {
        cell=[[MySinaTableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:[MySinaTableViewCell ID]];
//        NSLog(@"554545454909090");
    }
    cell.selectionStyle=UITableViewCellSelectionStyleNone;
    cell.myFrame=[frameArray objectAtIndex:indexPath.row];
    
//    NSLog(@"909090==%@",cell.contentImage);

    
//    MyTableViewCell *cell=[tableView dequeueReusableCellWithIdentifier:@"cell" forIndexPath:indexPath];
//    Friends *friend=[_tableArray objectAtIndex:indexPath.row];
//        cell.name.text=friend.name;
//    [cell.picImage setImageWithURL:[NSURL URLWithString:friend.picUrl] placeholderImage:nil];
//    cell.picImage.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:friend.picUrl]]];
//    cell.time.text=[self changeTime:friend.time];
////    cell.content.numberOfLines=0;
//    if (friend.textAge==nil) {
//        cell.content.text=friend.text;
//    } else {
//        cell.content.text=[NSString stringWithFormat:@"%@\n原文：%@",friend.text,friend.textAge];
//    }
//    
//    [cell.contentPic setImageWithURL:[NSURL URLWithString:friend.contentPicUrl] placeholderImage:nil];
//    cell.shouCang.tag=indexPath.row;
//    [cell.shouCang addTarget:self action:@selector(shouCang:) forControlEvents:UIControlEventTouchUpInside];
//    cell.zhuanFa.tag=indexPath.row;
//    [cell.zhuanFa setTitle:[NSString stringWithFormat:@"转发 %d",friend.reposts_count] forState:UIControlStateNormal];
//    [cell.zhuanFa addTarget:self action:@selector(zhuanFa:) forControlEvents:UIControlEventTouchUpInside];
//    cell.pingLun.tag=indexPath.row;
//    [cell.pingLun setTitle:[NSString stringWithFormat:@"评论 %d",friend.comments_count] forState:UIControlStateNormal];
//    [cell.pingLun addTarget:self action:@selector(pingLun:) forControlEvents:UIControlEventTouchUpInside];
//    cell.dianZan.tag=indexPath.row;
//    [cell.dianZan setTitle:[NSString stringWithFormat:@"点赞 %d",friend.attitudes_count] forState:UIControlStateNormal];
//    [cell.dianZan addTarget:self action:@selector(dianZan:) forControlEvents:UIControlEventTouchUpInside];
//    cell.contentPic.image=[UIImage imageWithData:[NSData dataWithContentsOfURL:[NSURL URLWithString:friend.contentPicUrl]]];
    return cell;
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    
    [tableView deselectRowAtIndexPath:indexPath animated:NO];
}
-(void)dianZan:(UIButton *)dianZan
{

}
-(void)pingLun:(UIButton *)pingLun
{
    PingLunViewController *pL=[[PingLunViewController alloc]init];
    [self presentViewController:pL animated:YES completion:nil];
}
-(void)zhuanFa:(UIButton *)zhuanFa
{
    NSLog(@"====%ld",(long)zhuanFa.tag);
    self.tag=zhuanFa.tag;
    ZhuanFaViewController *zF=[[ZhuanFaViewController alloc]init];
    Friends *friend=[_tableArray objectAtIndex:zhuanFa.tag];
    zF.tag=zhuanFa.tag;
    zF.friend=friend;
    
    NSLog(@"====%@",friend.name);
//    [self.delegate getTagAndArray:zhuanFa.tag friend:friend];
    //    self.fristBlock(zhuanFa.tag,[_tableArray copy]);
//    Friends *fr=[_tableArray objectAtIndex:zhuanFa.tag];
//     NSLog(@"====%@",fr.name);
   
//    [self presentViewController:zF animated:YES completion:nil];
    
    [self presentViewController:zF animated:YES completion:^{
        nil;
    }];
}
-(void)shouCang:(UIButton *)shouCang
{
    
}
-(NSString *)changeTime:(NSString *)timeString
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *date=[formatter dateFromString:timeString];
    
    NSDateFormatter *new=[[NSDateFormatter alloc]init];
    new.dateFormat=@"MM月dd日 HH:mm:ss";
   return [new stringFromDate:date];
}
-(void)viewDidAppear:(BOOL)animated
{

    [table triggerPullToRefresh];//自动刷新一次==trigger==触发

    [table setContentOffset:CGPointMake(0, 0) animated:YES];//自动回到顶部
 //   table.contentOffset=CGPointMake(0, 0);//自动回到顶部
    table.scrollsToTop=YES;//点击状态栏就可以回到顶部
}
-(void)viewWillAppear:(BOOL)animated
{
//    table.scrollsToTop=YES;
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
