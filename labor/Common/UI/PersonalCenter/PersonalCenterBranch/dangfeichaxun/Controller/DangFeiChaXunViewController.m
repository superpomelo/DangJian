//
//  DangFeiChaXunViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "DangFeiChaXunViewController.h"
#import "FirstDangFeiChaXunTableViewCell.h"
#import "SecondDangFeiChaXunTableViewCell.h"
#import "ThirdthDangFeiChaXunTableViewCell.h"
#import "ZeroJieGuoTableViewCell.h"

@interface DangFeiChaXunViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplayoutconstraint;
@property (weak, nonatomic) IBOutlet UIView *navBottomView;
@property (weak, nonatomic) IBOutlet UIView *nav2BottomView;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (nonatomic,strong)NSMutableArray *dataArray;
@end

@implementation DangFeiChaXunViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
  
    self.dataArray = [NSMutableArray array];
    [self initUI];
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;
    if ([IsIphoneX isIphoneX]==NO) {
        self.toplayoutconstraint.constant = -20.0f;
    }
    self.extendedLayoutIncludesOpaqueBars = YES;

    if (@available(iOS 11.0, *)) {

            self.myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    } else {

            self.automaticallyAdjustsScrollViewInsets = NO;

    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

//    [self requestmobileUsermyWater];
//    [self requestsysintegralgetSysIntegral];
//    [self requestsysintegralwatermyweeklist];
//    [self requestsysintegralwatermymoulist];
}

-(void)viewWillDisappear:(BOOL)animated{

[super viewWillDisappear:animated];

[UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}
//MARK: - Initalization - 初始化
- (void)initUI{
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstDangFeiChaXunTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstDangFeiChaXunTableViewCellID"];
   [self.myTableView registerNib:[UINib nibWithNibName:@"SecondDangFeiChaXunTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondDangFeiChaXunTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdthDangFeiChaXunTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdthDangFeiChaXunTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroJieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroJieGuoTableViewCellID"];
//    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
////        self.tags = 0;
////        [self requestmobileUsermyWater];
////        [self requestsysintegralgetSysIntegral];
////        [self requestsysintegralwatermyweeklist];
////        [self requestsysintegralwatermymoulist];
//        }];
//    self.myTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{
////        self.tags++;
////        [self requestmobileUsermyWater];
////        [self requestsysintegralgetSysIntegral];
////        [self requestsysintegralwatermyweeklist];
////        [self requestsysintegralwatermymoulist];
//    }];
//    MJRefreshAutoNormalFooter *footer = [MJRefreshAutoNormalFooter footerWithRefreshingTarget:self refreshingAction:@selector(beginLoadMore)];
//    footer.triggerAutomaticallyRefreshPercent = -MJRefreshFooterHeight;
//    [footer setTitle:@"上拉加载更多" forState:MJRefreshStateIdle];
//    [footer setTitle:@"释放加载更多" forState:MJRefreshStatePulling];
//    [footer setTitle:@"正在加载更多" forState:MJRefreshStateRefreshing];
//    [footer setTitle:@"没有更多了" forState:MJRefreshStateNoMoreData];

}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            if ([IsIphoneX isIphoneX]==NO) {
                return 305;

            }else{
                return 325;

            }
            
            
            break;
        case 1:
            return 51;
            break;
        case 2:
            if (self.dataArray.count == 0) {
                return 200;
                break;

            }else{
                return 50;
                break;
            }
            break;
        case 3:


        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
                return 1;
                break;
        case 2:
                return 1;
                break;
        case 3:
            if (self.dataArray.count == 0) {
                return 1;
                break;

            }else{
                return self.dataArray.count;
                break;
            }

        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstDangFeiChaXunTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstDangFeiChaXunTableViewCellID"];
//        [cell reloadUI];
     
//            cell.weekscoreLabel.text = [NSString stringWithFormat:@"%ld",self.weekscore];
//            cell.monthLabel.text = [NSString stringWithFormat:@"%ld",self.monthscore];
//            NSMutableAttributedString *abt = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%ld",self.score]];
//            cell.scoreLabel.attributedText = abt;
           


       

        
         return cell;
    }else if (indexPath.section == 1) {
        SecondDangFeiChaXunTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondDangFeiChaXunTableViewCellID"];
//        cell.delegate = self;
         return cell;
    }else{
        if (self.dataArray.count == 0) {
            ZeroJieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroJieGuoTableViewCellID"];

             return cell;

        }else{
            ThirdthDangFeiChaXunTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdthDangFeiChaXunTableViewCellID"];
    //            if (self.dataArray.count>0) {
    //                cell.leftLabel.text = @"积分明细";
    //            }else{
    //                cell.leftLabel.text = @"暂无明细";
    //            }
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
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 44) {
        self.navBottomView.backgroundColor = [UIColor whiteColor];
        self.nav2BottomView.backgroundColor = [UIColor whiteColor];
        self.titlesLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        self.backImageView.image = [UIImage imageNamed:@"路径 31"];
    }else{
        self.navBottomView.backgroundColor = [UIColor clearColor];
        self.nav2BottomView.backgroundColor = [UIColor clearColor];
        self.titlesLabel.textColor = [UIColor whiteColor];
        self.backImageView.image = [UIImage imageNamed:@"路径 32"];

    }
}
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
