//
//  ChangJianWenTiViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ChangJianWenTiViewController.h"
#import "FirstChangJianWenTiTableViewCell.h"
#import "SecondChangJianWenTiTableViewCell.h"
#import "PersonalCenterRequestDatas.h"

@interface ChangJianWenTiViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSString *titless;
@property (nonatomic,strong)NSIndexPath *indexT;

@end

@implementation ChangJianWenTiViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.indexT = [NSIndexPath indexPathForRow:100 inSection:100];
    self.dataArray = [NSArray array];
//    self.dataArray = @[@""];
    [self initUI];
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;
    [self requestadminsysquesyionpage];

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
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstChangJianWenTiTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstChangJianWenTiTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondChangJianWenTiTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondChangJianWenTiTableViewCellID"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.dataArray.count == 0) {
//        return SCR_H;
//
//    }else{
        return UITableViewAutomaticDimension;

    
//    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
//    if (self.dataArray.count == 0) {
//        return 1;
//
//    }else{
        return self.dataArray.count;

//    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section == self.indexT.section) {
        return 2;
    }else{
        return 1;

    }
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        SecondChangJianWenTiTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondChangJianWenTiTableViewCellID"];
        [cell reloadData:self.dataArray[indexPath.section] number:indexPath.section+1];
        return cell;
        

    }else{
        FirstChangJianWenTiTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstChangJianWenTiTableViewCellID"];
        [cell reloadData:self.dataArray[indexPath.section]];
        return cell;
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    self.indexT = indexPath;
    [self.myTableView reloadData];

}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**问题*/
- (void)requestadminsysquesyionpage{
    
    [PersonalCenterRequestDatas adminsysquesyionpagerequestDataWithparameters:nil success:^(id  _Nonnull result) {
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
