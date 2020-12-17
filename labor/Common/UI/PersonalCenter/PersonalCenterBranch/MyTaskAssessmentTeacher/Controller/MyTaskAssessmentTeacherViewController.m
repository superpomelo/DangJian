//
//  MyTaskAssessmentTeacherViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyTaskAssessmentTeacherViewController.h"
#import "MyTaskAssessmentTeacherTableViewCell.h"
#import "PublishTaskViewController.h"
#import "MyTaskAssessmentTeacher1ViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "MyTaskAssessmentTeacherModel.h"
#import "ZeroTop150JieGuoTableViewCell.h"

@interface MyTaskAssessmentTeacherViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *ongoingButton;
@property (weak, nonatomic) IBOutlet UIButton *completedButton;
@property (weak, nonatomic) IBOutlet UIButton *unfinishedButton;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UIView *publishButtomView;
@property (nonatomic,strong)NSArray *dataArray;
/**0进行中，1已结束*/
@property (nonatomic,assign)int tagT;

@end

@implementation MyTaskAssessmentTeacherViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    self.tagT = 0;
    [self initUI];
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    if (self.tagT == 0) {
        [self requestmobileActivitypageforteacher];

    }else{
        [self requestmobileActivitypageforteacherover];

    }
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.ongoingButton.selected = YES;
    self.publishButtomView.layer.cornerRadius = 30/2;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"MyTaskAssessmentTeacherTableViewCell" bundle:nil] forCellReuseIdentifier:@"MyTaskAssessmentTeacherTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (self.tagT == 0) {
            [self requestmobileActivitypageforteacher];
        }else{
            [self requestmobileActivitypageforteacherover];
        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        return SCR_H-50;
    }else{
        switch (indexPath.section) {
            case 0:
                return 115;
                break;
            default:
                break;
        }
        return 0;
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArray.count == 0) {
        return 1;
    }else{
        switch (section) {
            case 0:
                return self.dataArray.count;
                break;

            default:
                break;
        }
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
        return cell;
    }else{
        MyTaskAssessmentTeacherTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"MyTaskAssessmentTeacherTableViewCellID"];
        [cell reloadData:self.dataArray[indexPath.row] tagt:self.tagT];
        return cell;
    }



    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {

    }else{
        if (self.tagT == 0) {
            //进行中
            MyTaskAssessmentTeacher1ViewController *MTvc = [[MyTaskAssessmentTeacher1ViewController alloc]init];
            MyTaskAssessmentTeacherModel *model = self.dataArray[indexPath.row];
            
            MTvc.modelLast = model;
            MTvc.status = MyTaskAssessmentTeacher2ongoing;
            [self.navigationController pushViewController:MTvc animated:YES];
        }else{
            //已结束
            MyTaskAssessmentTeacher1ViewController *MTvc = [[MyTaskAssessmentTeacher1ViewController alloc]init];
            MyTaskAssessmentTeacherModel *model = self.dataArray[indexPath.row];
            MTvc.modelLast = model;
            MTvc.status = MyTaskAssessmentTeacher2end;

            [self.navigationController pushViewController:MTvc animated:YES];
        }
    }


    
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**进行中*/
- (IBAction)ongoingButtonAction:(UIButton*)sender {
    self.tagT = 0;
    sender.selected = YES;
    self.completedButton.selected = NO;
    self.unfinishedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestmobileActivitypageforteacher];

}
/**已完成*/
- (IBAction)completedButtonAction:(UIButton*)sender {
    self.tagT = 1;
    sender.selected = YES;
    self.ongoingButton.selected = NO;
    self.unfinishedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestmobileActivitypageforteacherover];

}
/**未完成*/
- (IBAction)unfinishedButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.ongoingButton.selected = NO;
    self.completedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
}
/**发布*/
- (IBAction)publishButtonAction:(id)sender {
    PublishTaskViewController *PTvc = [[PublishTaskViewController alloc]init];
    [PTvc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:PTvc animated:YES];
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**教师端已结束的活动*/
- (void)requestmobileActivitypageforteacherover{
    [PersonalCenterRequestDatas mobileActivitypageforteacheroverrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.dataArray = [NSArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**教师端进行中的活动*/
- (void)requestmobileActivitypageforteacher{
    [PersonalCenterRequestDatas mobileActivitypageforteacherrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.dataArray = [NSArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
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
