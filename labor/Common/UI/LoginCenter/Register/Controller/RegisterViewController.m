//
//  RegisterViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "RegisterViewController.h"
#import "RegisteredSuccessfullyViewController.h"
#import "LoginRequestDatas.h"
#import "NSString+AES.h"
#import "MobileVali.h"

@interface RegisterViewController ()
/**学号/邀请码tf*/
@property (weak, nonatomic) IBOutlet UITextField *xueHaoAndInvitationTextField;

/**注册*/
@property (weak, nonatomic) IBOutlet UIButton *registerButton;
/**学号*/
@property (weak, nonatomic) IBOutlet UIButton *xueHaoButton;
/**邀请码*/
@property (weak, nonatomic) IBOutlet UIButton *invitationCodeButton;
/**学号-邀请码联动线*/
@property (weak, nonatomic) IBOutlet UILabel *lianDongLine;
/**发送验证码底部view*/
@property (weak, nonatomic) IBOutlet UIView *sendCodeButtomView;
/**重新获取/获取验证码*/
@property (weak, nonatomic) IBOutlet UILabel *getCodeLabel;
/**（ */
@property (weak, nonatomic) IBOutlet UILabel *leftKLabel;
/**秒数*/
@property (weak, nonatomic) IBOutlet UILabel *secondsLabel;
/** ）*/
@property (weak, nonatomic) IBOutlet UILabel *rightKLabel;
/**获取验证码*/
@property (weak, nonatomic) IBOutlet UIButton *getCodeButton;

@property (nonatomic,weak)NSTimer *registertimer;
@property (nonatomic,assign )int TAG;
@property (weak, nonatomic) IBOutlet UITextField *zhangHaoTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *passWordTF;
@property (nonatomic,assign )int tagT;

@end

@implementation RegisterViewController
//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.TAG = 60;
    self.tagT = 0;
    [self initUI];
    self.fd_prefersNavigationBarHidden = YES;

}

//MARK: - Initalization - 初始化
- (void)initUI{
    self.getCodeLabel.textColor = kGreenColor;
    self.leftKLabel.textColor = kGreenColor;
    self.secondsLabel.textColor = kGreenColor;
    self.rightKLabel.textColor = kGreenColor;

    self.registerButton.backgroundColor = kGreenColor;
    self.xueHaoButton.selected = YES;
    self.registerButton.layer.cornerRadius = self.registerButton.bounds.size.height/2;

//    self.sendCodeButtomView.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
    self.sendCodeButtomView.backgroundColor = kGreenColor;
    self.sendCodeButtomView.layer.cornerRadius = self.sendCodeButtomView.bounds.size.height/2;
//    self.getCodeButton.backgroundColor = kGreenColor;
    self.getCodeButton.hidden = NO;
    self.secondsLabel.hidden = YES;
    self.leftKLabel.hidden = YES;
    self.rightKLabel.hidden = YES;
    self.getCodeLabel.hidden = YES;
    [self.getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
}
/**定时器*/
- (void)resignAddTimer{
    self.registertimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(resigntimerAction:) userInfo:nil repeats:YES];
    

    [self.registertimer fire]; //开启
}
/**定时器任务*/
- (void)resigntimerAction:(NSTimer*)timer{
    self.TAG = self.TAG-1;
    self.getCodeButton.hidden = YES;
    self.secondsLabel.hidden = NO;
    self.leftKLabel.hidden = NO;
    self.rightKLabel.hidden = NO;
    self.getCodeLabel.hidden = NO;
    self.secondsLabel.text = [NSString stringWithFormat:@"%d",self.TAG];
    if (self.TAG == 0) {
        [self stopresigntimer];
        self.secondsLabel.hidden = YES;
        self.leftKLabel.hidden = YES;
        self.rightKLabel.hidden = YES;
        self.getCodeLabel.hidden = YES;
        self.getCodeButton.hidden = NO;
        self.TAG = 60;
//        self.sendCodeButtomView.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
        self.sendCodeButtomView.backgroundColor = kGreenColor;

        self.sendCodeButtomView.layer.borderWidth = 0;
        [self.getCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        

    }}

//停止定时器
- (void)stopresigntimer{
    if (_registertimer != nil) {
        [_registertimer invalidate]; //销毁定时器
        _registertimer = nil;
    }
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**注册*/
- (IBAction)registerButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    [self requestregisteredregiste];
  
}
/**学号*/
- (IBAction)xueHaoButtonAction:(UIButton*)sender {
    self.tagT = 0;
    sender.selected = YES;
    self.invitationCodeButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lianDongLine.center = CGPointMake(sender.center.x, self.lianDongLine.center.y);
    }];
    self.xueHaoAndInvitationTextField.placeholder = @"输入学号";
}
/**邀请码*/
- (IBAction)invitationCodeButtonAction:(UIButton*)sender {
    self.tagT = 1;
    sender.selected = YES;
    self.xueHaoButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lianDongLine.center = CGPointMake(sender.center.x, self.lianDongLine.center.y);
    }];
    self.xueHaoAndInvitationTextField.placeholder = @"输入邀请码";
}
- (IBAction)getCodeButtonAction:(id)sender {
    //校验手机号是否合规
//    if ([MobileVali valiMobile:self.zhangHaoTF.text] == nil) {
        [self requestmobilegetmobileforfalse];
//    }else{
//        [SVProgressHUD showInfoWithStatus:[MobileVali valiMobile:self.zhangHaoTF.text]];
//        return;
//    }
    

    

}
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求

/**未注册手机发送验证码*/
- (void)requestmobilegetmobileforfalse{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"mobile"] = self.zhangHaoTF.text;
   
    [LoginRequestDatas mobilegetmobileforfalserequestDataWithparameters:para success:^(id  _Nonnull result) {
        [self resignAddTimer];
        self.sendCodeButtomView.backgroundColor = [UIColor clearColor];
        self.sendCodeButtomView.layer.borderWidth = 1;
        self.sendCodeButtomView.layer.borderColor = kGreenColor.CGColor;
        
        [self.getCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**注册*/
- (void)requestregisteredregiste{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //校验手机号是否合规
//    if ([MobileVali valiMobile:self.zhangHaoTF.text] == nil) {
        para[@"userName"] = self.zhangHaoTF.text;
        para[@"phone"] = self.zhangHaoTF.text;

//    }else{
//        [SVProgressHUD showInfoWithStatus:[MobileVali valiMobile:self.zhangHaoTF.text]];
//        return;
//    }
    if (self.passWordTF.text == nil ||[self.passWordTF.text isEqualToString:@""]||[self.passWordTF.text isEqualToString:@" "]||[self.passWordTF.text isEqualToString:@"  "]) {
        [SVProgressHUD showInfoWithStatus:@"请输入密码"];
    }else{
        para[@"password"] = [self.passWordTF.text aci_encryptWithAESWithPSW_AES_KEY:@"wichingwichingas" AES_IV_PARAMETER:@"wichingwichingas"];

    }
    if (self.codeTF.text == nil ||[self.codeTF.text isEqualToString:@""]||[self.codeTF.text isEqualToString:@" "]||[self.codeTF.text isEqualToString:@"  "]) {
        [SVProgressHUD showInfoWithStatus:@"请输入验证码"];
    }else{
        para[@"code"] = self.codeTF.text;


    }
//    if (self.tagT == 0) {
//        /**学号*/
//        para[@"partyNumber"] = self.xueHaoAndInvitationTextField.text;
//    }else{
//        /**邀请码*/
//       [SVProgressHUD showInfoWithStatus:@"邀请码注册暂未开放"];
//
//    }

    [LoginRequestDatas registeredregisteredrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
        RegisteredSuccessfullyViewController *RSvc = [[RegisteredSuccessfullyViewController alloc]init];
        [self.navigationController pushViewController:RSvc animated:YES];
        
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
