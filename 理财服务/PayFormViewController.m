//
//  PayFormViewController.m
//  理财服务
//
//  Created by 展恒 on 15/12/17.
//  Copyright © 2015年 赵百川. All rights reserved.
//

#import "PayFormViewController.h"
#import "FinancialServiceViewController.h"
@interface PayFormViewController ()

@end

@implementation PayFormViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    XLFormDescriptor *form = [XLFormDescriptor formDescriptorWithTitle:@"绑定银行卡"];
    XLFormSectionDescriptor *section;
    XLFormRowDescriptor *row;
    
    section = [XLFormSectionDescriptor formSection];
    section.title = @"购买理财产品需绑定银行";
    [form addFormSection:section];
    
    //name
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"Name" rowType:XLFormRowDescriptorTypeText title:@"真实姓名"];
    [section addFormRow:row];
    //personID
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"PersonID" rowType:XLFormRowDescriptorTypeNumber title:@"身份证号"];
    [section addFormRow:row];
    //chooseBank
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"PickerView" rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"选择银行"];
    row.selectorOptions = @[[XLFormOptionsObject formOptionsObjectWithValue:@(1) displayText:@"工商银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(2) displayText:@"光大银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(3) displayText:@"浦发银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(4) displayText:@"建设银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(5) displayText:@"招商银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(6) displayText:@"农业银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(7) displayText:@"中国银行"],
                            [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"包商银行"],
                            ];
    row.value = [XLFormOptionsObject formOptionsObjectWithValue:@(8) displayText:@"工商银行"];
    [section addFormRow:row];
    //BankLocation
    NSString *path=[[NSBundle mainBundle]pathForResource:@"proAndCityinfo" ofType:@"plist"];
    NSDictionary *dic = [NSDictionary dictionaryWithContentsOfFile:path];
    NSArray *array  = [dic allValues];
    
    NSLog(@"11111%@",array);
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"PickerView" rowType:XLFormRowDescriptorTypeSelectorPickerViewInline title:@"选择银行卡归属地"];
    row.selectorOptions = @[@"北京",@"上海",@"广州",@"深圳"
                            ];
    row.value = @"北京";
    [section addFormRow:row];
    //BankNumber
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"BankNumber" rowType:XLFormRowDescriptorTypeInteger title:@"银行卡号"];
    [section addFormRow:row];
    //PhoneNumber
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"PhoneNumber" rowType:XLFormRowDescriptorTypePhone title:@"预留手机号"];
    
    [section addFormRow:row];
   
    
    //GetNumber
    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"GetNumber" rowType:XLFormRowDescriptorTypeInteger title:@"验证码"];
    [section addFormRow:row];
    
    
    
    
    section = [XLFormSectionDescriptor formSection];
    [form addFormSection:section];
    
    //NextBtn
//    row = [XLFormRowDescriptor formRowDescriptorWithTag:@"NextBtn" rowType:XLFormRowDescriptorTypeButton title:@"下一步"];
//    [row.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"backgroundColor"];
//    [row.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
//    [row.cellConfig setObject:[UIFont fontWithName:@"Helvetica" size:20] forKey:@"textLabel.font"];
    XLFormRowDescriptor *buttonRow = [XLFormRowDescriptor formRowDescriptorWithTag:@"NextBtn" rowType:XLFormRowDescriptorTypeButton title:@"下一步"];
    [buttonRow.cellConfigAtConfigure setObject:[UIColor redColor] forKey:@"backgroundColor"];
    [buttonRow.cellConfig setObject:[UIColor whiteColor] forKey:@"textLabel.color"];
    
    buttonRow.action.formSelector = @selector(didTouchButton:);
    
   
    buttonRow.title = @"下一步";
    [section addFormRow:buttonRow];
    self.form =form;
    
}
//- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
//{
//    if ([[self.form formRowAtIndex:indexPath].tag isEqualToString:@"NextBtn"]) {
//        FinancialServiceViewController *fVC = [[FinancialServiceViewController alloc]init];
//        [self.navigationController pushViewController:fVC animated:YES];
//    }
//}
- (void)didTouchButton:(NSObject *)sender{
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
