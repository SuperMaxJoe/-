//
//  BorrowProgramViewController.h
//  理财服务
//
//  Created by 展恒 on 15/12/28.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import <XLForm/XLForm.h>

@interface BorrowProgramViewController : XLFormViewController
@property (nonatomic,retain)NSArray *bankNo;
@property (nonatomic,copy)NSString *bankName;
@property (nonatomic,copy)NSString *dailyLimit;
@property (nonatomic,copy)NSString *singleLimit;
@end
