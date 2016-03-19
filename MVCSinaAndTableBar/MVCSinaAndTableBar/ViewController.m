//
//  ViewController.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "ViewController.h"
#import "LoginOrNot.h"
#import "SinaLoginViewController.h"

#import "MainViewController.h"
@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    
}
-(void)initUI
{
    
    
//    UITabBar *tabBar=[[UITabBar alloc]initWithFrame:self.view.frame];
//    tabBar.frame=CGRectMake(0, self.view.frame.size.height-tabBar.frame.size.height, tabBar.frame.size.width, tabBar.frame.size.height);
//      [self.view addSubview:tabBar];
//    tabBar.backgroundColor=[UIColor redColor];
//    FriendsViewController *friend=[[FriendsViewController alloc]init];
//    friend.view.backgroundColor=[UIColor redColor];
//    friend.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的关注" image:[UIImage imageNamed:@"1.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
//    EditViewController *edit=[[EditViewController alloc]init];
//    edit.view.backgroundColor=[UIColor blueColor];
//    edit.tabBarItem=[[UITabBarItem alloc]initWithTitle:@"我的微博" image:[UIImage imageNamed:@"2.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
//    tabBar.items=@[friend,edit];
    
//    UITabBarItem *itemFriend=[[UITabBarItem alloc]initWithTitle:@"我的关注" image:[UIImage imageNamed:@"1.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
//    
//    UITabBarItem *itemEdit=[[UITabBarItem alloc]initWithTitle:@"我的微博" image:[UIImage imageNamed:@"2.jpg"] selectedImage:[UIImage imageNamed:@"3.jpg"]];
   
    
}
-(void)viewDidAppear:(BOOL)animated
{
    if ([LoginOrNot isLogined]) {
        //已登录
        MainViewController *main=[[MainViewController alloc]init];
        [self presentViewController:main animated:YES completion:nil];
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

@end
