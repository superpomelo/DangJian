//
//  SchoolNameViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/20.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SchoolNameViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "SchoolNameModel.h"

@interface SchoolNameViewController ()<UIPickerViewDelegate,UIPickerViewDataSource>
@property (weak, nonatomic) IBOutlet UIButton *submitButtonAction;


@property (weak, nonatomic) IBOutlet UIPickerView *myPickerView;

@property (nonatomic,strong)NSArray *dataArray;

@property (nonatomic,strong)NSString *schoolStr;

@end

@implementation SchoolNameViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    [self initUI];
    [self requestadmindeptgetDeptVoList];
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
    SchoolNameModel *models = self.dataArray[row];
    return models.name;
}
//获取用户当前选中的选项
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component{
    SchoolNameModel *models = self.dataArray[row];

    self.schoolStr = [NSString stringWithFormat:@"%d",models.deptId];
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonAction:(id)sender {
 

    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"avatar"] = self.model.avatar;
    para[@"birthday"] = self.model.birthday;
    para[@"deptId"] = self.schoolStr;

    para[@"partyNumber"] = [NSString stringWithFormat:@"%d",self.model.partyNumber];
    para[@"phone"] = [NSString stringWithFormat:@"%d",self.model.phone];
    para[@"realName"] = self.model.realName;
    para[@"sex"] = self.model.sex;
    para[@"username"] = self.model.username;
    [self requestmobileUsermyInfo:para];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**学校列表*/
- (void)requestadmindeptgetDeptVoList{
    [PersonalCenterRequestDatas admindeptgetDeptVoListrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myPickerView reloadAllComponents];
        if (self.dataArray>0) {
            SchoolNameModel *models = self.dataArray[0];

            self.schoolStr = [NSString stringWithFormat:@"%d",models.deptId];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**个人信息修改*/
- (void)requestmobileUsermyInfo:(NSMutableDictionary*)para{

    [PersonalCenterRequestDatas mobileUsermyInforequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.resultBlock(self.schoolStr);
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
