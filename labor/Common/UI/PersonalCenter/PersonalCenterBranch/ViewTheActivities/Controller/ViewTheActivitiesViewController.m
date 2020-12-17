//
//  ViewTheActivitiesViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  查看学生提交的活动

#import "ViewTheActivitiesViewController.h"
#import "FirstViewTheActivitiesTableViewCell.h"
#import "SecondViewTheActivitiesTableViewCell.h"
#import "ThirdViewTheActivitiesTableViewCell.h"

@interface ViewTheActivitiesViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ViewTheActivitiesViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initmyTableView];
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
    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstViewTheActivitiesTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstViewTheActivitiesTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondViewTheActivitiesTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondViewTheActivitiesTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdViewTheActivitiesTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdViewTheActivitiesTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.section == 0) {
    FirstViewTheActivitiesTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstViewTheActivitiesTableViewCellID"];
          return cell;
  }else if (indexPath.section == 1){
      SecondViewTheActivitiesTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondViewTheActivitiesTableViewCellID"];
            return cell;
  } else{
    ThirdViewTheActivitiesTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdViewTheActivitiesTableViewCellID"];
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
