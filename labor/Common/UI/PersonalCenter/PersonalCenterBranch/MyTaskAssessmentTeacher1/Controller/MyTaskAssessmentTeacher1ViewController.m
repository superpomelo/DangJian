//
//  MyTaskAssessmentTeacher1ViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  活动完成度

#import "MyTaskAssessmentTeacher1ViewController.h"
#import "FirstMyTaskAssessmentTeacher1TableViewCell.h"
#import "SecondMyTaskAssessmentTeacher1TableViewCell.h"

#import "MyTaskAssessmentTeacher2ViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "MyTaskAssessmentTeacher1Model.h"
#import "MyTaskAssessmentTeacherDetailsViewController.h"

@interface MyTaskAssessmentTeacher1ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)MyTaskAssessmentTeacher1Model *model;
@end

@implementation MyTaskAssessmentTeacher1ViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initmyTableView];
    [self requestactivitypageforteacher];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
  
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyTaskAssessmentTeacher1TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyTaskAssessmentTeacher1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyTaskAssessmentTeacher1TableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyTaskAssessmentTeacher1TableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 52.5;
            break;
        case 1:
            return 150;
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
            return 1;
            break;
        case 1:
            return 1;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstMyTaskAssessmentTeacher1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyTaskAssessmentTeacher1TableViewCellID"];
        [cell reloadData:self.modelLast.title];
             return cell;
    }else{
        SecondMyTaskAssessmentTeacher1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyTaskAssessmentTeacher1TableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.modelLast model1:self.model];
        }
             return cell;
    }



    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        
        MyTaskAssessmentTeacherDetailsViewController *MTvc = [[MyTaskAssessmentTeacherDetailsViewController alloc]init];
        MTvc.idx = [NSString stringWithFormat:@"%d",self.modelLast.idx];
        [self.navigationController pushViewController:MTvc animated:YES];
    }else{
        MyTaskAssessmentTeacher2ViewController *MTvc = [[MyTaskAssessmentTeacher2ViewController alloc]init];
        MTvc.modelLast = self.modelLast;
        MTvc.idx = [NSString stringWithFormat:@"%d",self.modelLast.idx];
        MTvc.status = self.status;
        [self.navigationController pushViewController:MTvc animated:YES];
    }
  
    
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求

/**教师端进行中的活动详情1MyTaskAssessmentTeacher1*/
- (void)requestactivitypageforteacher{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.modelLast.idx];
    [PersonalCenterRequestDatas activitypageforteacherrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.model = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**教师端结束的活动详情1 MyTaskAssessmentTeacher1*/
//- (void)requestactivitypageforteacherover{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.modelLast.idx];
//    [PersonalCenterRequestDatas activitypageforteacheroverrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.model = result;
//        [self.myTableView reloadData];
//    } failure:^(NSError * _Nonnull error) {
//
//    }];
//}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
