//
//  ZhuanFaViewController.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Friends.h"
@interface ZhuanFaViewController : UIViewController
@property (weak, nonatomic) IBOutlet UILabel *content;
@property (weak, nonatomic) IBOutlet UILabel *time;
- (IBAction)shouCang:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UIButton *zhuanFa;
@property (weak, nonatomic) IBOutlet UIButton *pingLun;
@property (weak, nonatomic) IBOutlet UIButton *dianZan;
- (IBAction)zhuanFaButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *zhuanFaContent;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
- (IBAction)nextButton:(UIButton *)sender;
@property(nonatomic,assign)NSInteger tag;
@property(nonatomic,retain)Friends *friend;
@end
