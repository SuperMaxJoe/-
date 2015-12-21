//
//  FinancialServiceViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/17.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "FinancialServiceViewController.h"
#import "FinancialServiceBannerCell.h"
#import "FinancialServiceContentCell.h"
#import "PayFormViewController.h"
#import "FundCombinationViewController.h"
@interface FinancialServiceViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (strong, nonatomic) IBOutlet UITableView *financialservice;
@property (strong, nonatomic)FinancialServiceBannerCell *bannerCell;
@property (strong, nonatomic)FinancialServiceContentCell *contentCell;

@end

@implementation FinancialServiceViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.financialservice.delegate = self;
    self.financialservice.dataSource = self;
    [self.financialservice registerNib:[UINib nibWithNibName:@"FinancialServiceBannerCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"bannerCell"];
    [self.financialservice registerNib:[UINib nibWithNibName:@"FinancialServiceContentCell" bundle:[NSBundle mainBundle]] forCellReuseIdentifier:@"contentCell"];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma DataSource
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
//    tableView.separatorStyle = UITableViewCellSeparatorStyleNone;
    if (indexPath.row == 0) {
        FinancialServiceBannerCell *bannerCell = [self.financialservice dequeueReusableCellWithIdentifier:@"bannerCell"];
        bannerCell.selectionStyle = UITableViewCellSelectionStyleNone;
        return bannerCell;
    }
    FinancialServiceContentCell *contentCell = [self.financialservice dequeueReusableCellWithIdentifier:@"contentCell"];
    contentCell.selectionStyle = UITableViewCellSelectionStyleNone;
    if (indexPath.row == 2) {
        contentCell.titleContentlabel.text = @"  管家通 专属高效资产管理服务";
        contentCell.showImportLabel.text = @"40.00%";
        contentCell.introduceLabel.text = @"今年以来平均收益";
        contentCell.showImport1Label.text = @"50万元";
        contentCell.introduce1Label.text = @"起投金额";
        contentCell.showImport2Label.text = @"1800元";
        contentCell.introduce2Label.text = @"会员费/年";
      
    }else if (indexPath.row == 3){
        contentCell.titleContentlabel.text = @"  点融通 您买基金我出钱";
        contentCell.showImportLabel.text = @"1-5万";
        contentCell.introduceLabel.text = @"投资本金";
        contentCell.showImport1Label.text = @"1-3倍";
        contentCell.introduce1Label.text = @"产品收益比";
        contentCell.showImport2Label.text = @"380";
        contentCell.introduce2Label.text = @"会员费";
    }
    return contentCell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    if (indexPath.row == 1) {
        PayFormViewController *payVC =[[PayFormViewController alloc]init];
        [self.navigationController pushViewController:payVC animated:YES];
//        [self presentViewController:payVC animated:YES completion:nil];
    }else if (indexPath.row == 2){
        FundCombinationViewController *FVC = [[FundCombinationViewController alloc]init];
        [self.navigationController pushViewController:FVC animated:YES];
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
    if (indexPath.row == 0) {
        return 125;
    }else{
        return 157;
    }
}
@end
