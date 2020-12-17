//
//  IdNumberXiuGaiViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "IdNumberXiuGaiViewController.h"
#import "PersonalCenterRequestDatas.h"

@interface IdNumberXiuGaiViewController ()
@property (weak, nonatomic) IBOutlet UIButton *submitButtonAction;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;

@end

@implementation IdNumberXiuGaiViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.leftLabel.attributedText = [UILabel getABTbody:@"身份证号" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.titlesLabel.attributedText = [UILabel getABTbody:@"填写个人信息" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.submitButtonAction.layer.cornerRadius = 5;
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonAction:(id)sender {
    if ([self.myTextField.text isEqualToString:@""]) {
        return;
    }
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"username"] = self.myTextField.text;
    [self requestmobileUsermyInfo];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**个人修改信息*/
- (void)requestmobileUsermyInfo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"infoId"] = self.myTextField.text;
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
