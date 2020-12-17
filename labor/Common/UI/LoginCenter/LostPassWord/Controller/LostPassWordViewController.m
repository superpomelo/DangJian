//
//  LostPassWordViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LostPassWordViewController.h"
#import "LoginRequestDatas.h"
#import "NSString+AES.h"

@interface LostPassWordViewController ()
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
/**下一步*/
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (nonatomic,weak)NSTimer *losttimer;

@property (nonatomic,assign )int TAG;
@property (weak, nonatomic) IBOutlet UITextField *zhanghaoTF;
@property (weak, nonatomic) IBOutlet UITextField *codeTF;
@property (weak, nonatomic) IBOutlet UITextField *passwordTF;


@end

@implementation LostPassWordViewController
//MARK: - Life Cycle - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
   self.TAG = 60;
    [self initUI];
    self.fd_prefersNavigationBarHidden = YES;

}
//MARK: - Initalization - 初始化
- (void)initUI{
    self.getCodeLabel.textColor = kGreenColor;
    self.leftKLabel.textColor = kGreenColor;
    self.secondsLabel.textColor = kGreenColor;
    self.rightKLabel.textColor = kGreenColor;
    self.nextButton.backgroundColor = kGreenColor;
    self.sendCodeButtomView.backgroundColor = kGreenColor;

    
    self.nextButton.layer.cornerRadius = self.nextButton.bounds.size.height/2;

//    self.sendCodeButtomView.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
    self.sendCodeButtomView.layer.cornerRadius = self.sendCodeButtomView.bounds.size.height/2;
    self.getCodeButton.hidden = NO;
    self.secondsLabel.hidden = YES;
    self.leftKLabel.hidden = YES;
    self.rightKLabel.hidden = YES;
    self.getCodeLabel.hidden = YES;
    [self.getCodeButton setTitle:@"获取验证码" forState:UIControlStateNormal];
    
    
}
/**定时器*/
- (void)lostAddTimer{
    self.losttimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(losttimerAction:) userInfo:nil repeats:YES];
    

    [self.losttimer fire]; //开启
}
/**定时器任务*/
- (void)losttimerAction:(NSTimer*)timer{
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
    if (_losttimer != nil) {
        [_losttimer invalidate]; //销毁定时器
        _losttimer = nil;
    }
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    [self requestregisteredupdatePsw];
}
- (IBAction)getCodeButtonAction:(id)sender {
    [self requestmobilegetmobilefortrue];
    

}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求

/**已注册手机号获取验证码*/
- (void)requestmobilegetmobilefortrue{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"mobile"] = self.zhanghaoTF.text;
   
    [LoginRequestDatas mobilegetmobilefortruerequestDataWithparameters:para success:^(id  _Nonnull result) {
        
        [self lostAddTimer];
        self.sendCodeButtomView.backgroundColor = [UIColor clearColor];
        self.sendCodeButtomView.layer.borderWidth = 1;
//        self.sendCodeButtomView.layer.borderColor = [UIColor colorWithRed:79/255.0 green:219/255.0 blue:141/255.0 alpha:1].CGColor;
        self.sendCodeButtomView.layer.borderColor = kGreenColor.CGColor;

        [self.getCodeButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**忘记密码*/
- (void)requestregisteredupdatePsw{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //校验手机号是否合规
//    if ([MobileVali valiMobile:self.zhangHaoTF.text] == nil) {
        para[@"mobile"] = self.zhanghaoTF.text;

//    }else{
//        [SVProgressHUD showInfoWithStatus:[MobileVali valiMobile:self.zhangHaoTF.text]];
//        return;
//    }
    if (self.passwordTF.text == nil ||[self.passwordTF.text isEqualToString:@""]||[self.passwordTF.text isEqualToString:@" "]||[self.passwordTF.text isEqualToString:@"  "]) {
        [SVProgressHUD showInfoWithStatus:@"请输入密码"];
    }else{
        para[@"password"] = [self.passwordTF.text aci_encryptWithAESWithPSW_AES_KEY:@"wichingwichingas" AES_IV_PARAMETER:@"wichingwichingas"];

    }
    if (self.codeTF.text == nil ||[self.codeTF.text isEqualToString:@""]||[self.codeTF.text isEqualToString:@" "]||[self.codeTF.text isEqualToString:@"  "]) {
        [SVProgressHUD showInfoWithStatus:@"请输入验证码"];
    }else{
        para[@"code"] = self.codeTF.text;


    }


    [LoginRequestDatas registeredupdatePswrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
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
