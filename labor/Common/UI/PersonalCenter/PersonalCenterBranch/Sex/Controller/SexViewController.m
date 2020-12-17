//
//  SexViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SexViewController.h"
#import "PersonalCenterRequestDatas.h"

@interface SexViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *nanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *nvImageView;
@property (weak, nonatomic) IBOutlet UIButton *submitButtonAction;
@property (nonatomic,strong)NSString *sexStr;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation SexViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    self.fd_prefersNavigationBarHidden = YES;

}

- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"选择性别" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    
    self.submitButtonAction.layer.cornerRadius = 5;

    self.nanImageView.hidden = NO;
    self.nvImageView.hidden = YES;
    self.sexStr = @"男";
}
/**男*/
- (IBAction)nanButtonAction:(id)sender {
    self.nvImageView.hidden = YES;
    self.nanImageView.hidden = NO;
    self.sexStr = @"男";
}
/**女*/
- (IBAction)nvnButtonAction:(id)sender {
    self.nvImageView.hidden = NO;
    self.nanImageView.hidden = YES;
    self.sexStr = @"女";
}
/**确定*/
- (IBAction)submitButtonAction:(id)sender {
   

    
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"avatar"] = self.model.avatar;
    para[@"birthday"] = self.model.birthday;
    para[@"deptId"] = [NSString stringWithFormat:@"%d",self.model.deptId];

    para[@"partyNumber"] = [NSString stringWithFormat:@"%d",self.model.partyNumber];
    para[@"phone"] = [NSString stringWithFormat:@"%d",self.model.phone];
    para[@"realName"] = self.model.realName;
    para[@"sex"] = self.sexStr;
    para[@"username"] = self.model.username;
    
    [self requestmobileUsermyInfo:para];
    
    

}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**个人信息修改*/
- (void)requestmobileUsermyInfo:(NSMutableDictionary*)para{

    [PersonalCenterRequestDatas mobileUsermyInforequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.resultBlock(self.sexStr);
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
