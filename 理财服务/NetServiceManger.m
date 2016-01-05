//
//  NetServiceManger.m
//  理财服务
//
//  Created by 展恒 on 16/1/5.
//  Copyright © 2016年 赵百川. All rights reserved.
//

#import "NetServiceManger.h"

@implementation NetServiceManger
+(instancetype)shareNetServictManger
{
    static NetServiceManger *_intance;
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken,^{
        if (_intance == nil) {
            _intance = [[NetServiceManger alloc]init];
        }
    });
    return _intance;
}
-(void)showToastWithMessage:(NSString *)message showTime:(float)interval
{
    if (message.length < 1) {
        return;
    }
    
}



@end
