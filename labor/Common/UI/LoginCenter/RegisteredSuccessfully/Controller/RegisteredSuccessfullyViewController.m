//
//  RegisteredSuccessfullyViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "RegisteredSuccessfullyViewController.h"

@interface RegisteredSuccessfullyViewController ()
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@end

@implementation RegisteredSuccessfullyViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    self.fd_prefersNavigationBarHidden = YES;

}
//MARK: - Initalization - 初始化
- (void)initUI{
    self.nextButton.layer.cornerRadius = self.nextButton.bounds.size.height/2;

}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)nextButtonAction:(id)sender {
//    [self dismissViewControllerAnimated:YES completion:^{
        [self.navigationController popToRootViewControllerAnimated:NO];

//    }];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
