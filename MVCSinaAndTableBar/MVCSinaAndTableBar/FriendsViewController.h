//
//  FriendsViewController.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friends.h"
@protocol FriendsViewControllerDelegate;
@interface FriendsViewController : UIViewController
@property(nonatomic,assign)id<FriendsViewControllerDelegate>delegate;
@property(nonatomic,assign)NSInteger tag;
@property(nonatomic,retain)NSMutableArray *tableArray;
@property(nonatomic,copy)void (^fristBlock)(NSInteger,NSMutableArray *array);

@end
@protocol FriendsViewControllerDelegate <NSObject>


-(void)getTagAndArray:(NSInteger)tag friend:(Friends *)friend;

@end