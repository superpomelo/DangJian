//
//  XueLiXuanZeViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "XueLiXuanZeViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "MingZuModel.h"

@interface XueLiXuanZeViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSString *xueliStr;
@property(nonatomic,strong)NSString *xueliStrID;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation XueLiXuanZeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titlesLabel.attributedText = [UILabel getABTbody:@"学历选择" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.dataArray = [NSArray array];
    [self initPickerView];
    self.fd_prefersNavigationBarHidden = YES;
    [self requestadmindicttypeeducation];
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
    self.xueliStrID = [NSString stringWithFormat:@"%d",model.value];
    self.xueliStr = model.label;
//    self.xueliStr = self.dataArray[row];
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sureButtonAction:(id)sender {
//    self.resultBlock(self.xueliStr);
//    [self.navigationController popViewControllerAnimated:YES];
    if (self.dataArray.count == 0) {
        return;
    }
    [self requestmobileUsermyInfo];

}

/**学历列表*/
- (void)requestadmindicttypeeducation{
       
    [PersonalCenterRequestDatas admindicttypeeducationrequestDataWithparameters:nil success:^(id  _Nonnull result) {
            self.dataArray = result;
            if (self.dataArray.count>0) {
                MingZuModel *model = self.dataArray[0];
                self.xueliStrID = [NSString stringWithFormat:@"%d",model.value];
                self.xueliStr = model.label;
            }
            [self.myPickerView reloadAllComponents];
        } failure:^(NSError * _Nonnull error) {
            
        }];
    }
/**个人修改信息*/
- (void)requestmobileUsermyInfo{
        NSMutableDictionary *para = [NSMutableDictionary dictionary];
        para[@"education"] = self.xueliStrID;
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
