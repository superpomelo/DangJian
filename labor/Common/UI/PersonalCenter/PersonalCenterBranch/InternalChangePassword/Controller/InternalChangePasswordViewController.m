//
//  InternalChangePasswordViewController.m
//  labor
//
//  Created by 狍子 on 2020/10/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "InternalChangePasswordViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "SwitchRootController.h"
#import "NSString+AES.h"

@interface InternalChangePasswordViewController ()
@property (weak, nonatomic) IBOutlet UIButton *submitButtonAction;
@property (weak, nonatomic) IBOutlet UITextField *myTextField;
@end

@implementation InternalChangePasswordViewController

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
    self.submitButtonAction.layer.cornerRadius = 5;
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)submitButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    if ([self.myTextField.text isEqualToString:@""]) {
        return;
    }
    
    [self requestregisteredupdatePswIN];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求

/**内部修改密码*/
- (void)requestregisteredupdatePswIN{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"password"] = [self.myTextField.text aci_encryptWithAESWithPSW_AES_KEY:@"wichingwichingas" AES_IV_PARAMETER:@"wichingwichingas"];
    [PersonalCenterRequestDatas registeredupdatePswINrequestDataWithparameters:para success:^(id  _Nonnull result) {
        [SwitchRootController goLoginController];
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
