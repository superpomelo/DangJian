//
//  SettingUpViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SettingUpViewController.h"
#import "FirstSettingUpTableViewCell.h"
#import "PasswordLoginViewController.h"
#import "TheProblemOfFeedbackViewController.h"
#import "SwitchRootController.h"
#import "InternalChangePasswordViewController.h"
#import "LoginRequestDatas.h"
#import "ExitSettingUpTableViewCell.h"
#import "DQWKViewController.h"
#import "AboutUSViewController.h"
#import "ChangJianWenTiViewController.h"

@interface SettingUpViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    NSArray *_leftInformationArray;
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation SettingUpViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titlesLabel.attributedText = [UILabel getABTbody:@"设置" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    _leftInformationArray = @[@"修改密码",@"推送设置",@"建议反馈",@"关于我们",@"检查更新",@"邀请码",@"退出登录"];
   _leftInformationArray = @[@"修改密码",@"建议反馈",@"退出登录"];
    _leftInformationArray = @[@"常见问题",@"关于我们",@"用户协议",@"隐私政策"];
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstSettingUpTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstSettingUpTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ExitSettingUpTableViewCell" bundle:nil] forCellReuseIdentifier:@"ExitSettingUpTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 55;
            break;
     
        case 1:
            return 100;
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {

        case 0:
            return _leftInformationArray.count;
            break;

        default:
            break;
    }
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        FirstSettingUpTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstSettingUpTableViewCellID"];
        cell.leftLabel.attributedText = [UILabel getABTbody:_leftInformationArray[indexPath.row] font:16 color:SL_UIColorFromHex(666666, 1) zitistyle:@"Source Han Serif CN"];
         return cell;
    }else{
        ExitSettingUpTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ExitSettingUpTableViewCellID"];
        cell.exitLabel.attributedText = [UILabel getABTbody:@"退出登录" font:16 color:SL_UIColorFromRGB(212, 55, 55, 1) zitistyle:@"Source Han Serif CN"];
         return cell;
    }



    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        if (indexPath.row == 0) {
            ChangJianWenTiViewController *Cvc = [[ChangJianWenTiViewController alloc]init];
            [self.navigationController pushViewController:Cvc animated:YES];

        }
        if (indexPath.row == 1) {
            //关于我们
            AboutUSViewController *Avc = [[AboutUSViewController alloc]init];
            [self.navigationController pushViewController:Avc animated:YES];
        }

        if (indexPath.row == 2) {
            /// 跳转用户协议界面
            NSLog(@"跳转用户协议界面");
            DQWKViewController *PIvc = [[DQWKViewController alloc]initWithNibName:@"DQWKViewController" bundle:nil];
            PIvc.urlstring = @"http://111.74.0.243:9161/";

            [self.navigationController pushViewController:PIvc animated:NO];
        }
        if (indexPath.row == 3) {
            /// 跳转隐私政策界面
            NSLog(@"跳转隐私政策界面");
            DQWKViewController *PIvc = [[DQWKViewController alloc]initWithNibName:@"DQWKViewController" bundle:nil];
            PIvc.urlstring = @"http://111.74.0.243:9162/";
            [self.navigationController pushViewController:PIvc animated:NO];
        }
        if (indexPath.row == 100) {
            UIAlertController *userIconActionSheets = [UIAlertController alertControllerWithTitle:@"前往查看更新" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
                
            UIAlertAction *settingAction = [UIAlertAction actionWithTitle:@"前往" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
                    [[UIApplication sharedApplication]openURL:[NSURL URLWithString:@""]];//更换id即可 如：itms-apps://itunes.apple.com/cn/app/id1485220379?mt=8
            }];
            UIAlertAction *cancelActions = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
                        }];
            [userIconActionSheets addAction:settingAction];
            [userIconActionSheets addAction:cancelActions];
            //            [userIconActionSheets addAction:cancelActions];
            userIconActionSheets.modalPresentationStyle = 0;
            [self presentViewController:userIconActionSheets animated:YES completion:nil];
        }
    }
 
    if (indexPath.section == 1) {
        
//        PasswordLoginViewController *PLvc = [[PasswordLoginViewController alloc]init];
//        UINavigationController *nav = [[UINavigationController alloc] initWithRootViewController:PLvc];
//        [self  presentViewController:nav animated:YES completion:nil];
        [self  requestauthtokenlogout];
    }
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**退出登录*/
- (void)requestauthtokenlogout{
    [LoginRequestDatas authtokenlogoutrequestDataWithparameters:nil success:^(id  _Nonnull result) {
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
