//
//  WoDeGuShiFangViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "WoDeGuShiFangViewController.h"
#import "FirstWoDeGuShiFangTableViewCell.h"
#import "ZeroTop150JieGuoTableViewCell.h"
#import "FaBuGuShiViewController.h"
#import "PersonalCenterRequestDatas.h"

@interface WoDeGuShiFangViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation WoDeGuShiFangViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
    [self initUI];
    [self initmyTableView];
//    [self requestmobileEvaluationgetExamVoPage];
    self.fd_prefersNavigationBarHidden = YES;
    [self requestregisteredupdatemyzonegetmineList];

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self requestregisteredupdatemyzonegetmineList];

}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"我的故事坊" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.submitButton.layer.cornerRadius = 3;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
//    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstWoDeGuShiFangTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstWoDeGuShiFangTableViewCellID"];
 
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
//    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self requestmobileEvaluationgetExamVoPage];
//    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.dataArray.count == 0) {
//        return SCR_H;
//
//    }else{
//        if (indexPath.section==0) {
//            return 100;
//        }
//        return 100;
//
//    }
    return UITableViewAutomaticDimension;


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
   
        return 1;

}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArray.count == 0) {
        return 1;
    }else{
        return self.dataArray.count;

    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
        return cell;

    }else{
            FirstWoDeGuShiFangTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstWoDeGuShiFangTableViewCellID"];
            [cell reloadData:self.dataArray[indexPath.row]];
            return cell;
        

    }


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   

}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**跳转到发布故事坊*/
- (IBAction)submitButtonAction:(id)sender {
    FaBuGuShiViewController *FBvc = [[FaBuGuShiViewController alloc]init];
    [self.navigationController pushViewController:FBvc animated:YES];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**我的故事坊列表*/
- (void)requestregisteredupdatemyzonegetmineList{
    [PersonalCenterRequestDatas registeredupdatemyzonegetmineListrequestDataWithparameters:nil success:^(id  _Nonnull result) {
//        self.model = result;
        self.dataArray = result;
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
