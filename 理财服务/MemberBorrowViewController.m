//
//  MemberBorrowViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/28.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "MemberBorrowViewController.h"
#import "BorrowProgramViewController.h"
NSString *const kPrincipal = @"Principal";
NSString *const kProportion = @"Proportion";
NSString *const kDeadline =@"Deadline";
NSString *const kServiceMoney = @"ServiceMoney";
NSString *const kInterest = @"Interest";
NSString *const kWarnline = @"Warnline";
NSString *const kStopline = @"Stopline";
@interface MemberBorrowViewController ()

@end

@implementation MemberBorrowViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeForm];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)initializeForm
{
    XLFormDescriptor *form = [XLFormDescriptor formDescriptor];
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    //借款方案
    section.title = @"借款方案";
    XLFormRowDescriptor *principal = [XLFormRowDescriptor formRowDescriptorWithTag:kPrincipal rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"投资本金"];
    principal.selectorOptions = @[@"1万",@"2万",@"3万",@"4万",@"5万",
                                  ];
    principal.value = @"1万";
    [section addFormRow:principal];
    //借款比例
    XLFormRowDescriptor *proportion = [XLFormRowDescriptor formRowDescriptorWithTag:kProportion rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"借款比例"];
    proportion.selectorOptions = @[@"1:1",@"1:2",@"1:3"];
    proportion.value = @"1:1";
    [section addFormRow:proportion];
    //借款期限
    XLFormRowDescriptor *deadline = [XLFormRowDescriptor formRowDescriptorWithTag:kDeadline rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"借款期限"];
    deadline.selectorOptions = @[@"3个月",@"6个月"];
    deadline.value = deadline.selectorOptions[0];
    [section addFormRow:deadline];
    //服务费在服务前扣除,利息在服务结束后扣除
    XLFormSectionDescriptor *nSection = [XLFormSectionDescriptor formSection];
    nSection.title = @"服务费在服务前扣除,利息在服务结束后扣除";
    [form addFormSection:nSection];
    //服务费
    XLFormRowDescriptor *serviceMoney = [XLFormRowDescriptor formRowDescriptorWithTag:kServiceMoney rowType:XLFormRowDescriptorTypeInfo title:@"服务费"];
    serviceMoney.value = @"1.5%";
    [nSection addFormRow:serviceMoney];
    //利息
    XLFormRowDescriptor *interest = [XLFormRowDescriptor formRowDescriptorWithTag:kInterest rowType:XLFormRowDescriptorTypeInfo title:@"利息"];
    interest.value = @"年化6.8%";
    [nSection addFormRow:interest];
    //警戒线
    XLFormRowDescriptor *warnline = [XLFormRowDescriptor formRowDescriptorWithTag:kWarnline rowType:XLFormRowDescriptorTypeInfo title:@"警戒线"];
    warnline.value = @"配资金额*1.2";
    [nSection addFormRow:warnline];
    //止损线
    XLFormRowDescriptor *stopline = [XLFormRowDescriptor formRowDescriptorWithTag:kStopline rowType:XLFormRowDescriptorTypeInfo title:@"止损线"];
    stopline.value = @"配资金额*1.12";
    [nSection addFormRow:stopline];
    
    //button
    XLFormSectionDescriptor *buttonSection =[XLFormSectionDescriptor formSection];
    [form addFormSection:buttonSection];
    XLFormRowDescriptor *payButton = [XLFormRowDescriptor formRowDescriptorWithTag:@"PayButton" rowType:XLFormRowDescriptorTypeButton title:@"支付"];
    [payButton.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
    [payButton.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"backgroundColor"];
    payButton.action.formSelector = @selector(PayAction:);
    [buttonSection addFormRow:payButton];
    
    
    
    self.form = form;
}
- (void)PayAction:(XLFormRowDescriptor *)sender
{
    BorrowProgramViewController *borrow = [[BorrowProgramViewController alloc]init];
    [self.navigationController pushViewController:borrow animated:YES];
    [self deselectFormRow:sender];
}
@end
