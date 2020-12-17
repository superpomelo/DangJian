//
//  StudentDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "StudentDetailsViewController.h"
#import "FirstStudentDetailsTableViewCell.h"
#import "SecondStudentDetailsTableViewCell.h"
#import "ThirdStudentDetailsTableViewCell.h"

@interface StudentDetailsViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation StudentDetailsViewController

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
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstStudentDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstStudentDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondStudentDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondStudentDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdStudentDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdStudentDetailsTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 110;
            break;
        case 1:
            return 65;
            break;
        case 2:
            return 368;
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.section == 0) {
    FirstStudentDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstStudentDetailsTableViewCellID"];
          return cell;
  }else if (indexPath.section == 1){
      SecondStudentDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondStudentDetailsTableViewCellID"];
            return cell;
  } else{
    ThirdStudentDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdStudentDetailsTableViewCellID"];
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
