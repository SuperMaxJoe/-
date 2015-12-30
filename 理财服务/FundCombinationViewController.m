//
//  FundCombinationViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/18.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "FundCombinationViewController.h"
#import "XLFormCheckCell.h"
#import "MemberBorrowViewController.h"
NSString *const kProductName = @"ProductName";
NSString *const kBegainNumber = @"BegainNumber";
NSString *const kBuyNumber = @"BuyNumber";
NSString *const kCheck = @"check";
NSString *const kSureBtn = @"sureBtn";
NSString *const kBuyProductName = @"ProductName";
NSString *const kProductMoney = @"ProductMoney";
NSString *const kCoupon = @"Coupon";
NSString *const kBindCard = @"BindCard";
//NSString *const kOnlinePay = @"OnlinePay";
//NSString *const kMemberCard = @"MemberCard";
NSString *const kPayType = @"PayType";
NSString *const kArrguement = @"Arrguement";
NSString *const kArrguementChick = @"ArrguementChick";
NSString *const kPayButton = @"PayButton";
@interface FundCombinationViewController ()

@end

@implementation FundCombinationViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"基金组合产品";
//    [self initializeForm];
    [self initForm];
}
- (void)initializeForm
{
    XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@"基金组合产品"];
    XLFormSectionDescriptor * section;
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    
    //ProductName
    XLFormRowDescriptor *productName =[XLFormRowDescriptor formRowDescriptorWithTag:kProductName rowType:XLFormRowDescriptorTypeInfo];
    productName.title  = @"产品名称";
    productName.value =@"指数王";
    [section addFormRow:productName];
    //BegainNumber
    XLFormRowDescriptor *begainNumber = [XLFormRowDescriptor formRowDescriptorWithTag:kBegainNumber rowType:XLFormRowDescriptorTypeInfo title:@"起投金额"];
    begainNumber.value = @"10000元";
    [section addFormRow:begainNumber];
    //BuyNumber
    XLFormRowDescriptor *buyNumber = [XLFormRowDescriptor formRowDescriptorWithTag:kBuyNumber  rowType:XLFormRowDescriptorTypeInteger title:@"购买金额"];
    [buyNumber.cellConfigAtConfigure setObject:@"能购买10000元的整数倍" forKey:@"textField.placeholder"];
    [buyNumber.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [section addFormRow:buyNumber];
    
    // check
    XLFormRowDescriptor *arow =[XLFormRowDescriptor formRowDescriptorWithTag:kCheck rowType:XLFormRowDescriptorTypeBooleanCheck title:@"已阅读并同意<<指数王服务协议>>"];
    
    [section addFormRow:arow];
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    //button
    XLFormRowDescriptor *sureBtn = [XLFormRowDescriptor formRowDescriptorWithTag:kSureBtn rowType:XLFormRowDescriptorTypeButton title:@"确认"];
    //    [sureBtn.cellConfigAtConfigure setObject:@(UIControlEventTouchUpInside) forKey:@"ControlEvents"];
    [sureBtn.cellConfig setObject:[UIColor redColor] forKey:@"backgroundColor"];
    [sureBtn.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
    sureBtn.action.formSelector  = @selector(sureBtnAction:);
    [section addFormRow:sureBtn];
    
    
    self.form = form;
}
- (void)sureBtnAction:(XLFormRowDescriptor *)sender{
    [self deselectFormRow:sender];
    NSLog(@"sure");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}
-(void)initForm
{
    XLFormDescriptor *form = [XLFormDescriptor formDescriptor];
    XLFormSectionDescriptor *section;
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    //BUYproductname
    XLFormRowDescriptor *buyProductionName = [XLFormRowDescriptor formRowDescriptorWithTag:kBuyProductName rowType:XLFormRowDescriptorTypeSelectorPush];
    buyProductionName.title = @"产品名称";
    buyProductionName.value = [XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"一年期点财通会员"];
    buyProductionName.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(0) displayText:@"一年期点财通会员"],
                                          [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"三年期点财通会员"],
                                          [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"终身点财通会员"],
                                          ];
    
    [section addFormRow:buyProductionName];
    //ProductMoney
    
    XLFormRowDescriptor  *productMoney = [XLFormRowDescriptor formRowDescriptorWithTag:kProductMoney rowType:XLFormRowDescriptorTypeInfo title:@"产品金额"];
    if (buyProductionName.selectorOptions[0]) {
        productMoney.value = @"399";
    }else if(buyProductionName.selectorOptions[1]){
        productMoney.value = @"799";
    }else if(buyProductionName.selectorOptions[2]){
        productMoney.value = @"1999";
    }
    
    [section addFormRow:productMoney];
    //Coupon
    XLFormRowDescriptor  *coupon = [XLFormRowDescriptor formRowDescriptorWithTag:kCoupon rowType:XLFormRowDescriptorTypeNumber title:@"抵用券"];
    [coupon.cellConfigAtConfigure setObject:@(NSTextAlignmentRight) forKey:@"textField.textAlignment"];
    [coupon.cellConfigAtConfigure setObject:@"请输入抵用券代码" forKey:@"textField.placeholder"];
    coupon.required = YES;
    [section addFormRow:coupon];
    
    if (self.bankNo != nil) {
        XLFormRowDescriptor *bankCard = [XLFormRowDescriptor formRowDescriptorWithTag:kBindCard rowType:XLFormRowDescriptorTypeSelectorPush];
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
        XLFormRowDescriptor *bankCard = [XLFormRowDescriptor formRowDescriptorWithTag:kBindCard rowType:XLFormRowDescriptorTypeButton];
        bankCard.title = @"银行卡(未绑定)";
         [bankCard.cellConfig setObject:@(NSTextAlignmentNatural) forKey:@"textLabel.textAlignment"];
//        bankCard.title = @"点击绑定银行卡";
//        [bankCard.cellConfig setObject:@(NSTextAlignmentRight) forKey:@"textLabel.textAlignment"];
        [bankCard.cellConfig setObject:[UIFont fontWithName:@"Helvetica" size:15] forKey:@"textLabel.font"];
        bankCard.value = @"点击绑定银行卡";

        bankCard.action.formSelector = @selector(bankCardAction:);
        [section addFormRow:bankCard];
    }
    
    XLFormSectionDescriptor *paySection = [XLFormSectionDescriptor formSection];
    paySection.title = @"选择支付方式";
    [form addFormSection:paySection];

    
    XLFormRowDescriptor *payRow = [XLFormRowDescriptor formRowDescriptorWithTag:kPayType rowType:XLFormRowDescriptorTypeSelectorPush title:@"支付方式选择"];
    
    
    payRow.selectorOptions = @[@"在线支付",@"会员卡支付"];
    [paySection addFormRow:payRow];
    
    //协议
    XLFormRowDescriptor  *arrguement = [XLFormRowDescriptor formRowDescriptorWithTag:kArrguement rowType:XLFormRowDescriptorTypeInfo title:@"<<点财通会员服务协议>>"];
    [arrguement.cellConfig setObject:[UIColor blueColor] forKey:@"textLabel.color"];
    [paySection addFormRow:arrguement];
    XLFormRowDescriptor  *arrguementChick = [XLFormRowDescriptor formRowDescriptorWithTag:kArrguementChick rowType:XLFormRowDescriptorTypeBooleanCheck title:@"已阅读<<点财通会员服务协议>>"];
    [paySection addFormRow:arrguementChick];
    
    //button
    XLFormSectionDescriptor *buttonSection = [XLFormSectionDescriptor formSection];
    [form addFormSection:buttonSection];
    XLFormRowDescriptor  *payButton = [XLFormRowDescriptor formRowDescriptorWithTag:kPayButton rowType:XLFormRowDescriptorTypeButton title:@"支付"];
    [payButton.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
    [payButton.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"backgroundColor"];
    payButton.action.formSelector = @selector(PayAction:);
    [buttonSection addFormRow:payButton];
    
    self.form = form;
}
- (void)PayAction:(XLFormRowDescriptor *)sender
{
    MemberBorrowViewController *member = [[MemberBorrowViewController alloc]init];
    [self.navigationController pushViewController:member  animated:YES];
    [self deselectFormRow:sender];
}
- (void)bankCardAction:(XLFormRowDescriptor *)sender
{
    NSLog(@"hahah");
    [self deselectFormRow:sender];
}
- (void)formRowDescriptorValueHasChanged:(XLFormRowDescriptor *)formRow oldValue:(id)oldValue newValue:(id)newValue
{
    [super formRowDescriptorValueHasChanged:formRow oldValue:oldValue newValue:newValue];
    if ([formRow.tag isEqualToString:kProductMoney]) {
       
        
        
    }
}

@end
