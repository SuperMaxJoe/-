//
//  PayFormViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/17.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "PayFormViewController.h"
#import "FinancialServiceViewController.h"
NSString *const kName = @"Name";
NSString *const kPersonID = @"PersonID";
NSString *const kChooseBank = @"ChooseBank";
NSString *const kBankLocation = @"BankLocation";
NSString *const kBankNumber = @"BankNumber";
NSString *const kPhoneNumber = @"PhoneNumber";
NSString *const kGetNumber = @"GetNumber";
NSString *const kButton = @"NextBtn";

@interface PayFormViewController ()

@end

@implementation PayFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self initializeForm];
    
}
- (void)initializeForm
{
    XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@"绑定银行卡"];
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"购买理财产品需绑定银行";
    [form addFormSection:section];
    
    //name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kName rowType:XLFormRowDescriptorTypeText title:@"真实姓名"];
    [section addFormRow:row];
    //personID
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kPersonID rowType:XLFormRowDescriptorTypeURL title:@"身份证号"];
    
    [section addFormRow:row];
    //chooseBank
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kChooseBank rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"选择银行"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"工商银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"光大银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"浦发银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"建设银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"平安银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(6) displayText:@"中国银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(7) displayText:@"邮政银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"民生银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(9) displayText:@"广发银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(10) displayText:@"中信银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(11) displayText:@"华夏银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(12) displayText:@"交通银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(13) displayText:@"上海浦东发展银行"],
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"工商银行"];
    [section addFormRow:row];
    //BankLocation
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kBankLocation rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"选择银行卡归属地"];
    row.selectorOptions = @[@"北京",@"上海",@"广州",@"深圳"
                            ];
    row.value = @"北京";
    [section addFormRow:row];
    //BankNumber
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kBankNumber rowType:XLFormRowDescriptorTypeInteger title:@"银行卡号"];
    [section addFormRow:row];
    
    

    //PhoneNumber
  
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kPhoneNumber rowType:XLFormRowDescriptorTypePhone];
    row.title = @"预留手机号";
    
    [section addFormRow:row];
    //GetNumber
    row = [XLFormRowDescriptor formRowDescriptorWithTag:kGetNumber rowType:XLFormRowDescriptorTypeInteger title:@"验证码"];
    [section addFormRow:row];
    
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
   
    
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"getbutton" rowType:XLFormRowDescriptorTypeButton];
    row.title = @"点击获取验证码";
    row.action.formSelector = @selector(CodeAction:);
    [section addFormRow:row];
    
    //
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];

    
    //NextBtn
    XLFormRowDescriptor *buttonRow = [XLFormRowDescriptor formRowDescriptorWithTag:kButton rowType:XLFormRowDescriptorTypeButton title:@"下一步"];
    
    [buttonRow.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"backgroundColor"];
    [buttonRow.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
    buttonRow.action.formSelector = @selector(didTouchButton:);
    [section addFormRow:buttonRow];
    
   
    
    
    
    
    
    self.form =form;
}
-(void)CodeAction:(XLFormRowDescriptor *)sender
{
    [self deselectFormRow:sender];
}
- (void)didTouchButton:(XLFormRowDescriptor *)sender{
    [self deselectFormRow:sender];
    NSLog(@"点击加载");
}
- (void)chickAction{
    NSLog(@"sure");
}
- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigationt

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
