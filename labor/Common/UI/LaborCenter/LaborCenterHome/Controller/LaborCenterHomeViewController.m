//
//  LaborCenterHomeViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LaborCenterHomeViewController.h"
#import "FirstLaborCenterHomeTableViewCell.h"
#import "SecondLaborCenterHomeTableViewCell.h"
#import "ThirdLaborCenterHomeTableViewCell.h"
#import "FourthLaborCenterHomeTableViewCell.h"
#import "TeacherLectureHallViewController.h"
#import "TheExamRushedOffViewController.h"
#import "AssessmentOfTheTaskViewController.h"
#import "VRSeeCampusViewController.h"
#import "TheMessageCenterViewController.h"
#import "LaborCenterHomeSearchViewController.h"
#import "LaborCenterRequestDatas.h"
#import "LaborCenterLessonDetailsViewController.h"
#import "TaskAssessmentDetailsViewController.h"
#import "LaborLunBoModel.h"
#import "LearningCenterDetails1ViewController.h"
#import "FiveLaborCenterHomeNewsTableViewCell.h"
#import "SixLaborCenterHomeNewsTableViewCell.h"
#import "SeventhLaborCenterHomeNewsTableViewCell.h"
#import "EightLaborCenterHomeNewsTableViewCell.h"
#import "LearningCenterRequest.h"
#import "LearningCenterDetails1NewsViewController.h"
#import "LearningCenterHomeModel.h"
#import "DQVRWKViewController.h"
#import "HuoDongTiShiView.h"
#import "YsyPopHelper.h"
#import "JyldHuoDong.h"
#import "MyClassViewController.h"
#import "UserInfoManager.h"
#import "MyCircleCenterRequestDatas.h"
#import "NewFirstMyCircleCenterHomeTableViewCell.h"
#import "DangYuanGuShiFangModel.h"
#import "SecondFirstMyCircleCenterHomeTableViewCell.h"
#import "GuShiFangModel.h"
#import "MyCircleCenterDetails1ViewController.h"
#import "DQWKViewController.h"


//#import "UINavigationController+FDFullscreenPopGesture.h"

@interface LaborCenterHomeViewController ()<UITableViewDelegate,UITableViewDataSource,SecondLaborCenterHomeTableViewCellDelegate,FourthLaborCenterHomeTableViewCellDelegate,JLCycleScrollerViewDelegate,UIScrollViewDelegate,EightLaborCenterHomeNewsTableViewCellDelegate,HuoDongTiShiViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *navTop0BottomView;

@property (weak, nonatomic) IBOutlet UIView *navTopBottomView;
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *searchBottomView;
/**小红点底部view*/
@property (weak, nonatomic) IBOutlet UIView *messageCountBottomView;
@property (weak, nonatomic) IBOutlet UILabel *messageCountLabel;
@property (weak, nonatomic) IBOutlet UIView *theTitleView;
@property (nonatomic,weak)UIButton *lastbutton;

/**选择城市*/
@property (weak, nonatomic) IBOutlet UIView *cityBottomView;
/**智慧党建*/
@property (weak, nonatomic) IBOutlet UILabel *zhihuidangjianLabel;
/**跑马灯*/
@property (nonatomic,strong)NSArray *paomadengarray;

/**课程推荐数组*/
@property (nonatomic,strong)NSArray *array;
/**特别提醒数组*/
@property (nonatomic,strong)NSArray *activityarray;
/**轮播数组*/
@property (nonatomic,strong)NSArray *lunboarray;
@property (nonatomic,strong)NSArray *titleArray;

@property (nonatomic,strong)NSArray *gushifanglunboarray;
@property (nonatomic,strong)NSMutableArray *gushifangarray;

@property (nonatomic,assign)NSInteger mytag;
/**新闻数组*/
@property (nonatomic,strong)NSMutableArray *dataArray;
/**页码*/
@property(nonatomic,assign)NSInteger tags;
@property (nonatomic,strong) YsyPopHelper *helper;
/**tabbarbutton刷新*/
@property(nonatomic,assign)NSInteger tabbarA;

@end

@implementation LaborCenterHomeViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.tags = 1;
    self.tabbarA = 0;
    self.gushifangarray = [NSMutableArray array];

    self.gushifanglunboarray = [NSArray array];
    self.array = [NSArray array];
    self.dataArray = [NSMutableArray array];
    self.paomadengarray = [NSArray array];

    self.activityarray = [NSArray array];
    self.lunboarray = [NSArray array];
   // 1 党建要闻2 业务知识 3 信息公开4 先锋风采5 教育理论 6 习近平新时代中国特色社会主义思想7 公示公告 8 规章制度  9 工作动态 10 探索创新 11 建设成果  12 党建手账 13 思想文圩 14 立德树人  15 首页轮播
//    self.titleArray = @[@"全部",@"党建要闻",@"业务知识",@"信息公开",@"先锋风采",@"教育理论",@"习近平新时代中国特色社会主义思想",@"公示公告",@"规章制度"];
    self.titleArray = @[@"全部",@"党建要闻",@"习近平新时代中国特色社会主义思想",@"先锋风采",@"教育理论",@"党员故事坊"];
    self.mytag = 520;

    [self initmyTableView];
    [self initUI];
    [self initscrollerView];
    [self requestmobileIndexcarouselIndex];
    [self requestactivitygetActivitysList];
    [self requestTeacherLectureHall1];
    [self requestactivitygetActivitysList1];//是否有将要开始的活动列表
//    [self requestmobileIndexinformationone];
    self.fd_prefersNavigationBarHidden = YES;
    //点击tabbar通知
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(tabbarA:) name:@"tabbar0" object:nil];
//   Font name: SourceHanSerifCN-Medium
//   Font name: SourceHanSerifCN-Bold
    
//    NSArray *familyNames =[[NSArray alloc] initWithArray:[UIFont familyNames]];
//
//    NSArray *fontNames;
//
//     NSInteger indFamily, indFont;
//
//    for(indFamily=0; indFamily<[familyNames count]; ++indFamily)    {
//
//        NSLog(@"Family name: %@", [familyNames objectAtIndex:indFamily]);
//
//    fontNames =[[NSArray alloc] initWithArray:
//
//    [UIFont fontNamesForFamilyName:
//
//    [familyNames objectAtIndex:indFamily]]];
//
//    for(indFont=0; indFont<[fontNames count]; ++indFont)        {
//
//         NSLog(@"    Font name: %@", [fontNames objectAtIndex:indFont]);
//
//         }
//
//     }
//

}

/**点击tabbarbutton通知*/
- (void)tabbarA:(NSNotification*)noti{
    NSLog(@"%ld",(long)self.myTableView.mj_header.state);
    //手动结束刷新状态
    self.tabbarA++;
    if (self.tabbarA == 1) {
        self.tags = 1;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.tabbarA = 0;
            });
        [self.myTableView.mj_header beginRefreshing];
        if (self.mytag == 520 ) {
            [self requestmobileIndexcarouselIndex];
            [self requestactivitygetActivitysList];
            [self requestTeacherLectureHall1];
        }else if (self.mytag == 525){
            [self requestactivitymobileActivitygetuplist];
            [self requestCCmyzonegetList];
        }else{
            [self requestTeacherLectureHall];
        }
    }
//    if (self.myTableView.mj_header.state == MJRefreshStateIdle) {
//
//    }
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        [self.myTableView.mj_header endRefreshing];
//    });


}

- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
//    [self requestremindMYREMINDsize];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

- (void)viewWillDisappear:(BOOL)animated{
//    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}
//MARK: - Initalization - 初始化
/**活动*/
- (void)addtishiView{
    HuoDongTiShiView *huodongView = [[NSBundle mainBundle] loadNibNamed:@"HuoDongTiShiView" owner:self options:nil][0];
//    huodongView.frame = CGRectMake(SCR_W/2-185/2, 0, 290, 185);
    huodongView.bounds  = CGRectMake(0, 0, 290,185 );

    huodongView.layer.cornerRadius = 8;
    huodongView.myButton.layer.cornerRadius = 3;
    
    huodongView.delegate = self;

    _helper = [[YsyPopHelper alloc] initWithCustomView:huodongView popStyle:YsyPopStyleFade dismissStyle:YsyDismissStyleScale position:YsyPositonCenter];
    _helper.superView = self.tabBarController.view;
   
    [_helper show];
}
/**去参加*/
- (void)iKnowButtClick{
    self.tabBarController.selectedIndex = 2;

    NSLog(@"弹窗代理");
    [_helper dismiss];
}
- (void)initUI{
    NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"智慧党建" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SourceHanSerifCN-Bold" size: 14],NSForegroundColorAttributeName:[UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1]}];
    
  
//    UILabel *label = [[[UILabel alloc] initWithFrame:frame] autorelease];
//    label.attributedText = atbString;
//    NSMutableParagraphStyle *paragraphStyle = [[NSMutableParagraphStyle alloc] init];
//    [paragraphStyle setLineSpacing:10];
//    [attributedString addAttribute:NSParagraphStyleAttributeName value:paragraphStyle range:NSMakeRange(0, [@"智慧党建" length])];

    NSAttributedString *abt = attributedString;
    self.zhihuidangjianLabel.attributedText = abt;
    
    self.navTop0BottomView.backgroundColor = kGreenColor;
    self.navTopBottomView.backgroundColor = kGreenColor;

    self.cityBottomView.hidden = YES;
    self.messageCountBottomView.layer.cornerRadius = self.messageCountBottomView.bounds.size.height/2;
    self.messageCountBottomView.hidden = YES;
    
    self.searchBottomView.layer.cornerRadius = self.searchBottomView.bounds.size.height/2;
}
- (void)initscrollerView{
    UIScrollView *_scrollView = [[UIScrollView alloc]initWithFrame:self.theTitleView.bounds];
    _scrollView.contentSize = CGSizeMake(85*_titleArray.count+70+220, 35);
//    _scrollView.contentSize = CGSizeMake(SCR_W*20, 35);
    _scrollView.delegate = self;
       //  水平
    _scrollView.showsHorizontalScrollIndicator = NO;
        // 垂直
    _scrollView.showsVerticalScrollIndicator = NO;
//    [self viewDidLayoutSubviews];
    for (int i = 0; i<_titleArray.count; i++) {
        UIButton *btn;
//        if (i==0) {
//            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i, 0, 40, 40)];
//
//        }else if(i==6){
//            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40, 0, 300, 40)];
//        }else if(i<6){
//            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40, 0, 80, 40)];
//        }else{
//            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40+220, 0, 80, 40)];
//
//        }
        if (i==0) {
            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i, 0, 40, 40)];

        }else if(i==2){
            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40, 0, 270, 40)];
        }else if(i<2){
            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40, 0, 80, 40)];
        }else if(i==5){
            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40+200, 0, 95, 40)];
        }else{
            btn = [[UIButton alloc]initWithFrame:CGRectMake(15+80*i-40+200, 0, 80, 40)];

        }
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];

        
//                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"特别提醒" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        

        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:_titleArray[i] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        [btn setAttributedTitle:string forState:UIControlStateNormal];


        NSMutableAttributedString *Selstring = [[NSMutableAttributedString alloc] initWithString:_titleArray[i] attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1.0]}];
        [btn setAttributedTitle:Selstring forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 520 + i;
        if (i==0) {
            btn.selected = YES;
            self.lastbutton = btn;
        }
        [_scrollView addSubview:btn];
        
    }
    [self.theTitleView addSubview:_scrollView];

}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.estimatedRowHeight = 100;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstLaborCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstLaborCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondLaborCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondLaborCenterHomeTableViewCellID"];

    
    [self.myTableView registerNib:[UINib nibWithNibName:@"FiveLaborCenterHomeNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FiveLaborCenterHomeNewsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SixLaborCenterHomeNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SixLaborCenterHomeNewsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SeventhLaborCenterHomeNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SeventhLaborCenterHomeNewsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"EightLaborCenterHomeNewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"EightLaborCenterHomeNewsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"NewFirstMyCircleCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewFirstMyCircleCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondFirstMyCircleCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondFirstMyCircleCenterHomeTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self requestmobileIndexcarouselIndex];
//        [self requestactivitygetActivitysList];
//        [self requestTeacherLectureHall];
        self.tags = 1;
        if (self.mytag == 520 ) {
            [self requestmobileIndexcarouselIndex];
            [self requestactivitygetActivitysList];
            [self requestTeacherLectureHall1];
        }else if (self.mytag == 525){
            [self requestactivitymobileActivitygetuplist];
            [self requestCCmyzonegetList];
        }else{
            [self requestTeacherLectureHall];
        }
        }];
    self.myTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{

        self.tags++;
        if (self.mytag == 520 ) {
          
            [self requestTeacherLectureHall1];
        }else if (self.mytag == 525){
            [self requestactivitymobileActivitygetuplist];
            [self requestCCmyzonegetList];
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
    if (self.mytag == 520) {
        return 4;
    }else if (self.mytag == 525){
        return 2;
    }else{
        return 1;

    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.mytag == 520) {
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
                return self.dataArray.count;
                break;

            default:
                break;
        }
    }else if (self.mytag == 525){
        if (section==0) {
            return 1;
        }else{
            return self.gushifangarray.count;
        }
    }else{
        return self.dataArray.count;

    }

    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (self.mytag == 520) {
        if (section == 2) {
            
                return 0;
            
        }else if (section == 3) {
            return 0;
        }else{
            return 0;
        }
    }else{
        return 0;
    }

}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 35)];
        vi.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [tableView addSubview:vi];
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCR_W, 35)];

        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"特别提醒" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        lb.attributedText = attributedString;
        [vi addSubview:lb];
        return vi;
    }else if (section == 3) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 35)];
        vi.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        [tableView addSubview:vi];
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(15, 0, SCR_W, 45)];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"课程推荐" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:17],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        lb.attributedText = attributedString;
        [vi addSubview:lb];
        return vi;
    }else{
        return nil;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mytag == 520) {
        if (indexPath.section == 0) {
            FirstLaborCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstLaborCenterHomeTableViewCellID"];
            if (self.lunboarray.count>0) {
                NSMutableArray *aryM = [NSMutableArray array];
                NSMutableArray *titlearyM = [NSMutableArray array];
                for (int i=0; i<self.lunboarray.count; i++) {
                    if (i<3) {
                        LearningCenterHomeModel *model = self.lunboarray[i];
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
        }else if (indexPath.section == 2){
            SecondLaborCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondLaborCenterHomeTableViewCellID"];
            cell.delegate = self;
            return cell;
        }else if (indexPath.section == 1){

            EightLaborCenterHomeNewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"EightLaborCenterHomeNewsTableViewCellID"];
            cell.delegate = self;
            if (self.paomadengarray.count>0) {
    //            NSMutableArray *aryM = [NSMutableArray array];
                NSMutableArray *titlearyM = [NSMutableArray array];
                for (int i=0; i<self.paomadengarray.count; i++) {
    //                if (i<3) {
                        LearningCenterHomeModel *model = self.paomadengarray[i];
    //                    [aryM addObject:model.thumbnail];
                        [titlearyM addObject:model.title];
    //                }

                }
                [cell reloadData:titlearyM];

             
            }
            return cell;
        }else{
            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
            if ([model.body containsString:@"http"]&&[model.body containsString:@"mp4"]) {
             //视频格式
                SeventhLaborCenterHomeNewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SeventhLaborCenterHomeNewsTableViewCellID"];
                [cell reloadData:model];
                 return cell;
            }else if ([model.body containsString:@"http"]){
              //图片格式
                FiveLaborCenterHomeNewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FiveLaborCenterHomeNewsTableViewCellID"];
                [cell reloadData:model];
                return cell;
            }else{
              //文字格式
                SixLaborCenterHomeNewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SixLaborCenterHomeNewsTableViewCellID"];
                [cell reloadData:model];
                 return cell;
            }
        }

    }else if(self.mytag == 525){
        //党员故事坊
        if (indexPath.section == 0) {
            FirstLaborCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstLaborCenterHomeTableViewCellID"];
            if (self.gushifanglunboarray.count>0) {
                NSMutableArray *aryM = [NSMutableArray array];
                NSMutableArray *titlearyM = [NSMutableArray array];
                for (int i=0; i<self.gushifanglunboarray.count; i++) {
                    if (i<3) {
                        GuShiFangModel *model = self.gushifanglunboarray[i];
                        [aryM addObject:model.cover];
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
          DangYuanGuShiFangModel *model = self.gushifangarray[indexPath.row];
            
           if ([model.cover containsString:@"http"]){
            //图片格式
              NewFirstMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"NewFirstMyCircleCenterHomeTableViewCellID"];
              [cell reloadData:model];
              return cell;
            }else{
             //文字格式
             SecondFirstMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondFirstMyCircleCenterHomeTableViewCellID"];
             [cell reloadData:model];
             return cell;
           }
        }
    } else{
        LearningCenterHomeModel *model = self.dataArray[indexPath.row];
        if ([model.body containsString:@"http"]&&[model.body containsString:@"mp4"]) {
         //视频格式
            SeventhLaborCenterHomeNewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SeventhLaborCenterHomeNewsTableViewCellID"];
            [cell reloadData:model];
             return cell;
        }else if ([model.body containsString:@"http"]){
          //图片格式
            FiveLaborCenterHomeNewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FiveLaborCenterHomeNewsTableViewCellID"];
            [cell reloadData:model];
            return cell;
        }else{
          //文字格式
            SixLaborCenterHomeNewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SixLaborCenterHomeNewsTableViewCellID"];
            [cell reloadData:model];
             return cell;
        }
    }
 
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mytag == 520) {
        if (indexPath.section==3) {
            
            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
            LCvc1.informationId = model.idx;
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];
        }
    }else if(self.mytag == 525){
        if (indexPath.section==1) {
            GuShiFangModel *model = self.gushifangarray[indexPath.row];
            MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
            [CDvc1 setHidesBottomBarWhenPushed:YES];
            //        CDvc1.model = self.dataArrayM[indexPath.row];
            CDvc1.idx = [NSString stringWithFormat:@"%d",model.idx];
            [self.navigationController pushViewController:CDvc1 animated:YES];
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
    if (self.mytag == 525) {
        GuShiFangModel *model = self.gushifanglunboarray[index];
        MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
        [CDvc1 setHidesBottomBarWhenPushed:YES];
        //        CDvc1.model = self.dataArrayM[indexPath.row];
        CDvc1.idx = [NSString stringWithFormat:@"%d",model.idx];
        [self.navigationController pushViewController:CDvc1 animated:YES];
    }else{
        if (self.lunboarray.count>0) {
            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
            LearningCenterHomeModel *model = self.lunboarray[index];
                LCvc1.informationId = model.idx;
                [LCvc1 setHidesBottomBarWhenPushed:YES];

                [self.navigationController pushViewController:LCvc1 animated:YES];
            
        }
        NSLog(@"%@",sourceArray[index]);
    }
}

/**跑马灯delegate*/
- (void)EightLaborCenterHomeNewsTableViewCellActiondelegate:(EightLaborCenterHomeNewsTableViewCell*)cell index:(NSInteger)index{
    if (self.paomadengarray.count>0) {
        LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
        LearningCenterHomeModel *model = self.paomadengarray[index];
            LCvc1.informationId = model.idx;
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];
        
    }
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (void)titleButtonAction:(UIButton*)sender{
    //    1 党建要闻2 业务知识 3 信息公开4 先锋风采5 教育理论 6 习近平新时代中国特色社会主义思想7 公示公告 8 规章制度  9 工作动态 10 探索创新 11 建设成果  12 党建手账 13 思想文圩 14 立德树人  15 首页轮播
    if (self.lastbutton == sender) {
        return;
    }
    self.tags = 1;
    if (sender.tag == 520) {
        //全部
        self.mytag = 520;
        //全部
        [self requestTeacherLectureHall1];
    }else if (sender.tag == 521){
        //党建要闻
        self.mytag = 521;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 522) {
        //业务知识
        self.mytag = 522;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 523){
        //信息公开
        self.mytag = 523;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 524){
        //先锋风采
        self.mytag = 524;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 525){
        
        self.mytag = 525;
        [self requestactivitymobileActivitygetuplist];
        [self requestCCmyzonegetList];
//        [self requestTeacherLectureHall];
    }else if (sender.tag == 526){
     
        self.mytag = 526;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 527){
      
        self.mytag = 527;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 528){
       
        self.mytag = 528;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 529){
       
        self.mytag = 529;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 530){
     
        self.mytag = 530;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 531){
     
        self.mytag = 531;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 532){
       
        self.mytag = 532;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 533){
        
        self.mytag = 533;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 534){
        
        self.mytag = 534;
        [self requestTeacherLectureHall];
    }else if (sender.tag == 535){
        
        self.mytag = 535;
        [self requestTeacherLectureHall];
    }
    sender.selected = YES;
    self.lastbutton.selected = NO;
    self.lastbutton = sender;
    
}
- (IBAction)messageButtonAction:(id)sender {
    TheMessageCenterViewController *TMvc = [[TheMessageCenterViewController alloc]init];
    [TMvc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:TMvc animated:YES];
}

/**名师讲堂/考试冲关/任务考核/VR看校园 SecondLaborCenterHomeTableViewCellButtonActiondelegate */
- (void)SecondLaborCenterHomeTableViewCellButtonActiondelegate:(SecondLaborCenterHomeTableViewCell*)cell button:(UIButton*)sender state:(LaborCenterState)state{
    DQVRWKViewController *dq1vc = [[DQVRWKViewController alloc]init];
    TeacherLectureHallViewController *TLvc = [[TeacherLectureHallViewController alloc]init];
    AssessmentOfTheTaskViewController *AOvc = [[AssessmentOfTheTaskViewController alloc]init];
    TheExamRushedOffViewController *TEvc = [[TheExamRushedOffViewController alloc]init];
    VRSeeCampusViewController *VRvc = [[VRSeeCampusViewController alloc]init];
    MyClassViewController *MCvc = [[MyClassViewController alloc]init];
    DQWKViewController *PIvc = [[DQWKViewController alloc]initWithNibName:@"DQWKViewController" bundle:nil];
    switch (state) {
        case LaborCenterStateTeacherLectureHall:
            [dq1vc setHidesBottomBarWhenPushed:YES];

//            dq1vc.urlstring = @"http://111.74.0.243:9151/";
            dq1vc.urlstring = @"https://vr.justeasy.cn/view/161977s8z2od4065.html";

        
            [self.navigationController pushViewController:dq1vc animated:YES];
            break;
        case LaborCenterStateTheTest://考试冲关

            self.tabBarController.selectedIndex = 1;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                [[NSNotificationCenter defaultCenter] postNotificationName:@"NewOrder" object:nil];

                [UserInfoManager setDwzn:@"yes"];
            });
            break;
        case LaborCenterStateTheExamRushedOff://任务考核
           
            [MCvc setHidesBottomBarWhenPushed:YES];
            [self.navigationController pushViewController:MCvc animated:YES];
            
            //            [AOvc setHidesBottomBarWhenPushed:YES];
//            [self.navigationController pushViewController:AOvc animated:YES];
            break;
        case LaborCenterStateVRSeeCampus://VR看校园
//            [TEvc setHidesBottomBarWhenPushed:YES];
//            [self.navigationController pushViewController:TEvc animated:YES];
            [PIvc setHidesBottomBarWhenPushed:YES];

            PIvc.urlstring = @"http://ggkf40.cctv.com/";
            [self.navigationController pushViewController:PIvc animated:NO];
            break;
        default:
            break;
    }
}
- (IBAction)seachButtonAction:(id)sender {
    LaborCenterHomeSearchViewController *LCvc = [[LaborCenterHomeSearchViewController alloc]init];
    [LCvc setHidesBottomBarWhenPushed:YES];
    [self.navigationController pushViewController:LCvc animated:YES];
    
}

//MARK: - Utility - 多用途(功能)方法
/**点击视频*/
- (void)FourthLaborCenterHomeTableViewCellCollectionViewActiondelegate:(FourthLaborCenterHomeTableViewCell*)cell index:(NSIndexPath*)indexPath{
//    LaborCenterLessonDetailsViewController *LCvc = [[LaborCenterLessonDetailsViewController alloc]init];
//    LCvc.model = self.array[indexPath.row];
//    LCvc.array = self.array;
//    [LCvc setHidesBottomBarWhenPushed:YES];
//    [self.navigationController pushViewController:LCvc animated:YES];
    
    TeacherLectureHallModel *modelss = self.array[indexPath.row];
    LaborCenterLessonDetailsViewController *LCvc = [[LaborCenterLessonDetailsViewController alloc]init];
//    LCvc.model = self.array[indexPath.row];
//    LCvc.array = self.array;
    LCvc.idx = [NSString stringWithFormat:@"%d",modelss.idx];
    LCvc.courseId = [NSString stringWithFormat:@"%d",modelss.courseId];
    [LCvc setHidesBottomBarWhenPushed:YES];

    [self.navigationController pushViewController:LCvc animated:YES];
}
//MARK: - Network request - 网络请求
/**劳动知识*/
- (void)requestmobileIndexinformationone{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

     para[@"type"] = @"1";

    [LearningCenterRequest mobileIndexinformationonerequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
    }];
}

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
    if (self.mytag == 520) {
//        para[@"classificationId"] = @"1";

    }else if(self.mytag == 521){
        para[@"classificationId"] = @"1";

    }else if(self.mytag == 522){
        para[@"classificationId"] = @"6";

//        para[@"classificationId"] = @"2";

    }else if(self.mytag == 523){
//        para[@"classificationId"] = @"3";
        para[@"classificationId"] = @"4";

    }else if(self.mytag == 524){
//        para[@"classificationId"] = @"4";
        para[@"classificationId"] = @"5";

    }else if(self.mytag == 525){
        para[@"classificationId"] = @"5";

    }else if(self.mytag == 526){
        para[@"classificationId"] = @"6";

    }else if(self.mytag == 527){
        para[@"classificationId"] = @"7";

    }else if(self.mytag == 528){
        para[@"classificationId"] = @"8";

    }else if(self.mytag == 529){
        para[@"classificationId"] = @"9";

    }else if(self.mytag == 530){
        para[@"classificationId"] = @"10";

    }else if(self.mytag == 531){
        para[@"classificationId"] = @"11";

    }else if(self.mytag == 532){
        para[@"classificationId"] = @"12";

    }else if(self.mytag == 533){
        para[@"classificationId"] = @"13";

    }else if(self.mytag == 534){
        para[@"classificationId"] = @"14";

    }else if(self.mytag == 535){
        para[@"classificationId"] = @"15";

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

/**跑马灯*/
- (void)requestactivitygetActivitysList{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"courseId"] = @"6";
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"classificationId"] = @"7";
    para[@"current"] = @"1";
    [LaborCenterRequestDatas TeacherLectureHallrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.paomadengarray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];

    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        [self.myTableView.mj_footer endRefreshing];
    }];
}
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


/**系统消息数量*/
- (void)requestremindMYREMINDsize{
    [LaborCenterRequestDatas remindMYREMINDsizerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        NSArray *ary = result;
        if (ary.count == 0) {
            self.messageCountBottomView.hidden = YES;
        }else{
            NSMutableAttributedString *abt = [[NSMutableAttributedString alloc]initWithString:[NSString stringWithFormat:@"%ld",ary.count]];
            self.messageCountLabel.attributedText = abt;
            self.messageCountBottomView.hidden = NO;

        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**是否有将要开始的活动*/
- (void)requestactivitygetActivitysList1{
    [LaborCenterRequestDatas activitygetActivitysListrequestDataWith2parameters:nil success:^(id  _Nonnull result) {
        NSArray *ary = result;

        if (ary.count == 0) {
        }else{
            [self addtishiView];//提示
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**党员故事坊轮播图*/
- (void)requestactivitymobileActivitygetuplist{
    [MyCircleCenterRequestDatas activitymobileActivitygetuplistrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.gushifanglunboarray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**党员故事坊*/
- (void)requestCCmyzonegetList{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"current"] = [NSString stringWithFormat:@"%ld",self.tags];

    [MyCircleCenterRequestDatas CCmyzonegetListrequestDataWithparameters:para success:^(id  _Nonnull result) {
        if (self.tags == 1) {
            self.gushifangarray = result;
        }else{
            [self.gushifangarray addObjectsFromArray:result];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
