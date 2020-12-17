//
//  GuanXiZhuanJie1ViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "GuanXiZhuanJie1ViewController.h"
#import "FirstGuanXiZhuanJie1TableViewCell.h"
#import "SecondGuanXiZhuanJie1TableViewCell.h"
#import "ZeroTop150JieGuoTableViewCell.h"
#import "GuanXiZhuanJie2ViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "Guanxizhuanjie1Model.h"

@interface GuanXiZhuanJie1ViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSString *titless;
@end

@implementation GuanXiZhuanJie1ViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArray = [NSArray array];
//    self.dataArray = @[@""];
    [self initUI];
    [self initmyTableView];
    [self requestadminsysuserchangesgetAllDeptList];
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
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstGuanXiZhuanJie1TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstGuanXiZhuanJie1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondGuanXiZhuanJie1TableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondGuanXiZhuanJie1TableViewCellID"];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
//    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self requestmobileEvaluationgetExamVoPage];
//    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        return SCR_H;

    }else{
        if (indexPath.section==0) {
            return 60;
        }else{
            return 50;


        }
    }


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataArray.count == 0) {
        return 1;

    }else{
        return 2;

    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
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
        if (indexPath.section == 0) {
            FirstGuanXiZhuanJie1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstGuanXiZhuanJie1TableViewCellID"];
    //        [cell reloadData:self.dataArray[indexPath.row]];
            cell.leftLabel.text = self.titless;
            return cell;
        }else{
            SecondGuanXiZhuanJie1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondGuanXiZhuanJie1TableViewCellID"];
            [cell reloadData:self.dataArray[indexPath.row]];
            return cell;
        }

        

    }


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count==0 ){
        return;;
    }
    Guanxizhuanjie1Model *model = self.dataArray[indexPath.row];
    GuanXiZhuanJie2ViewController *GXvc = [[GuanXiZhuanJie2ViewController alloc]init];
    GXvc.model = model;
    [self.navigationController  pushViewController:GXvc animated:YES];

}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**关系转接列表*/
- (void)requestadminsysuserchangesgetAllDeptList{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"body"] = self.body;
//    para[@"title"] = self.titless;
    [PersonalCenterRequestDatas adminsysuserchangesgetAllDeptListrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        self.dataArray =  [Guanxizhuanjie1Model mj_objectArrayWithKeyValuesArray:dict[@"data"][@"list"]]; //数组
        
        NSDictionary *dict1 = [NSDictionary dictionary];
        dict1 = dict[@"data"];
        if ([dict1.allKeys containsObject:@"deptvo"]) {
            NSDictionary *dict2 = [NSDictionary dictionary];
            dict2 = dict1[@"deptvo"];
            if ([dict2.allKeys containsObject:@"name"]) {
                self.titless = dict2[@"name"];
                [self.myTableView reloadData];

            }

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
