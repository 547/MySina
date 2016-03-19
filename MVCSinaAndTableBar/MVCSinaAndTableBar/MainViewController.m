//
//  MainViewController.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "MainViewController.h"
#import "LoginOrNot.h"
#import "SinaLoginViewController.h"


#import "FriendsViewController.h"
#import "EditViewController.h"
@interface MainViewController ()

@end

@implementation MainViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
}
-(void)initUI
{
    
    
    
        FriendsViewController *friend=[[FriendsViewController alloc]init];
        friend.view.backgroundColor=[UIColor redColor];
    friend.tabBarItem.title=@"我的关注";
//        friend.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的关注" image:[UIImage imageNamed:@"1.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
        EditViewController *edit=[[EditViewController alloc]init];
        edit.view.backgroundColor=[UIColor blueColor];
    edit.tabBarItem.title=@"我的微博";
//        edit.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的微博" image:[UIImage imageNamed:@"2.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
        self.tabBar.items=@[friend,edit];
    
    //    UITabBarItem *itemFriend=[[UITabBarItem alloc]initWithTitle:@"我的关注" image:[UIImage imageNamed:@"1.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
    //
    //    UITabBarItem *itemEdit=[[UITabBarItem alloc]initWithTitle:@"我的微博" image:[UIImage imageNamed:@"2.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
    
    
}

-(void)viewDidAppear:(BOOL)animated
{
    if ([LoginOrNot isLogined]) {
        //已登录
        FriendsViewController *friend=[[FriendsViewController alloc]init];
        self.tabBarController.selectedViewController=friend;
        
//        [self initUI];
        NSLog(@"123");
        
    } else {
        //未登录
        SinaLoginViewController *login=[[SinaLoginViewController alloc]init];
        [self presentViewController:login animated:YES completion:nil];
        
    }
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
