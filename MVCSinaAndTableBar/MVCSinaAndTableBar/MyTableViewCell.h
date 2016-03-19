//
//  MyTableViewCell.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface MyTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImage;
@property (weak, nonatomic) IBOutlet UIImageView *image1;
@property (weak, nonatomic) IBOutlet UIImageView *image2;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UILabel *time;
@property (weak, nonatomic) IBOutlet UITextView *content;
@property (weak, nonatomic) IBOutlet UIImageView *contentPic;
@property (weak, nonatomic) IBOutlet UIImageView *contentPic1;
@property (weak, nonatomic) IBOutlet UIImageView *contentPic2;
@property (weak, nonatomic) IBOutlet UIButton *shouCang;
@property (weak, nonatomic) IBOutlet UIButton *zhuanFa;
@property (weak, nonatomic) IBOutlet UIButton *pingLun;
@property (weak, nonatomic) IBOutlet UIButton *dianZan;

@end
