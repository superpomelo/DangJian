//
//  TaskAssessmentDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  任务考核详情

#import "TaskAssessmentDetailsViewController.h"
#import "FirstTaskAssessmentDetailsTableViewCell.h"
#import "SecondTaskAssessmentDetailsTableViewCell.h"
#import "LaborCenterRequestDatas.h"
#import "TaskAssessmentDetailsModel.h"

@interface TaskAssessmentDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic,strong)TaskAssessmentDetailsModel *taskModel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UIView *topBottomViews;

@end

@implementation TaskAssessmentDetailsViewController

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
    [self requestmobileActivitysingUpStatus];
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
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,SCR_W,self.topBottomViews.bounds.size.height);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(0, 1);

    gl.colors = @[(__bridge id)[UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.5].CGColor,(__bridge id)[UIColor clearColor].CGColor];
    gl.locations = @[@(0.0),@(1.0)];

    [self.topBottomViews.layer addSublayer:gl];
    
    self.submitButton.userInteractionEnabled = NO;
    self.submitButton.layer.cornerRadius = self.submitButton.bounds.size.height/2;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstTaskAssessmentDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTaskAssessmentDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondTaskAssessmentDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondTaskAssessmentDetailsTableViewCellID"];
    
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
        FirstTaskAssessmentDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstTaskAssessmentDetailsTableViewCellID"];
        if (self.taskModel != nil) {
            [cell reloadData:self.taskModel];
        }
         return cell;
    }else{
        SecondTaskAssessmentDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondTaskAssessmentDetailsTableViewCellID"];
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
    [self requestmobileActivitysingUp];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**活动详情*/
- (void)requestmobileActivitygetDetails{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    [LaborCenterRequestDatas mobileActivitygetDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.taskModel = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**活动报名*/
- (void)requestmobileActivitysingUp{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    [LaborCenterRequestDatas mobileActivitysingUprequestDataWithparameters:para success:^(id  _Nonnull result) {
        if ([result[@"data"] boolValue] == YES) {
            //报名成功
            [self requestmobileActivitysingUpStatus];
        }else if ([result[@"data"] boolValue] == NO) {
            //报名失败

        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**活动报名状态*/
- (void)requestmobileActivitysingUpStatus{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    [LaborCenterRequestDatas mobileActivitysingUpStatusrequestDataWithparameters:para success:^(id  _Nonnull result) {
        if ([result[@"data"] boolValue] == YES) {
            //可以报名
            self.submitButton.userInteractionEnabled = YES;
            self.submitButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:219/255.0 blue:142/255.0 alpha:1];
            [self.submitButton setTitle:@"报名" forState:UIControlStateNormal];
        }else if ([result[@"data"] boolValue] == NO) {
            //不能报名
            self.submitButton.userInteractionEnabled = NO;
            self.submitButton.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
            [self.submitButton setTitle:@"已报名" forState:UIControlStateNormal];
        }
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
