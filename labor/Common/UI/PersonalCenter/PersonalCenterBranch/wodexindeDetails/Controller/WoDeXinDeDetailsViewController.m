//
//  WoDeXinDeDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "WoDeXinDeDetailsViewController.h"
#import "FirstWoDeXinDeDetailsTableViewCell.h"
#import "SecondWoDeXinDeDetailsTableViewCell.h"
#import "ZeroTop150JieGuoTableViewCell.h"

@interface WoDeXinDeDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation WoDeXinDeDetailsViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    self.dataArray = @[@""];
    [self initUI];
    [self initmyTableView];
//    [self requestmobileEvaluationgetExamVoPage];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
//    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstWoDeXinDeDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstWoDeXinDeDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondWoDeXinDeDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondWoDeXinDeDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
//    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self requestmobileEvaluationgetExamVoPage];
//    }];
}

//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.dataArray.count == 0) {
//        return SCR_H;
//
//    }else{
//        if (indexPath.section==0) {
//            return 200;
//        }
//        return 100;
//
//    }
//
//
//}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return UITableViewAutomaticDimension;

    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataArray.count == 0) {
        return 1;

    }else{
        return 2;

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
        if (indexPath.section==0) {
            FirstWoDeXinDeDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstWoDeXinDeDetailsTableViewCellID"];
    //        [cell reloadData:self.dataArray[indexPath.row]];
            cell.titieLabel.text = self.title;
            return cell;
        }else{
            SecondWoDeXinDeDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondWoDeXinDeDetailsTableViewCellID"];
    //        [cell reloadData:self.dataArray[indexPath.row]];
            cell.bodyLabel.text = self.body;
            return cell;
        }


    }


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   

}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
