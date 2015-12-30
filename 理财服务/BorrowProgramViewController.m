//
//  BorrowProgramViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/28.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "BorrowProgramViewController.h"
NSString *const kProductNameBorrow = @"ProductNameBorrow";
NSString *const kMoneyNumber = @"MoneyNumber";
NSString *const kBankCard = @"BankCard";
@interface BorrowProgramViewController ()

@end

@implementation BorrowProgramViewController

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
    XLFormSectionDescriptor *section = [XLFormSectionDescriptor formSectionWithTitle:@"申请借款需缴纳与投资本金等额的保证金"];
    [form addFormSection:section];
    //产品名称
    XLFormRowDescriptor *productNameBorrow = [XLFormRowDescriptor formRowDescriptorWithTag:kProductNameBorrow rowType:XLFormRowDescriptorTypeInfo title:@"产品名称"];
    productNameBorrow.value = @"借款保证金";
    [section addFormRow:productNameBorrow];
    //产品金额
    XLFormRowDescriptor *moneyNumber = [XLFormRowDescriptor formRowDescriptorWithTag:kMoneyNumber rowType:XLFormRowDescriptorTypeInfo title:@"产品金额"];
    moneyNumber.value = @"10000元";
    [section addFormRow:moneyNumber];
    //银行卡
    if (self.bankNo != nil) {
        XLFormRowDescriptor *bankCard = [XLFormRowDescriptor formRowDescriptorWithTag:kBankCard rowType:XLFormRowDescriptorTypeSelectorPush];
        NSDictionary *bankDict = @{@"0102":@"工商银行",@"0103":@"农业银行",@"0104":@"中国银行",@"0105":@"建设银行",@"0403":@"邮政储蓄银行",@"0307":@"平安银行",@"0305":@"民生银行",@"0303":@"光大银行",@"0306":@"广发银行",@"0302":@"中信银行",@"0309":@"兴业银行",@"0304":@"华夏银行",@"0301":@"交通银行",@"0308":@"招商银行",@"0310":@"浦发银行"};
        NSString *bankNO = [self.bankNo[0] substringFromIndex:15];
        NSString *title = [bankDict[self.bankName] stringByAppendingFormat:@"(尾号%@)",bankNO];
        bankCard.title = title;
        [bankCard.cellConfig setObject:[UIFont fontWithName:@"Helvetica" size:15] forKey:@"textLabel.font"];
        NSString *value = [NSString stringWithFormat:@"单笔限额%@元,单日限额%@元",self.dailyLimit,self.singleLimit];
        bankCard.value = value;
        //       [bankCard.cellConfig setObject:[UIFont fontWithName:@"Helvetica" size:15] forKey:@"textLabel.font"];
        [bankCard.cellConfig setValue:[UIFont fontWithName:@"Helvetica" size:15] forKey:@"textLabel.font"];
        
        [section addFormRow:bankCard];
        XLFormRowDescriptor *bankAdd = [XLFormRowDescriptor formRowDescriptorWithTag:@"BankAdd" rowType:XLFormRowDescriptorTypeButton title:@"添加银行卡"];
        bankAdd.action.formSelector = @selector(bankCardAction:);
        [section addFormRow:bankAdd];
    }else{
        XLFormRowDescriptor *bankCard = [XLFormRowDescriptor formRowDescriptorWithTag:kBankCard rowType:XLFormRowDescriptorTypeInfo];
        bankCard.title = @"银行卡(未绑定)";
        [bankCard.cellConfig setObject:[UIFont fontWithName:@"Helvetica" size:15] forKey:@"textLabel.font"];
        bankCard.value = @"点击绑定银行卡";
        bankCard.action.formSelector = @selector(bankCardAction:);
        [section addFormRow:bankCard];
    }
    
    
    //button
    XLFormSectionDescriptor *buttonSection = [XLFormSectionDescriptor formSection];
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
    [self deselectFormRow:sender];
}
- (void)bankCardAction:(XLFormRowDescriptor *)sender
{
    [self deselectFormRow:sender];
    
}
- (void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue
{
    [super formRowDescriptorValueHasChanged:formRow oldValue:oldValue newValue:newValue];
  

}


@end
