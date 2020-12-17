//
//  RankListViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "RankListViewController.h"
#import "FirstRankListTableViewCell.h"
#import "SecondRankListTableViewCell.h"
#import "PersonalCenterRequestDatas.h"
#import "RankListModel.h"

@interface RankListViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *topBottomView;
@property (weak, nonatomic) IBOutlet UIView *lianDongView;
/**日榜*/
@property (weak, nonatomic) IBOutlet UIButton *listOfDayButton;
/**周榜*/
@property (weak, nonatomic) IBOutlet UIButton *listOfWeekButton;
/**月榜*/
@property (weak, nonatomic) IBOutlet UIButton *listOfMonthButton;

@property (weak, nonatomic) IBOutlet UIView *top2BottomView;
@property (weak, nonatomic) IBOutlet UIView *bangdanBottomView;

@property(nonatomic,strong) NSArray *dataArray;
@end

@implementation RankListViewController


//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initmyTableView];
    [self requestsysintegralwaterdaylist];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

-(void)viewWillDisappear:(BOOL)animated{

[super viewWillDisappear:animated];

[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}
//MARK: - Initalization - 初始化
- (void)initUI{
    self.bangdanBottomView.layer.cornerRadius = 35/2;
    CAGradientLayer *gl = [CAGradientLayer layer];
    gl.frame = CGRectMake(0,0,SCR_W,self.top2BottomView.bounds.size.height);
    gl.startPoint = CGPointMake(0, 0);
    gl.endPoint = CGPointMake(1, 1);

    gl.colors = @[(__bridge id)[UIColor colorWithRed:60/255.0 green:196/255.0 blue:147/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:46/255.0 green:179/255.0 blue:144/255.0 alpha:1.0].CGColor];
    gl.locations = @[@(0.0),@(1.0)];

    [self.top2BottomView.layer addSublayer:gl];
    
    self.listOfDayButton.selected = YES;
//    self.topBottomView.layer.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1.0].CGColor;
//    self.topBottomView.layer.shadowColor = [UIColor colorWithRed:0/255.0 green:0/255.0 blue:0/255.0 alpha:0.2].CGColor;
//    self.topBottomView.layer.shadowOffset = CGSizeMake(0,2);
//    self.topBottomView.layer.shadowOpacity = 1;
//    self.topBottomView.layer.shadowRadius = 10;
    self.topBottomView.layer.cornerRadius = 35/2;
    self.lianDongView.layer.cornerRadius = 30/2;
    
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstRankListTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstRankListTableViewCellID"];
       [self.myTableView registerNib:[UINib nibWithNibName:@"SecondRankListTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondRankListTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 175;
            break;
        case 1:
                return 55;
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
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
            if (self.dataArray.count>3) {
                return self.dataArray.count-3;
            }else{
                return  0;
            }
            
            break;

        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstRankListTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstRankListTableViewCellID"];
        [cell reloadData:self.dataArray];
         return cell;
    }else{
        SecondRankListTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondRankListTableViewCellID"];
        [cell reloadData:self.dataArray[indexPath.row+3] indexPath:indexPath];
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
/**日榜*/
- (IBAction)listOfDayButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.listOfWeekButton.selected = NO;
    self.listOfMonthButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lianDongView.center = CGPointMake(sender.center.x, self.lianDongView.center.y);
    }];
    [self requestsysintegralwaterdaylist];
}
/**周榜*/
- (IBAction)listOfWeekButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.listOfDayButton.selected = NO;
    self.listOfMonthButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lianDongView.center = CGPointMake(sender.center.x, self.lianDongView.center.y);
    }];
    [self requestsysintegralwaterweeklist];
}
/**月榜*/
- (IBAction)listOfMonthButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.listOfDayButton.selected = NO;
    self.listOfWeekButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lianDongView.center = CGPointMake(sender.center.x, self.lianDongView.center.y);
    }];
    [self requestsysintegralwatermoulist];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**日榜*/
- (void)requestsysintegralwaterdaylist{
    [PersonalCenterRequestDatas sysintegralwaterdaylistrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**周榜*/
- (void)requestsysintegralwaterweeklist{
    [PersonalCenterRequestDatas sysintegralwaterweeklistrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**月榜*/
- (void)requestsysintegralwatermoulist{
    [PersonalCenterRequestDatas sysintegralwatermoulistrequestDataWithparameters:nil success:^(id  _Nonnull result) {
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
