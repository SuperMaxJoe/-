//
//  PayForMainViewController.h
//  理财服务
//
//  Created by 展恒 on 15/12/22.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PayForMainViewController : UIViewController
@property (strong, nonatomic) IBOutlet UIWebView *mainWebView;
@property (strong, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic,copy)NSString *navTitle;

@end
