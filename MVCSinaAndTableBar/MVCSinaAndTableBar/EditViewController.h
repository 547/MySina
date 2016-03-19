//
//  EditViewController.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface EditViewController : UIViewController
@property (weak, nonatomic) IBOutlet UITextView *text;

- (IBAction)sentButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UITextView *myText;
- (IBAction)myButton:(UIButton *)sender;
@property (weak, nonatomic) IBOutlet UILabel *tiShi;

@end
