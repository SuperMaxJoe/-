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
-(void)postRequestWithDictionary:(NSDictionary *)dict Finsh:(httpRequestSuc)finsh Fail:(httpRequestFail)fail Url:(NSString *)url Tag:(NSInteger)tag
{
    AFHTTPSessionManager *manager = [AFHTTPSessionManager manager];
    [manager POST:@"成功请求" parameters:dict progress:nil success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"cheng");
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
       NSLog( @"shi");
    }];
}



@end
