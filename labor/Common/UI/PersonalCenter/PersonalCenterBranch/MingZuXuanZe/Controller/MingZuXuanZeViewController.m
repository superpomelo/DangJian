//
//  MingZuXuanZeViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MingZuXuanZeViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "MingZuModel.h"

@interface MingZuXuanZeViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSString *minzuStr;
@property(nonatomic,strong)NSString *minzuStrID;

@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation MingZuXuanZeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titlesLabel.attributedText = [UILabel getABTbody:@"选择民族" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.dataArray = [NSArray array];
    [self initPickerView];
    self.fd_prefersNavigationBarHidden = YES;
    [self requestadmindeptgetDeptVoList];
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
    MingZuModel *model = self.dataArray[row];
    return model.label;
}
//获取用户当前选中的选项
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    MingZuModel *model = self.dataArray[row];
    self.minzuStrID = [NSString stringWithFormat:@"%d",model.value];
    self.minzuStr = model.label;
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sureButtonAction:(id)sender {
    if (self.dataArray.count == 0) {
        return;
    }
//    self.resultBlock(self.minzuStr,self.minzuStrID);
    [self requestmobileUsermyInfo];
//    [self.navigationController popViewControllerAnimated:YES];

}

/**民族列表*/
- (void)requestadmindeptgetDeptVoList{
   
    [PersonalCenterRequestDatas admindicttypenationrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        if (self.dataArray.count>0) {
            MingZuModel *model = self.dataArray[0];
            self.minzuStrID = [NSString stringWithFormat:@"%d",model.value];
            self.minzuStr = model.label;
        }
        [self.myPickerView reloadAllComponents];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**个人修改信息*/
- (void)requestmobileUsermyInfo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"nation"] = self.minzuStrID;
    [PersonalCenterRequestDatas mobileUsermyInforequestDataWithparameters:para success:^(id  _Nonnull result) {
       [SVProgressHUD showSuccessWithStatus:@"修改成功"];

        [self.navigationController popViewControllerAnimated:YES];
    } failure:^(NSError * _Nonnull error) {
        
    }];
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
