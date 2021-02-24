//
//  MyTestViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/4.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyTestViewController.h"
#import "FirstMyTestTableViewCell.h"
#import "TheTestViewController.h"
#import "LaborCenterRequestDatas.h"
#import "TheExamRushedOffModel.h"
#import "ExaminationResultsViewController.h"
#import "ZeroTop150JieGuoTableViewCell.h"

@interface MyTestViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation MyTestViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    [self initUI];
    [self initmyTableView];
    [self requestmobileEvaluationgetExamVoPage];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"我的考试" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
//    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyTestTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestmobileEvaluationgetExamVoPage];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        return SCR_H;
    }else{
        return 100;
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataArray.count == 0) {
        return 1;

    }else{
        return self.dataArray.count;

    }
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
        return cell;

    }else{
        FirstMyTestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyTestTableViewCellID"];
        [cell reloadData:self.dataArray[indexPath.row]];
        return cell;
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        

    }else{
        TheExamRushedOffModel *model = self.dataArray[indexPath.row];
        if (model.status == 1) {
          //已考试
            
            ExaminationResultsViewController *ERvc = [[ExaminationResultsViewController alloc]init];
            ERvc.model = model;
            ERvc.from = ExaminationResultsPersonal;

            [self.navigationController pushViewController:ERvc animated:YES];
        }else{
            //未考试
             TheTestViewController *TTvc = [[TheTestViewController alloc]init];
             TTvc.model = model;
             TTvc.from = ExaminationResultsPersonal;

             [self.navigationController pushViewController:TTvc animated:YES];
        }

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
            [self.navigationController pushViewController:ERvc animated:YES];
        }else{
            //未考试
             TheTestViewController *TTvc = [[TheTestViewController alloc]init];
             TTvc.model = model;
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
