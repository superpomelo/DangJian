//
//  MyTaskAssessmentViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  任务考核

#import "MyTaskAssessmentViewController.h"
#import "FirstMyTaskAssessmentTableViewCell.h"
#import "PublishTaskViewController.h"
#import "SubmitTaskViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "MyTaskAssessmentDetailsViewController.h"
#import "ZeroTop150JieGuoTableViewCell.h"

@interface MyTaskAssessmentViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *ongoingButton;
@property (weak, nonatomic) IBOutlet UIButton *completedButton;
@property (weak, nonatomic) IBOutlet UIButton *unfinishedButton;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (nonatomic,strong)NSMutableArray *dataArrayM;
/**0待进行  1进行中  2已完成*/
@property (nonatomic,assign)NSInteger state;

@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation MyTaskAssessmentViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.state = 0;
    [self initUI];
    [self initmyTableView];
    [self requestmobileActivitygetMyHaveNotOver];

    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    if (self.state == 0) {
        [self requestmobileActivitygetMyHaveNotOver];
    }
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.lineLabel.layer.cornerRadius = 28/2;
    self.lineLabel.layer.masksToBounds = YES;
    self.titlesLabel.attributedText = [UILabel getABTbody:@"组织活动" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.ongoingButton.selected = YES;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyTaskAssessmentTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyTaskAssessmentTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        /**0待进行  1进行中  2已完成*/
        if (self.state == 0) {
            [self requestmobileActivitygetMyHaveNotOver];

        }else if (self.state == 1) {
            [self requestmobileActivitygetMyHaveSign];

        }else if (self.state == 2) {
            [self requestmobileActivitygetMyHaveOver];

        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArrayM.count == 0) {
        return SCR_H;
    }else{
        switch (indexPath.section) {
            case 0:
                return 120;
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
    if (self.dataArrayM.count == 0) {
        return SCR_H;
    }else{
        switch (section) {
            case 0:
                return self.dataArrayM.count;
                break;

            default:
                break;
        }
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArrayM.count == 0) {
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];

         return cell;
    }else{
        FirstMyTaskAssessmentTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyTaskAssessmentTableViewCellID"];
//    if (self.state == 0) {
//        cell.stateLabel.text = @"进行中";
//    }else if (self.state == 1) {
//        cell.stateLabel.text = @"已完成";
//    }else if (self.state == 2) {
//        cell.stateLabel.text = @"未完成";
//    }
        [cell reloadData:self.dataArrayM[indexPath.row]];
         return cell;
    }
    



    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArrayM.count == 0) {
        
    }else{
        /**0进行中  1已完成  2未完成*/
//        if (self.state == 0) {
//            MyTaskAssessmentDetailsViewController *MTvc = [[MyTaskAssessmentDetailsViewController alloc]init];
//            MTvc.model = self.dataArrayM[indexPath.row];
//            MTvc.state = MyTaskAssessmentDetailsTypeStateOngoing;
//            [self.navigationController pushViewController:MTvc animated:YES];
//        }else if (self.state == 1) {
//            MyTaskAssessmentDetailsViewController *MTvc = [[MyTaskAssessmentDetailsViewController alloc]init];
//            MTvc.model = self.dataArrayM[indexPath.row];
//            MTvc.state = MyTaskAssessmentDetailsTypeStatecomplete;
//            [self.navigationController pushViewController:MTvc animated:YES];
//        }else if (self.state == 2) {
//            MyTaskAssessmentDetailsViewController *MTvc = [[MyTaskAssessmentDetailsViewController alloc]init];
//            MTvc.model = self.dataArrayM[indexPath.row];
//            MTvc.state = MyTaskAssessmentDetailsTypeStateuncomplete;
//            [self.navigationController pushViewController:MTvc animated:YES];
//        }
    }


}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**待进行*/
- (IBAction)ongoingButtonAction:(UIButton*)sender {
    self.state = 0;
    sender.selected = YES;
    self.completedButton.selected = NO;
    self.unfinishedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestmobileActivitygetMyHaveNotOver];

}
/**进行中*/
- (IBAction)completedButtonAction:(UIButton*)sender {
    self.state = 1;
    sender.selected = YES;
    self.ongoingButton.selected = NO;
    self.unfinishedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestmobileActivitygetMyHaveSign];
}
/**已完成*/
- (IBAction)unfinishedButtonAction:(UIButton*)sender {
    self.state = 2;
    sender.selected = YES;
    self.ongoingButton.selected = NO;
    self.completedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestmobileActivitygetMyHaveOver];
}



//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求

/**进行中*/
- (void)requestmobileActivitygetMyHaveSign{
    [PersonalCenterRequestDatas mobileActivitygetMyHaveSignrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArrayM = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.dataArrayM = [NSMutableArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**待进行的活动*/
- (void)requestmobileActivitygetMyHaveNotOver{
    [PersonalCenterRequestDatas mobileActivitygetMyHaveNotOverrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArrayM = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.dataArrayM = [NSMutableArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**已经完成的活动*/
- (void)requestmobileActivitygetMyHaveOver{
    [PersonalCenterRequestDatas mobileActivitygetMyHaveOverrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArrayM = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.dataArrayM = [NSMutableArray array];
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
