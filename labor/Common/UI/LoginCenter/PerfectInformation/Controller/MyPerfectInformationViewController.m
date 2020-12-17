//
//  MyPerfectInformationViewController.m
//  labor
//
//  Created by 狍子 on 2020/10/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyPerfectInformationViewController.h"
#import "PerfectClassViewController.h"
#import "PerfectSchoolViewController.h"
#import "PerfectYuanXiViewController.h"
#import "LoginRequestDatas.h"
#import "SwitchRootController.h"

@interface MyPerfectInformationViewController ()
@property (weak, nonatomic) IBOutlet UILabel *schoolLabel;
@property (weak, nonatomic) IBOutlet UILabel *yuanxiLabel;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UIButton *sureButton;

/**学校*/
@property (nonatomic,strong)NSString *deptId;
/**院系*/
@property (nonatomic,strong)NSString *departmentId;
/**班级*/
@property (nonatomic,strong)NSString *classId;

@property (nonatomic,strong)NSArray *leftdataArray;
@end

@implementation MyPerfectInformationViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.sureButton.layer.cornerRadius = 5;
    self.deptId = @" ";
    self.departmentId = @" ";
    self.classId = @" ";
    self.fd_prefersNavigationBarHidden = YES;

}
//- (void)viewWillAppear:(BOOL)animated{
//    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//}


//MARK: - Initalization - 初始化


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.row == 0) {
//        PerfectSchoolViewController *ICvc = [[PerfectSchoolViewController alloc]init];
//        ICvc.resultBlock = ^(NSString * _Nonnull school) {
//                self.school = school;
//                [self.myTableView reloadData];
//        };
////        MBvc.model = self.model;
//        [self.navigationController pushViewController:ICvc animated:YES];
//    }
//    if (indexPath.row == 1) {
//        PerfectYuanXiViewController *TPvc = [[PerfectYuanXiViewController alloc]init];
//        TPvc.resultBlock = ^(NSString * _Nonnull school) {
//                self.school = school;
//                [self.myTableView reloadData];
//        };
//        [self.navigationController pushViewController:TPvc animated:YES];
//    }
//    if (indexPath.row == 2) {
//        PerfectClassViewController *TPvc = [[PerfectClassViewController alloc]init];
//        [self.navigationController pushViewController:TPvc animated:YES];
//    }
 
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/**学校*/
- (IBAction)xuexiaoButtonAction:(id)sender {
            PerfectSchoolViewController *ICvc = [[PerfectSchoolViewController alloc]init];
         ICvc.resultBlock = ^(SchoolNameModel * _Nonnull models) {
             self.deptId = [NSString stringWithFormat:@"%d",models.deptId];
             self.schoolLabel.text = models.name;
           };

    //        MBvc.model = self.model;
            [self.navigationController pushViewController:ICvc animated:YES];
}
/**院系*/
- (IBAction)yuanxiButtonAction:(id)sender {
    if ([self.deptId isEqualToString:@" "]) {
        [SVProgressHUD showInfoWithStatus:@"请先完善学校信息"];
        return;
    }
            PerfectYuanXiViewController *TPvc = [[PerfectYuanXiViewController alloc]init];
            TPvc.deptId = self.deptId;
    TPvc.resultBlock = ^(PerfectYuanXiModel * _Nonnull models) {
        self.departmentId = [NSString stringWithFormat:@"%d",models.departmentId];
        self.yuanxiLabel.text = models.name;
    };

            [self.navigationController pushViewController:TPvc animated:YES];
}
/**班级*/
- (IBAction)banjiButtonAction:(id)sender {
    if ([self.deptId isEqualToString:@" "]) {
        [SVProgressHUD showInfoWithStatus:@"请先完善学校信息"];
        return;
    }
    if ([self.departmentId isEqualToString:@" "]) {
        [SVProgressHUD showInfoWithStatus:@"请先完善院系信息"];
        return;
    }
    
            PerfectClassViewController *TPvc = [[PerfectClassViewController alloc]init];
           TPvc.deptpartmentId = self.departmentId;
    TPvc.resultBlock = ^(PerfectClassModel * _Nonnull models) {
        self.classId = [NSString stringWithFormat:@"%d",models.classId];;
        self.classLabel.text = models.name;
    };

            [self.navigationController pushViewController:TPvc animated:YES];
}
/**确定*/
- (IBAction)sureButtonAction:(UIButton*)sender {
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    [self requestmobileUserputover];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求

/**完善信息<学校，院系，班级>*/
- (void)requestmobileUserputover{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"deptId"] = self.deptId;
    para[@"departmentId"] = self.departmentId;
    para[@"classId"] = self.classId;
    [LoginRequestDatas mobileUserputoverrequestDataWithparameters:para success:^(id  _Nonnull result) {
        [SwitchRootController goHomeViewController];

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
