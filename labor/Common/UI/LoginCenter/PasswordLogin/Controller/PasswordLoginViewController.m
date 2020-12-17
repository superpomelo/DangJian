//
//  PasswordLoginViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "PasswordLoginViewController.h"
#import "RegisterViewController.h"
#import "LostPassWordViewController.h"
#import "LoginRequestDatas.h"
#import "NSString+AES.h"
#import "SwitchRootController.h"
#import "MyPerfectInformationViewController.h"
#import "UserInfoManager.h"
#import "DQWKViewController.h"



@interface PasswordLoginViewController ()<UITextViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UIButton *loginButton;
@property (weak, nonatomic) IBOutlet UITextField *acTF;

@property (weak, nonatomic) IBOutlet UITextField *psTF;
@property (weak, nonatomic) IBOutlet UIButton *closeButton;
@property (weak, nonatomic) IBOutlet UIImageView *closeImgeView;
/**用户协议和隐私政策控件*/
@property (weak, nonatomic) IBOutlet UITextView *tvAgree;

@end

@implementation PasswordLoginViewController
//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
//    self.acTF.text = @"18565245033";
//    self.psTF.text = @"123456";
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}

//MARK: - Initalization - 初始化
- (void)initUI{
    self.loginButton.userInteractionEnabled = NO;
    self.loginButton.backgroundColor = [UIColor colorWithRed:228/255.0 green:176/255.0 blue:176/255.0 alpha:1];
    
        self.acTF.delegate = self;
    
        self.psTF.delegate = self;
    [self.psTF addTarget:self action:@selector(psTFAction:) forControlEvents:UIControlEventEditingChanged];
    self.closeButton.hidden = YES;
    self.closeImgeView.hidden = YES;
    self.loginButton.layer.cornerRadius = self.loginButton.bounds.size.height/2;
    
    /// 同意文本
//        UITextView *tvAgree = [[UITextView alloc]init];
//        self.tvAgree = tvAgree;
         self.tvAgree.userInteractionEnabled = YES;
         self.tvAgree.textColor = [UIColor lightGrayColor];
         self.tvAgree.editable = NO;//必须禁止输入，否则点击将弹出输入键盘
         self.tvAgree.scrollEnabled = NO;
         self.tvAgree.delegate = self;
         self.tvAgree.textAlignment  = NSTextAlignmentCenter;

//         self.tvAgree.textContainerInset = UIEdgeInsetsMake(0,0, 0, 0);
     
         NSString *agreeStr = [NSString stringWithFormat:@"登录即表示同意“用户协议”和“隐私政策”"];/// @"我已阅读并同意《隐私政策》《用户协议》";
        NSMutableAttributedString *diffString = [[NSMutableAttributedString alloc] initWithString:agreeStr];
        [diffString addAttribute:NSForegroundColorAttributeName value:self.tvAgree.textColor range:[[diffString string] rangeOfString:@"登录即表示同意"]];/// @"我已阅读并同意"
       [diffString addAttribute:NSForegroundColorAttributeName value:self.tvAgree.textColor range:[[diffString string] rangeOfString:@"和"]];/// ”和“
    
        [diffString addAttribute:NSLinkAttributeName
                               value:@"delegate://"
                               range:[[diffString string] rangeOfString:@"“用户协议”"]];///《用户协议》
        [diffString addAttribute:NSLinkAttributeName
                           value:@"privacy://"
                           range:[[diffString string] rangeOfString:@"“隐私政策”"]];///《隐私政策》
       self.tvAgree.linkTextAttributes = @{NSForegroundColorAttributeName: [UIColor colorWithRed:102/255.0 green:102/255.0 blue:102/255.0 alpha:1]};
       self.tvAgree.attributedText = diffString;

}


//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件

/// 隐私,协议
- (BOOL)textView:(UITextView *)textView shouldInteractWithURL:(NSURL *)URL inRange:(NSRange)characterRange {
    /// 隐私
    if ([[URL scheme] isEqualToString:@"privacy"]){
        /// 跳转隐私政策界面
        NSLog(@"跳转隐私政策界面");
        DQWKViewController *PIvc = [[DQWKViewController alloc]initWithNibName:@"DQWKViewController" bundle:nil];
        PIvc.urlstring = @"http://111.74.0.243:9162/";
        [self.navigationController pushViewController:PIvc animated:NO];
    }
    /// 协议
    else if ([[URL scheme] isEqualToString:@"delegate"]) {
        /// 跳转用户协议界面
        NSLog(@"跳转用户协议界面");
        DQWKViewController *PIvc = [[DQWKViewController alloc]initWithNibName:@"DQWKViewController" bundle:nil];
        PIvc.urlstring = @"http://111.74.0.243:9161/";

        [self.navigationController pushViewController:PIvc animated:NO];

    }
    return YES;
}
- (IBAction)backButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:nil];
}
- (IBAction)lostButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    LostPassWordViewController *LPvc = [[LostPassWordViewController alloc]init];
    [self.navigationController pushViewController:LPvc animated:YES];
}
- (IBAction)registerButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    RegisterViewController *Rvc = [[RegisterViewController alloc]init];
    [self.navigationController pushViewController:Rvc animated:YES];
}
- (IBAction)loginButtonAction:(UIButton*)sender {
    NSLog(@"1");
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"grant_type"] = @"password";
    para[@"password"] = [self.psTF.text aci_encryptWithAESWithPSW_AES_KEY:@"wichingwichingas" AES_IV_PARAMETER:@"wichingwichingas"];
//    para[@"password"] = @"OR+VibFPKf0OpHNPTDZoZQ==";
//   NSString *s = [@"$2a$10$Vp1CxPTT/QBmU88jZYzkXOYgIq04Kvfd.o.YYqFn0y6rC5hgO/Yqe" aci_decryptWithAESWithPSW_AES_KEY:@"wichingwichingas" AES_IV_PARAMETER:@"wichingwichingas"];
//    NSLog(@"%@",s);
    para[@"username"] = self.acTF.text;
//    para[@"scope"] = @"server";
    [LoginRequestDatas loginrequestDataWithparameters:para success:^(id  _Nonnull result) {
        [SwitchRootController goHomeViewController];
//        [self  requestadminroleselectUserRole];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

//MARK: - Utility - 多用途(功能)方法
- (void)psTFAction:(UITextField*)sender{
    NSLog(@"%@",sender.text);
    if (sender.text.length!=0&&self.acTF.text.length==11) {
        self.loginButton.userInteractionEnabled = YES;
        self.loginButton.backgroundColor = kGreenColor;
    }else{
        self.loginButton.userInteractionEnabled = NO;
        self.loginButton.backgroundColor = [UIColor colorWithRed:228/255.0 green:176/255.0 blue:176/255.0 alpha:1];
    }
}
//MARK: - Network request - 网络请求

/**判断角色*/
- (void)requestadminroleselectUserRole{
    [LoginRequestDatas adminroleselectUserRolerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        if ([[UserInfoManager getJiaoSe] isEqualToString:@"TEA_NOW"]) {
            [UserInfoManager setInfoStatus:@"true"];

            [SwitchRootController goHomeViewController];

        }else{
            [self requestmobileUsercheckover];

        }
//        [self dismissViewControllerAnimated:YES completion:nil];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
    
/**判断信息是否完善*/
- (void)requestmobileUsercheckover{
    [LoginRequestDatas mobileUsercheckoverrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        NSDictionary *dict = result;
        if ([dict[@"data"] boolValue] == YES) {
            //已完善
            [UserInfoManager setInfoStatus:@"true"];

            [SwitchRootController goHomeViewController];

        }else{
            //未完善

        MyPerfectInformationViewController *PIvc = [[MyPerfectInformationViewController alloc]initWithNibName:@"MyPerfectInformationViewController" bundle:nil];
            
        [self.navigationController pushViewController:PIvc animated:NO];
       

        
        }
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
