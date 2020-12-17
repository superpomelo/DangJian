//
//  TheExamRushedOffViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  考试冲关

#import "TheExamRushedOffViewController.h"
#import "FirstTheExamRushedOffTableViewCell.h"
#import "TheTestViewController.h"
#import "LaborCenterRequestDatas.h"
#import "TheExamRushedOffModel.h"
#import "ExaminationResultsViewController.h"
#import "ZeroTop150JieGuoTableViewCell.h"

@interface TheExamRushedOffViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;

@end

@implementation TheExamRushedOffViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    [self initmyTableView];
    [self requestmobileEvaluationgetExamVoPage];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstTheExamRushedOffTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTheExamRushedOffTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestmobileEvaluationgetExamVoPage];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        return SCR_H;
    }else{
        
        switch (indexPath.section) {
            case 0:
                return 100;
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
        FirstTheExamRushedOffTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstTheExamRushedOffTableViewCellID"];
        [cell reloadData:self.dataArray[indexPath.row]];
         return cell;
    }

    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        
    }else{
        [self requestmobileEvaluationcheckexamexamId:self.dataArray[indexPath.row]];

    }
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**在线测评分页*/
- (void)requestmobileEvaluationgetExamVoPage{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"current"] = @"6";
//    para[@"current"] = @"6";

    [LaborCenterRequestDatas mobileEvaluationgetExamVoPagerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = [NSArray array];
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
/**判断已考试*/
- (void)requestmobileEvaluationcheckexamexamId:(TheExamRushedOffModel*)model{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"examId"] = [NSString stringWithFormat:@"%d",model.idx];
//    para[@"current"] = @"6";

    [LaborCenterRequestDatas mobileEvaluationcheckexamrequestDataWithparameters:para success:^(id  _Nonnull result) {
        if ([result[@"data"] boolValue] == NO) {
          //已考试
            
            ExaminationResultsViewController *ERvc = [[ExaminationResultsViewController alloc]init];
            ERvc.model = model;
            ERvc.from = ExaminationResultsHome;
            [self.navigationController pushViewController:ERvc animated:YES];
        }else{
            //未考试
             TheTestViewController *TTvc = [[TheTestViewController alloc]init];
             TTvc.model = model;
             TTvc.from = ExaminationResultsHome;

             [self.navigationController pushViewController:TTvc animated:YES];
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
