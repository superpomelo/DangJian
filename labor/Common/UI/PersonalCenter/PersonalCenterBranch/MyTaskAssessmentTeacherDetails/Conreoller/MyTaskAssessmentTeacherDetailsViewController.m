//
//  MyTaskAssessmentTeacherDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/10/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyTaskAssessmentTeacherDetailsViewController.h"
#import "FirstMyTaskAssessmentTeacherDetailsTableViewCell.h"
#import "SecondMyTaskAssessmentTeacherDetailsTableViewCell.h"
#import "LaborCenterRequestDatas.h"
#import "TaskAssessmentDetailsModel.h"

@interface MyTaskAssessmentTeacherDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)TaskAssessmentDetailsModel *taskModel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@end

@implementation MyTaskAssessmentTeacherDetailsViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    if ([IsIphoneX isIphoneX]==NO) {
        self.topConstraint.constant = -20.0f;
    }
    self.extendedLayoutIncludesOpaqueBars = YES;

    if (@available(iOS 11.0, *)) {

            self.myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    } else {

            self.automaticallyAdjustsScrollViewInsets = NO;

    }
    [self initmyTableView];
    [self requestmobileActivitygetDetails];
//    [self requestmobileActivitysingUpStatus];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

-(void)viewWillDisappear:(BOOL)animated{

[super viewWillDisappear:animated];

[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}
//MARK: - Initalization - 初始化
- (void)initUI{

}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyTaskAssessmentTeacherDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyTaskAssessmentTeacherDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyTaskAssessmentTeacherDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyTaskAssessmentTeacherDetailsTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;
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
        FirstMyTaskAssessmentTeacherDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyTaskAssessmentTeacherDetailsTableViewCellID"];
        if (self.taskModel != nil) {
            [cell reloadData:self.taskModel];
        }
         return cell;
    }else{
        SecondMyTaskAssessmentTeacherDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyTaskAssessmentTeacherDetailsTableViewCellID"];
        if (self.taskModel != nil) {
            [cell reloadData:self.taskModel];
        }
         return cell;
    }

    

}

//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**活动详情*/
- (void)requestmobileActivitygetDetails{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = self.idx;
    [LaborCenterRequestDatas mobileActivitygetDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.taskModel = result;
        [self.myTableView reloadData];
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
