//
//  LoginOrNot.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "LoginOrNot.h"

@implementation LoginOrNot
+(BOOL)isLogined
{
   NSString *access_token= [[NSUserDefaults standardUserDefaults]objectForKey:@"access_token"];
   NSDate *date = [[NSUserDefaults standardUserDefaults]objectForKey:@"date"];
    NSDate *now=[NSDate date];
    if (access_token==nil) {
        return NO;
    } else {
        if ([now compare:date]==NSOrderedAscending) {
            return YES;
        }else
        {
        return NO;
        }
    }
    
}
@end
