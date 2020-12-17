//
//  ZhuTiHuoDongDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ZhuTiHuoDongDetailsViewController.h"
#import "FirstZhuTiHuoDongDetailsTableViewCell.h"
#import "SecondZhuTiHuoDongDetailsTableViewCell.h"
#import "LaborCenterRequestDatas.h"
#import "TaskAssessmentDetailsModel.h"
#import "BaoMingOKView.h"
#import "MyCircleCenterRequestDatas.h"
#import "ZhuTiHuoDongModel.h"

@interface ZhuTiHuoDongDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UIView *topBottomViews;
@property (nonatomic,strong)BaoMingOKView *baomingOiew;
@property (nonatomic,strong)ZhuTiHuoDongModel *model;

@end

@implementation ZhuTiHuoDongDetailsViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
//    if ([IsIphoneX isIphoneX]==NO) {
//        self.topConstraint.constant = -20.0f;
//    }
    self.extendedLayoutIncludesOpaqueBars = YES;

    if (@available(iOS 11.0, *)) {

            self.myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    } else {

            self.automaticallyAdjustsScrollViewInsets = NO;

    }
    [self initmyTableView];
    [self requestactivitymobileActivitygetDetailsrequestDataWithparameters];
//    [self requestactivitymobileActivitysingUp];
//    [self requestmobileActivitygetDetails];
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

-(BaoMingOKView *)baomingOiew{
    if (!_baomingOiew) {
        _baomingOiew = [[NSBundle mainBundle] loadNibNamed:@"BaoMingOKView" owner:self options:nil][0];
        _baomingOiew.frame = self.view.bounds;
        _baomingOiew.whiteBottomView.layer.cornerRadius = 8;
//        _baomingOiew.delegate = self;
////        [_carImmediatelyView settingUI];
        [self.view addSubview:_baomingOiew];
    }
    return _baomingOiew;
}
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
    self.baomingOiew.hidden = YES;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstZhuTiHuoDongDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstZhuTiHuoDongDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondZhuTiHuoDongDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondZhuTiHuoDongDetailsTableViewCellID"];
    
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
        FirstZhuTiHuoDongDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstZhuTiHuoDongDetailsTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];
        }
         return cell;
    }else{
        SecondZhuTiHuoDongDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondZhuTiHuoDongDetailsTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];
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
//    [self requestmobileActivitysingUp];
    [self requestactivitymobileActivitysingUp];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**三会一课，主题活动，党建活动详情*/
- (void)requestactivitymobileActivitygetDetailsrequestDataWithparameters{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];
     para[@"activityId"] = self.activityId;

     para[@"current"] = @"1";
    self.submitButton.userInteractionEnabled = NO;

    [MyCircleCenterRequestDatas activitymobileActivitygetDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.model = result;
        if (self.model.signUpFlag == 0) {
                    //可以报名
                    self.submitButton.userInteractionEnabled = YES;
                    self.submitButton.backgroundColor = kGreenColor;
                    [self.submitButton setTitle:@"报名" forState:UIControlStateNormal];
                }else {
                    //不能报名
                    self.submitButton.userInteractionEnabled = NO;
                    self.submitButton.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
                    [self.submitButton setTitle:@"已报名" forState:UIControlStateNormal];
                }
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**报名*/
- (void)requestactivitymobileActivitysingUp{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];
     para[@"activityId"] = self.activityId;

     para[@"current"] = @"1";
    
    [MyCircleCenterRequestDatas activitymobileActivitysingUprequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.baomingOiew.hidden = NO;
        self.submitButton.userInteractionEnabled = NO;
        self.submitButton.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
        [self.submitButton setTitle:@"已报名" forState:UIControlStateNormal];
//        self.huodongdataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}
/**活动详情*/
//- (void)requestmobileActivitygetDetails{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.model.idx];
//    [LaborCenterRequestDatas mobileActivitygetDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.taskModel = result;
//        [self.myTableView reloadData];
//    } failure:^(NSError * _Nonnull error) {
//
//    }];
//}
///**活动报名*/
//- (void)requestmobileActivitysingUp{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.model.idx];
//    [LaborCenterRequestDatas mobileActivitysingUprequestDataWithparameters:para success:^(id  _Nonnull result) {
//        if ([result[@"data"] boolValue] == YES) {
//            //报名成功
//            [self requestmobileActivitysingUpStatus];
//        }else if ([result[@"data"] boolValue] == NO) {
//            //报名失败
//
//        }
//    } failure:^(NSError * _Nonnull error) {
//
//    }];
//}
//
///**活动报名状态*/
//- (void)requestmobileActivitysingUpStatus{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"activityId"] = [NSString stringWithFormat:@"%d",self.model.idx];
//    [LaborCenterRequestDatas mobileActivitysingUpStatusrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        if ([result[@"data"] boolValue] == YES) {
//            //可以报名
//            self.submitButton.userInteractionEnabled = YES;
//            self.submitButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:219/255.0 blue:142/255.0 alpha:1];
//            [self.submitButton setTitle:@"报名" forState:UIControlStateNormal];
//        }else if ([result[@"data"] boolValue] == NO) {
//            //不能报名
//            self.submitButton.userInteractionEnabled = NO;
//            self.submitButton.backgroundColor = [UIColor colorWithRed:200/255.0 green:200/255.0 blue:200/255.0 alpha:1];
//            [self.submitButton setTitle:@"已报名" forState:UIControlStateNormal];
//        }
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
