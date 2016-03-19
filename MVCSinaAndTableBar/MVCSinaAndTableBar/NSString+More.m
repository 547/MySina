//
//  NSString+More.m
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/26.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import "NSString+More.h"

@implementation NSString (More)
+(NSString *)changeTime:(NSString *)timeString
{
    NSDateFormatter *formatter=[[NSDateFormatter alloc]init];
    formatter.dateFormat=@"EEE MMM dd HH:mm:ss Z yyyy";
    NSDate *date=[formatter dateFromString:timeString];
    
    NSDateFormatter *new=[[NSDateFormatter alloc]init];
    new.dateFormat=@"MM月dd日 HH:mm:ss";
    return [new stringFromDate:date];
}
@end
