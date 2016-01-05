//
//  NetServiceManger.h
//  理财服务
//
//  Created by 展恒 on 16/1/5.
//  Copyright © 2016年 赵百川. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AFNetworking.h"
#import "UIKit+AFNetworking.h"
typedef void (^httpRequestSuc)(id data ,NSInteger tag);
typedef void (^httpRequestFail)(id errorMsg,NSInteger tag);
@interface NetServiceManger : NSObject
+(instancetype)shareNetServictManger;
-(void)postRequestWithDictionary:(NSDictionary *)dict
                           Finsh:(httpRequestSuc)finsh
                            Fail:(httpRequestFail)fail
                             Url:(NSString *)url
                             Tag:(NSInteger)tag;
-(void)dataGetRequestWithUrl:(NSString *)url
                       Finsh:(httpRequestSuc)finsh
                        Fail:(httpRequestFail)fail
                         Tag:(NSInteger)tag;
+(NSString *)getImageUrl:(NSString *)url;

@end
