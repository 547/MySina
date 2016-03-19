//
//  MyJson.h
//  MVCSinaAndTableBar
//
//  Created by mac on 16/2/24.
//  Copyright © 2016年 Seven. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ASIHTTPRequest.h"
@interface MyJson : NSObject
-(NSMutableArray *)JsonRequest:(ASIHTTPRequest *)request;
@end
