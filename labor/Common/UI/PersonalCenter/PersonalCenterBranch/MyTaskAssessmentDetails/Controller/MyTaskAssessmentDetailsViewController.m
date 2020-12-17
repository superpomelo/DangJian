//
//  MyTaskAssessmentDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyTaskAssessmentDetailsViewController.h"

#import "LaborCenterRequestDatas.h"
#import "TaskAssessmentDetailsModel.h"
#import "FirstMyTaskAssessmentDetailsTableViewCell.h"
#import "SecondMyTaskAssessmentDetailsTableViewCell.h"
#import "SubmitTaskViewController.h"

@interface MyTaskAssessmentDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)TaskAssessmentDetailsModel *taskModel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;

@end

@implementation MyTaskAssessmentDetailsViewController

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

    self.submitButton.userInteractionEnabled = NO;
    self.submitButton.layer.cornerRadius = self.submitButton.bounds.size.height/2;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyTaskAssessmentDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyTaskAssessmentDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyTaskAssessmentDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyTaskAssessmentDetailsTableViewCellID"];
    
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
        FirstMyTaskAssessmentDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyTaskAssessmentDetailsTableViewCellID"];
        if (self.taskModel != nil) {
            [cell reloadData:self.taskModel];
        }
         return cell;
    }else{
        SecondMyTaskAssessmentDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyTaskAssessmentDetailsTableViewCellID"];
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
- (IBAction)submitButtonAction:(id)sender {
    SubmitTaskViewController *STvc = [[SubmitTaskViewController alloc]init];
    STvc.model = self.model;
    [self.navigationController pushViewController:STvc animated:YES];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**活动详情*/
- (void)requestmobileActivitygetDetails{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    [LaborCenterRequestDatas mobileActivitygetDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
        //进行中
        if (self.state == MyTaskAssessmentDetailsTypeStateOngoing) {
            self.submitButton.hidden = NO;
            self.submitButton.userInteractionEnabled = YES;

        }else if (self.state == MyTaskAssessmentDetailsTypeStatecomplete) {
            self.submitButton.hidden = NO;
            self.submitButton.userInteractionEnabled = NO;
            [self.submitButton setTitle:@"已提交" forState:UIControlStateNormal];

        }else if (self.state == MyTaskAssessmentDetailsTypeStateuncomplete) {
            self.submitButton.hidden = NO;
            self.submitButton.userInteractionEnabled = NO;
            [self.submitButton setTitle:@"已过期" forState:UIControlStateNormal];

        }

        self.taskModel = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        self.submitButton.userInteractionEnabled = NO;

        
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
