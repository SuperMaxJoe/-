//
//  FundCombinationViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/18.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "FundCombinationViewController.h"

@interface FundCombinationViewController ()

@end

@implementation FundCombinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基金组合产品";
    XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@"基金组合产品"];
    XLFormSectionDescriptor * section;
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    
    //ProductName
    XLFormRowDescriptor *productName =[XLFormRowDescriptor formRowDescriptorWithTag:@"ProductName" rowType:XLFormRowDescriptorTypeInfo];
    productName.title  = @"产品名称";
    productName.value =@"指数王";
    [section addFormRow:productName];
    //BegainNumber
    XLFormRowDescriptor *begainNumber = [XLFormRowDescriptor formRowDescriptorWithTag:@"BegainNumber" rowType:XLFormRowDescriptorTypeInfo title:@"起投金额"];
    begainNumber.value = @"10000元";
    [section addFormRow:begainNumber];
    //BuyNumber
    XLFormRowDescriptor *buyNumber = [XLFormRowDescriptor formRowDescriptorWithTag:@"BuyNumber" rowType:XLFormRowDescriptorTypeInteger title:@"购买金额"];
    [buyNumber.cellConfigAtConfigure setObject:@"能购买10000元的整数倍" forKey:@"textField.placeholder"];
    [buyNumber.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [section addFormRow:buyNumber];
    
    // check
    [section addFormRow:[XLFormRowDescriptor formRowDescriptorWithTag:@"check" rowType:XLFormRowDescriptorTypeBooleanCheck title:@"已阅读并同意<<指数王服务协议>>"]];
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    //button
    XLFormRowDescriptor *sureBtn = [XLFormRowDescriptor formRowDescriptorWithTag:@"sureBtn" rowType:XLFormRowDescriptorTypeButton title:@"确认"];
//    [sureBtn.cellConfigAtConfigure setObject:@(UIControlEventTouchUpInside) forKey:@"ControlEvents"];
    [sureBtn.cellConfig setObject:[UIColor redColor] forKey:@"backgroundColor"];
    [sureBtn.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
    sureBtn.action.formSelector  = @selector(sureBtnAction);
    [section addFormRow:sureBtn];
    
    
    self.form = form;
}
- (void)sureBtnAction{
    NSLog(@"sure");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
