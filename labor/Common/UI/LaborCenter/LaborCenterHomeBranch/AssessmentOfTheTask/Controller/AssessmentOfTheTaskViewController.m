//
//  AssessmentOfTheTaskViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  任务考核

#import "AssessmentOfTheTaskViewController.h"
#import "FirstAssessmentOfTheTaskTableViewCell.h"
#import "TaskAssessmentDetailsViewController.h"
#import "LaborCenterRequestDatas.h"
#import "AssessmentOfTheTaskModel.h"
#import "ZeroTop150JieGuoTableViewCell.h"

@interface AssessmentOfTheTaskViewController ()<UITableViewDelegate,UITableViewDataSource>
/**必选/自选 分段控件*/
@property (weak, nonatomic) IBOutlet UISegmentedControl *segment;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSMutableArray *dataArrayM;
@end

@implementation AssessmentOfTheTaskViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArrayM = [NSMutableArray array];
    [self initUI];
    [self initmyTableView];
    [self requestmobileActivitygetPage:@"1"];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    //    选中的颜色
        [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateSelected];
        //    未选中的颜色
//        [self.segment setTitleTextAttributes:@{NSForegroundColorAttributeName:[UIColor whiteColor]} forState:UIControlStateNormal];
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstAssessmentOfTheTaskTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstAssessmentOfTheTaskTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (self.segment.selectedSegmentIndex == 0) {
                [self requestmobileActivitygetPage:@"1"];
        }else{
            [self requestmobileActivitygetPage:@"2"];

        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArrayM.count == 0) {
        return SCR_H;
    }else{
        switch (indexPath.section) {
            case 0:
                return 140;
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
        return 1;
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
        FirstAssessmentOfTheTaskTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstAssessmentOfTheTaskTableViewCellID"];
         [cell reloadData:self.dataArrayM[indexPath.row]];
         return cell;
     
    }


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArrayM.count == 0) {
    
     
    }else{
        TaskAssessmentDetailsViewController *TAvc = [[TaskAssessmentDetailsViewController alloc]init];
        TAvc.model = self.dataArrayM[indexPath.row];
        [self.navigationController pushViewController:TAvc animated:YES];
     
    }
  
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件

- (IBAction)SegmentedAction:(UISegmentedControl*)sender {
    NSInteger index = sender.selectedSegmentIndex;
    NSLog(@"%ld",index);
    if (index == 0) {
        [self requestmobileActivitygetPage:@"1"];
    }else if (index == 1) {
        [self requestmobileActivitygetPage:@"2"];

    }
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
- (void)requestmobileActivitygetPage:(NSString*)categoryId{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //1-必选 ，2-非必选
    para[@"categoryId"] = categoryId;
    [LaborCenterRequestDatas mobileActivitygetPagerequestDataWithparameters:para success:^(id  _Nonnull result) {
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
