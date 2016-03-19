//
//  AppDelegate.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "AppDelegate.h"
#import "MainViewController.h"
#import "FriendsViewController.h"
#import "EditViewController.h"
@interface AppDelegate ()

@end

@implementation AppDelegate


- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    // Override point for customization after application launch.
    FriendsViewController *friend=[[FriendsViewController alloc]init];
//    friend.view.backgroundColor=[UIColor redColor];
    friend.tabBarItem.title=@"我的关注";
//    friend.tabBarItem.image=[UIImage imageNamed:@"1.jpg"];
//    friend.tabBarItem.selectedImage=[UIImage imageNamed:@"3.jpg"];
    EditViewController *edit=[[EditViewController alloc]init];
//    edit.view.backgroundColor=[UIColor blueColor];
    edit.tabBarItem.title=@"我的微博";
//    edit.tabBarItem.image=[UIImage imageNamed:@"2.jpg"];
//    edit.tabBarItem.selectedImage=[UIImage imageNamed:@"3.jpg"];

    MainViewController *main=[[MainViewController alloc]init];
    main.viewControllers=@[friend,edit];
    self.window.rootViewController=main;
    [self.window makeKeyAndVisible];
    return YES;
}

- (void)applicationWillResignActive:(UIApplication *)application {
    // Sent when the application is about to move from active to inactive state. This can occur for certain types of temporary interruptions (such as an incoming phone call or SMS message) or when the user quits the application and it begins the transition to the background state.
    // Use this method to pause ongoing tasks, disable timers, and throttle down OpenGL ES frame rates. Games should use this method to pause the game.
}

- (void)applicationDidEnterBackground:(UIApplication *)application {
    // Use this method to release shared resources, save user data, invalidate timers, and store enough application state information to restore your application to its current state in case it is terminated later.
    // If your application supports background execution, this method is called instead of applicationWillTerminate: when the user quits.
}

- (void)applicationWillEnterForeground:(UIApplication *)application {
    // Called as part of the transition from the background to the inactive state; here you can undo many of the changes made on entering the background.
}

- (void)applicationDidBecomeActive:(UIApplication *)application {
    // Restart any tasks that were paused (or not yet started) while the application was inactive. If the application was previously in the background, optionally refresh the user interface.
}

- (void)applicationWillTerminate:(UIApplication *)application {
    // Called when the application is about to terminate. Save data if appropriate. See also applicationDidEnterBackground:.
}

@end
