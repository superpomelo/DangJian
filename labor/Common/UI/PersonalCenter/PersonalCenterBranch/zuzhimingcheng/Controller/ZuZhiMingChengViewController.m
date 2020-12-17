//
//  ZuZhiMingChengViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ZuZhiMingChengViewController.h"

@interface ZuZhiMingChengViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSString *zuzhiStr;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation ZuZhiMingChengViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titlesLabel.attributedText = [UILabel getABTbody:@"" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.dataArray = @[@"智慧党组织"];
    [self initPickerView];
    self.fd_prefersNavigationBarHidden = YES;

}

- (void)initPickerView{
    self.myPickerView.delegate = self;
    self.myPickerView.dataSource = self;
}
//设置列数
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView{
    return 1;
}

//设置指定列包含的项数
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component{

    return self.dataArray.count;
}


//设置每个选项显示的内容
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component{
    return self.dataArray[row];
}
//获取用户当前选中的选项
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    self.zuzhiStr = self.dataArray[row];
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sureButtonAction:(id)sender {
    self.resultBlock(self.zuzhiStr);
    [self.navigationController popViewControllerAnimated:YES];

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
