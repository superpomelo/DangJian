//
//  ActivityCompletionDetailViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ActivityCompletionDetailViewController.h"
#import "FirstActivityCompletionDetailTableViewCell.h"
#import "SecondActivityCompletionDetailTableViewCell.h"


@interface ActivityCompletionDetailViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@end

@implementation ActivityCompletionDetailViewController

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
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstActivityCompletionDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstActivityCompletionDetailTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondActivityCompletionDetailTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondActivityCompletionDetailTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 50;
            break;
        case 1:
                return 50;
                break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (section==0) {
        return 1;
    }
    return 13;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
  if (indexPath.section == 0) {
    FirstActivityCompletionDetailTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstActivityCompletionDetailTableViewCellID"];
          return cell;
    }else{
    SecondActivityCompletionDetailTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondActivityCompletionDetailTableViewCellID"];
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
