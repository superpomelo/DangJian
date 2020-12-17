//
//  TheMessageCenterViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "TheMessageCenterViewController.h"
#import "FirstTheMessageCenterTableViewCell.h"
#import "LaborCenterRequestDatas.h"
#import "ZeroTop150JieGuoTableViewCell.h"

@interface TheMessageCenterViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *array;
@end

@implementation TheMessageCenterViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.array = [NSArray array];
    [self initmyTableView];
    [self requestremindMYREMIND];
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
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstTheMessageCenterTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTheMessageCenterTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestremindMYREMIND];
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.array.count == 0) {
        return SCR_H;
    }else{
        switch (indexPath.section) {
            case 0:
                return 95;
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
    if (self.array.count == 0) {
        return 1;
    }else{
        switch (section) {
            case 0:
                return self.array.count;
                break;

            default:
                break;
        }
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.array.count == 0) {
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
        return cell;
    }else{
        FirstTheMessageCenterTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstTheMessageCenterTableViewCellID"];
        [cell reloadData:self.array[indexPath.row]];
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
/**系统消息*/
- (void)requestremindMYREMIND{
    [LaborCenterRequestDatas remindMYREMINDrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.array = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.array = [NSArray array];
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
