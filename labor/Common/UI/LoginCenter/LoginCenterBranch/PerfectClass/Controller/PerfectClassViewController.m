//
//  PerfectClassViewController.m
//  labor
//
//  Created by 狍子 on 2020/10/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "PerfectClassViewController.h"
#import "LoginRequestDatas.h"
@interface PerfectClassViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *submitButtonAction;


@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;

@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)PerfectClassModel *modelTemp;
@end

@implementation PerfectClassViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    [self initUI];
    [self requestsysclassgetdeptmentbydepdid];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.submitButtonAction.layer.cornerRadius = 5;
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
    PerfectClassModel *models = self.dataArray[row];
    return models.name;
}
//获取用户当前选中的选项
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    PerfectClassModel *models = self.dataArray[row];

    self.modelTemp = models;
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonAction:(id)sender {
 
    if (self.dataArray>0) {
        if (self.modelTemp != nil) {
            self.resultBlock(self.modelTemp);
            [self.navigationController popViewControllerAnimated:YES];

        }
    }
    
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**通过系部id查询班级*/
- (void)requestsysclassgetdeptmentbydepdid{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"deptpartmentId"] = self.deptpartmentId;
    [LoginRequestDatas sysclassgetdeptmentbydepdidrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        if (self.dataArray.count >0) {
            PerfectClassModel *models = self.dataArray[0];

            self.modelTemp = models;
        }
        [self.myPickerView reloadAllComponents];
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
