//
//  LearningCenterHomeViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LearningCenterHomeViewController.h"
#import "FirstLearningCenterHomeTableViewCell.h"
#import "SecondLearningCenterHomeTableViewCell.h"
#import "ThirdLearningCenterHomeTableViewCell.h"
#import "FourthLearningCenterHomeTableViewCell.h"
#import "FivethLearningCenterHomeTableViewCell.h"
#import "LearningCenterDetails1ViewController.h"
#import "LearningCenterDetails2ViewController.h"
#import "LearningCenterRequest.h"
#import "LearningCenterHomeModel.h"
#import "LaborCenterRequestDatas.h"
#import "LaborLunBoModel.h"
#import "LearningCenterDetails1NewsViewController.h"
#import "SixthLearningCenterHomeTableViewCell.h"
#import "UserInfoManager.h"

@interface LearningCenterHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,JLCycleScrollerViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *theTitleView;
@property (nonatomic,weak)UIButton *lastbutton;
@property (nonatomic,assign)NSInteger mytag;
@property (nonatomic,strong)NSArray *lunboarray;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSArray *titleArray;
@property (weak, nonatomic) IBOutlet UIView *topBottomView;
@property (weak, nonatomic) IBOutlet UIView *navBottomView;
/**页码*/
@property(nonatomic,assign)NSInteger tags;
@property (weak, nonatomic) IBOutlet UILabel *titlesTLabel;

@end

@implementation LearningCenterHomeViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _titleArray = @[@"劳动知识",@"民俗知识",@"国学知识",@"农业科技",@"新闻时事",@"时代先锋"];
    self.tags = 1;
    self.dataArray = [NSMutableArray array];
    self.lunboarray = [NSArray array];
//    self.titleArray = @[@"全部",@"工作动态",@"探索创新",@"建设成果",@"党建手账",@"思想文圩",@"立德树人",@"服务社会"];
    self.titleArray = @[@"全部",@"工作动态",@"信息公开",@"党务指南",@"一院一品",@"立德树人",@"党建带群建"];
//    if ([[UserInfoManager getDwzn] isEqualToString:@"yes"]) {
//        //首页党务指南点击进来
//        self.mytag = 553;
//    }else{
//        //正常加载
//        self.mytag = 550;
//    }
    //正常加载
    self.mytag = 550;
    [self initUI];
    [self initscrollerView];
    [self initmyTableView];
    [self requestmobileIndexcarouselIndex];//轮播图
    [self requestTeacherLectureHall1];
//    [self requestmobileIndexinformationone]; //劳动知识
    self.fd_prefersNavigationBarHidden = YES;
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(DangWuFaZhanOrder:) name:@"NewOrder" object:nil];

//    [UserInfoManager setDwzn:@"no"];

    
}
/**首页党务指南跳转*/
- (void)DangWuFaZhanOrder:(NSNotification *)noti {
    //首页党务指南点击进来
    if (self.mytag == 553) {
        return;
    }
    self.mytag = 553;
    UIButton *btn = (UIButton*)[self.view viewWithTag:553];
    btn.selected = YES;
    [self requestTeacherLectureHall];

    self.lastbutton.selected = NO;
    self.lastbutton = btn;
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:@"一校一品" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
    NSAttributedString *abt3 = attributedString3;
    self.titlesTLabel.attributedText = abt3;
    self.topBottomView.backgroundColor = kGreenColor;
    self.navBottomView.backgroundColor = kGreenColor;
}
-(void)viewDidLayoutSubviews{
    [super viewDidLayoutSubviews];
    
}
- (void)initscrollerView{
    UIScrollView *_scrollView = [[UIScrollView alloc]initWithFrame:self.theTitleView.bounds];
    _scrollView.contentSize = CGSizeMake(85*_titleArray.count+70, 35);
//    _scrollView.contentSize = CGSizeMake(SCR_W*20, 35);
    _scrollView.delegate = self;
       //  水平
    _scrollView.showsHorizontalScrollIndicator = NO;
        // 垂直
    _scrollView.showsVerticalScrollIndicator = NO;
//    [self viewDidLayoutSubviews];
    for (int i = 0; i<_titleArray.count; i++) {
        UIButton *btn;
        if (i==0) {
            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i, 0, 40, 40)];

        }else if (i==_titleArray.count-1){
            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40, 0, 90, 40)];
        }else{
           btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40, 0, 80, 40)];
            

        }
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];

        
//                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"特别提醒" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        

        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:_titleArray[i] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        [btn setAttributedTitle:string forState:UIControlStateNormal];


        NSMutableAttributedString *Selstring = [[NSMutableAttributedString alloc] initWithString:_titleArray[i] attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1.0]}];
        [btn setAttributedTitle:Selstring forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 550 + i;
//        if ([[UserInfoManager getDwzn] isEqualToString:@"yes"]) {
            //首页点进来的党务指南
//            if (i==3) {
//                btn.selected = YES;
//                self.lastbutton = btn;
//                [UserInfoManager setDwzn:@"no"];
//            }
//        }else{
            //正常创建
            if (i==0) {
                btn.selected = YES;
                self.lastbutton = btn;
            }
//        }

        [_scrollView addSubview:btn];
        
    }
    [self.theTitleView addSubview:_scrollView];

}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FivethLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethLearningCenterHomeTableViewCellID"];
    
  
    
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self requestmobileIndexcarouselIndex];
//        [self requestactivitygetActivitysList];
//        [self requestTeacherLectureHall];
        self.tags = 1;
        if (self.mytag == 550 ) {

            [self requestmobileIndexcarouselIndex];
            [self requestTeacherLectureHall1];
        }else{
            [self requestTeacherLectureHall];
        }
        }];
    self.myTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{

        self.tags++;
        if (self.mytag == 550 ) {
          
            [self requestTeacherLectureHall1];
        }else{
            [self requestTeacherLectureHall];
        }
//        [self requestsysintegralgetSysIntegral];
//        [self requestsysintegralwatermyweeklist];
//        [self requestsysintegralwatermymoulist];
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;

}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.mytag == 550) {
        return 2;
    }else{
        return 1;
    }
    
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.mytag == 550) {
        if (section==0) {
            return 1;
        }else{
            return self.dataArray.count;

        }
    }else{
        return self.dataArray.count;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mytag == 550) {
        if (indexPath.section == 0) {
            FirstLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstLearningCenterHomeTableViewCellID"];
            if (self.lunboarray.count>0) {
                NSMutableArray *aryM = [NSMutableArray array];
                NSMutableArray *titlearyM = [NSMutableArray array];

                for (int i=0; i<self.lunboarray.count; i++) {
                    if (i<3) {
                        LaborLunBoModel *model = self.lunboarray[i];
                        [aryM addObject:model.thumbnail];
                        [titlearyM addObject:model.title];
                    }

                }
                cell.cycleView.titlessourceArray = titlearyM;
                cell.cycleView.sourceArray = aryM;
                cell.cycleView.delegate = self;
                cell.cycleView.pageControl_right = 0;
            }
            return cell;
        }else{
           
                LearningCenterHomeModel *model = self.dataArray[indexPath.row];
                if ([model.body containsString:@"http"]&&[model.body containsString:@"mp4"]) {
                 //视频格式
                    FivethLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethLearningCenterHomeTableViewCellID"];
                    [cell reloadData:model];
                     return cell;
                }else if ([model.body containsString:@"http"]){
                  //图片格式
                    SecondLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondLearningCenterHomeTableViewCellID"];
                    [cell reloadData:model];
                    return cell;
                }else{
                  //文字格式
                    ThirdLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdLearningCenterHomeTableViewCellID"];
                    [cell reloadData:model];
                     return cell;
                }
            


        }
    }else{
        LearningCenterHomeModel *model = self.dataArray[indexPath.row];
        if ([model.body containsString:@"http"]&&[model.body containsString:@"mp4"]) {
         //视频格式
            FivethLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethLearningCenterHomeTableViewCellID"];
            [cell reloadData:model];
             return cell;
        }else if ([model.body containsString:@"http"]){
          //图片格式
            SecondLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondLearningCenterHomeTableViewCellID"];
            [cell reloadData:model];
            return cell;
        }else{
          //文字格式
            ThirdLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdLearningCenterHomeTableViewCellID"];
            [cell reloadData:model];
             return cell;
        }
    

    }
    


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mytag == 550) {
        if (indexPath.section==1) {
            
            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
            LCvc1.informationId = model.idx;
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];

        }
    }else{
        LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
        LearningCenterHomeModel *model = self.dataArray[indexPath.row];
        LCvc1.informationId = model.idx;
        [LCvc1 setHidesBottomBarWhenPushed:YES];

        [self.navigationController pushViewController:LCvc1 animated:YES];
    }


 
}

/**
 点击轮播Cell代理
 @param index 点击的<0.1.2...>
 @param sourceArray 传入进来的原始数据
 */
-(void)jl_cycleScrollerView:(JLCycleScrollerView*)view didSelectItemAtIndex:(NSInteger)index sourceArray:(NSArray*)sourceArray{
    if (self.lunboarray.count>0) {
            LearningCenterDetails1ViewController *LCvc1 = [[LearningCenterDetails1ViewController alloc]init];
           LaborLunBoModel *model = self.lunboarray[index];
            LCvc1.informationId = model.idx;
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];
        
    }
    NSLog(@"%@",sourceArray[index]);
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (void)titleButtonAction:(UIButton*)sender{
    if (self.lastbutton == sender) {
        return;
    }
    self.tags = 1;
    if (sender.tag == 550) {
        //全部
        self.mytag = 550;
        [self requestTeacherLectureHall1];
    }else if (sender.tag == 551) {
        //工作动态
        self.mytag = 551;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 552) {
        //探索创新
        self.mytag = 552;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 553) {
        //建设成果
        self.mytag = 553;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 554) {
        //党建手账
        self.mytag = 554;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 555) {
        //思想文圩
        self.mytag = 555;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 556) {
        //立德树人
        self.mytag = 556;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 557) {
        //服务社会
        self.mytag = 557;
        [self requestTeacherLectureHall];
    }
    sender.selected = YES;
    self.lastbutton.selected = NO;
    self.lastbutton = sender;
    
}
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**获取全部*/
- (void)requestTeacherLectureHall1{
//    1 党建要闻2 业务知识 3 信息公开4 先锋风采5 教育理论 6 习近平新时代中国特色社会主义思想7 公示公告 8 规章制度  9 工作动态 10 探索创新 11 建设成果  12 党建手账 13 思想文圩 14 立德树人  15 首页轮播
    
   
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
 
    para[@"current"] = [NSString stringWithFormat:@"%ld",self.tags];
    [LaborCenterRequestDatas TeacherLectureHall1requestDataWithparameters:para success:^(id  _Nonnull result) {
        if (self.tags == 1) {
            self.dataArray = result;
        }else{
            [self.dataArray addObjectsFromArray:result];
        }
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
        NSArray *arrayTemp = result;
        if (arrayTemp.count<10) {
            [self.myTableView.mj_footer endRefreshingWithNoMoreData];
        }
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
    }];
}
/**获取劳动知识*/
- (void)requestTeacherLectureHall{
//    1 党建要闻2 业务知识 3 信息公开4 先锋风采5 教育理论 6 习近平新时代中国特色社会主义思想7 公示公告 8 规章制度  9 工作动态 10 探索创新 11 建设成果  12 党建手账 13 思想文圩 14 立德树人  15 首页轮播
    
   
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    if (self.mytag == 550) {
//        para[@"classificationId"] = @"1";

    }else if(self.mytag == 551){
        para[@"classificationId"] = @"9";

    }else if(self.mytag == 552){
//        para[@"classificationId"] = @"10";
        para[@"classificationId"] = @"3";


    }else if(self.mytag == 553){
//        para[@"classificationId"] = @"11";
        para[@"classificationId"] = @"16";

    }else if(self.mytag == 554){
//        para[@"classificationId"] = @"12";
        para[@"classificationId"] = @"8";

    }else if(self.mytag == 555){
//        para[@"classificationId"] = @"13";
        para[@"classificationId"] = @"14";

    }else if(self.mytag == 556){
        para[@"classificationId"] = @"10";

    }else if(self.mytag == 557){
//        para[@"classificationId"] = @"16";

    }
    para[@"current"] = [NSString stringWithFormat:@"%ld",self.tags];
    [LaborCenterRequestDatas TeacherLectureHallrequestDataWithparameters:para success:^(id  _Nonnull result) {
        if (self.tags == 1) {
            self.dataArray = result;
        }else{
            [self.dataArray addObjectsFromArray:result];
        }
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
        NSArray *arrayTemp = result;
        if (arrayTemp.count<10) {
            [self.myTableView.mj_footer endRefreshingWithNoMoreData];
        }
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
    }];
}
/**劳动知识*/
- (void)requestmobileIndexinformationone{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

     para[@"type"] = @"1";

    [LearningCenterRequest mobileIndexinformationonerequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}
/**民俗知识*/
- (void)requestmobileIndexinformationtwo{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

     para[@"type"] = @"2";

    [LearningCenterRequest mobileIndexinformationtworequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}
/**国学知识*/
- (void)requestmobileIndexinformationthr{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

     para[@"type"] = @"3";

    [LearningCenterRequest mobileIndexinformationthrrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**农业科技*/
- (void)requestmobileIndexinformationfou{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

     para[@"type"] = @"4";

    [LearningCenterRequest mobileIndexinformationfourequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**新闻时事*/
- (void)requestmobileIndexinformationfiv{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

     para[@"type"] = @"5";

    [LearningCenterRequest mobileIndexinformationfivrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**首页轮播*/
/**首页轮播*/
- (void)requestmobileIndexcarouselIndex{
    //    1 党建要闻2 业务知识 3 信息公开4 先锋风采5 教育理论 6 习近平新时代中国特色社会主义思想7 公示公告 8 规章制度  9 工作动态 10 探索创新 11 建设成果  12 党建手账 13 思想文圩 14 立德树人  15 首页轮播
        
       
        NSMutableDictionary *para = [NSMutableDictionary dictionary];
        para[@"classificationId"] = @"15";
        para[@"current"] = @"1";
        [LaborCenterRequestDatas TeacherLectureHallrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
            
            self.lunboarray = result;
            [self.myTableView reloadData];
            //手动结束刷新状态
            [self.myTableView.mj_header endRefreshing];
        } failure:^(NSError * _Nonnull error) {
            
        }];
    

//    [LaborCenterRequestDatas mobileIndexcarouselIndexrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.lunboarray = result;
//        [self.myTableView reloadData];
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    } failure:^(NSError * _Nonnull error) {
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    }];
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
