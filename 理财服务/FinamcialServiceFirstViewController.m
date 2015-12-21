//
//  FinamcialServiceFirstViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/21.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "FinamcialServiceFirstViewController.h"
#import "FinamcialserviceFirstTableViewCell.h"
#import "FinancialServiceViewController.h"

@interface FinamcialServiceFirstViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (strong, nonatomic) IBOutlet UITableView *finamcialTableView;
@property (strong, nonatomic)FinamcialserviceFirstTableViewCell *finamcialCell;
@property (nonatomic,copy)NSString *imgNameString;
@end

@implementation FinamcialServiceFirstViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"展恒理财";
    self.finamcialTableView.delegate = self;
    self.finamcialTableView.dataSource = self;
    [self.finamcialTableView registerNib:[UINib nibWithNibName:@"FinamcialserviceFirstTableViewCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"bannerCell"];
}
#pragma DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    FinamcialserviceFirstTableViewCell *bannerCell = [self.finamcialTableView dequeueReusableCellWithIdentifier:@"bannerCell"];
    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    bannerCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 1) {
        
        bannerCell.firstImageView.image = [UIImage imageNamed:@"first_img_banner2.png"];
        bannerCell.fitstLabel.text = @"固收理财";
        bannerCell.contentLabel.text = @"保本保息高收益8%轻松打败银行理财";
        return bannerCell;
    }else if (indexPath.row == 2){
        bannerCell.firstImageView.image = [UIImage imageNamed:@"first_img_banner3.png"];
        bannerCell.fitstLabel.text = @"基金组和产品";
        bannerCell.contentLabel.text = @"精品策略大集结百元起头优享高收益";
        return bannerCell;
    }else if (indexPath.row == 3){
        bannerCell.firstImageView.image = [UIImage imageNamed:@"first_img_banner4.png"];
        bannerCell.fitstLabel.text = @"10万享高端理财";
        bannerCell.contentLabel.text = @"FOF基金&定增产品10万起投";
        return bannerCell;
    }
    return bannerCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    if (indexPath.row == 0) {
        FinancialServiceViewController *financialservice = [[FinancialServiceViewController alloc]init];
        self.imgNameString = @"img_banner1.jpg";
        financialservice.myImage = self.imgNameString;
        [self.navigationController pushViewController:financialservice animated:YES];
    } else if(indexPath.row == 1){
        FinancialServiceViewController *financialservice = [[FinancialServiceViewController alloc]init];
        
        self.imgNameString = @"img_banner2.jpg";
        financialservice.myImage = self.imgNameString;
        [self.navigationController pushViewController:financialservice animated:YES];
    }else if(indexPath.row == 2){
        FinancialServiceViewController *financialservice = [[FinancialServiceViewController alloc]init];
        self.imgNameString = @"img_banner3.jpg";
        financialservice.myImage = self.imgNameString;
        [self.navigationController pushViewController:financialservice animated:YES];
    }else {
        FinancialServiceViewController *financialservice = [[FinancialServiceViewController alloc]init];
        self.imgNameString = @"img_banner4.jpg";
        financialservice.myImage = self.imgNameString;
        [self.navigationController pushViewController:financialservice animated:YES];
    }
    
}

#pragma delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 4;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
    
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 142;
}

-(void)requestData
{
//    NSString *url =@"http://10.20.25.240:8080/accountProduct/verificationFirst";
}
@end
