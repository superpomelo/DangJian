//
//  VRSeeCampusViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  VR看校园

#import "VRSeeCampusViewController.h"
#import "FirstVRSeeCampusTableViewCell.h"
#import "VRSeeCampusDetailsViewController.h"
#import "DQVRWKViewController.h"


@interface VRSeeCampusViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *searchBottomView;
@property (weak, nonatomic) IBOutlet UIView *cityBottomView;

@end

@implementation VRSeeCampusViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.searchBottomView.layer.cornerRadius = self.searchBottomView.bounds.size.height/2;
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initmyTableView{
    self.cityBottomView.hidden = YES;
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstVRSeeCampusTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstVRSeeCampusTableViewCellID"];

    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 240;
            break;

            
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;

        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
       
    FirstVRSeeCampusTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstVRSeeCampusTableViewCellID"];
         return cell;
    

    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
//    VRSeeCampusDetailsViewController *VR = [[VRSeeCampusDetailsViewController alloc]init];
//    [self.navigationController pushViewController:VR animated:YES];
    DQVRWKViewController *vc = [[DQVRWKViewController alloc]init];
    vc.urlstring = @"http://www.expoon.com/26925/";
    [self.navigationController pushViewController:vc animated:YES];
}

//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)searchButtonAction:(id)sender {
        [SVProgressHUD showInfoWithStatus:@"开发中,敬请期待"];

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
