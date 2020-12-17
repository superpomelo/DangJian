//
//  JiGuan1ViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "JiGuan1ViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "ShengFenXuanZeModel.h"

@interface JiGuan1ViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;
@property(nonatomic,strong)NSArray *dataArray;
@property(nonatomic,strong)NSString *jiguanStr;
@property(nonatomic,strong)NSString *jiguanStrID;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation JiGuan1ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titlesLabel.attributedText = [UILabel getABTbody:@"选择籍贯" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.dataArray = [NSArray array];
    [self initPickerView];
    self.fd_prefersNavigationBarHidden = YES;
    [self requestadminsysprovincelist];
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
    ShengFenXuanZeModel *model = self.dataArray[row];
//    self.jiguanStrID = [NSString stringWithFormat:@"%d",model.idx];
//    self.jiguanStr = model.name;
    return model.name;
}
//获取用户当前选中的选项
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    ShengFenXuanZeModel *model = self.dataArray[row];
    self.jiguanStrID = [NSString stringWithFormat:@"%d",model.idx];
    self.jiguanStr = model.name;
//    self.jiguanStr = self.dataArray[row];
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)sureButtonAction:(id)sender {
//    self.resultBlock(self.jiguanStr);
//    [self.navigationController popViewControllerAnimated:YES];
    if (self.dataArray.count == 0) {
        return;
    }
    [self requestmobileUsermyInfo];
}
/**省份列表*/
- (void)requestadminsysprovincelist{
   
    [PersonalCenterRequestDatas adminsysprovincelistrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        if (self.dataArray.count>0) {
            ShengFenXuanZeModel *model = self.dataArray[0];
            self.jiguanStrID = [NSString stringWithFormat:@"%d",model.idx];
            self.jiguanStr = model.name;
        }
        [self.myPickerView reloadAllComponents];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**个人修改信息*/
- (void)requestmobileUsermyInfo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"provinceId"] = self.jiguanStrID;
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
