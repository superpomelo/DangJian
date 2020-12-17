//
//  MyTaskAssessmentTeacher2ViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  班级完成度

#import "MyTaskAssessmentTeacher2ViewController.h"
#import "FirstMyTaskAssessmentTeacher2TableViewCell.h"
#import "MyTaskAssessmentTeacher3ViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "MyTaskAssessmentTeacher2Model.h"

@interface MyTaskAssessmentTeacher2ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *completedButton;
@property (weak, nonatomic) IBOutlet UIButton *unfinishedButton;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
/**一键提醒*/
@property (weak, nonatomic) IBOutlet UIButton *aKeyToRemindButton;
@property (nonatomic,strong)NSArray *dataArray;
/**0已提交 1未提交*/
@property (nonatomic,assign)int tagt;

@end

@implementation MyTaskAssessmentTeacher2ViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    self.tagt = 0;
    [self initUI];
    [self initmyTableView];
    [self requestactivitygethavedown];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.aKeyToRemindButton.hidden = YES;
    self.completedButton.selected = YES;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyTaskAssessmentTeacher2TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyTaskAssessmentTeacher2TableViewCellID"];
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 55;
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return self.dataArray.count;
            break;

        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
   
    FirstMyTaskAssessmentTeacher2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyTaskAssessmentTeacher2TableViewCellID"];
    [cell reloadData:self.dataArray[indexPath.row] tagt:self.tagt status:self.status];
    return cell;


    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.tagt == 0) {
        //查看学生提交的活动详情
        MyTaskAssessmentTeacher2Model *model = self.dataArray[indexPath.row];
        MyTaskAssessmentTeacher3ViewController *MTvc = [[MyTaskAssessmentTeacher3ViewController alloc]init];
        MTvc.userId = [NSString stringWithFormat:@"%d",model.userId];
        MTvc.activityId = self.idx;
        MTvc.realName = model.realName;
        MTvc.className = self.modelLast.className;
        MTvc.titleName = self.modelLast.title;
        [self.navigationController pushViewController:MTvc animated:YES];
    }else{
        if (self.status == MyTaskAssessmentTeacher2ongoing) {
            //提醒学生上传活动详情
            MyTaskAssessmentTeacher2Model *model2 = self.dataArray[indexPath.row];
            [self requestremindaddremind:[NSString stringWithFormat:@"%d",model2.userId]];
        }

    }

    
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

/**已提交*/
- (IBAction)completedButtonAction:(UIButton*)sender {
    self.tagt = 0;
    [self.aKeyToRemindButton mas_remakeConstraints:^(MASConstraintMaker *make) {
      
        make.size.mas_equalTo(CGSizeMake(SCR_W, 0));

    }];
    if (self.status == MyTaskAssessmentTeacher2ongoing ) {
        self.aKeyToRemindButton.hidden = YES;

    }else{
        self.aKeyToRemindButton.hidden = YES;

    }
    sender.selected = YES;
    self.unfinishedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestactivitygethavedown];
}

/**未提交*/
- (IBAction)unfinishedButtonAction:(UIButton*)sender {
    self.tagt = 1;
    [self.aKeyToRemindButton mas_remakeConstraints:^(MASConstraintMaker *make) {
      
        make.size.mas_equalTo(CGSizeMake(SCR_W, 55));

    }];
    if (self.status == MyTaskAssessmentTeacher2ongoing ) {
        self.aKeyToRemindButton.hidden = NO;

    }else{
        self.aKeyToRemindButton.hidden = YES;

    }

    sender.selected = YES;
    self.completedButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestactivitygetnotdo];
}
/**一键提醒*/
- (IBAction)aKeyToRemindButtonAction:(id)sender {
    [self requestremindaddremindall];
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**教师端学生已提交的活动*/
- (void)requestactivitygethavedown{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = self.idx;
    [PersonalCenterRequestDatas activitygethavedownrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**教师端学生未提交活动*/
- (void)requestactivitygetnotdo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = self.idx;
    [PersonalCenterRequestDatas activitygetnotdorequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**教师端提醒单个学生提交活动*/
- (void)requestremindaddremind:(NSString*)userId{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = self.idx;
    para[@"userId"] = userId;
    [PersonalCenterRequestDatas remindaddremindrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**教师端提醒一键提醒学生提交活动*/
- (void)requestremindaddremindall{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = self.idx;
//    para[@"userId"] = userId;
    [PersonalCenterRequestDatas remindaddremindallrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
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
