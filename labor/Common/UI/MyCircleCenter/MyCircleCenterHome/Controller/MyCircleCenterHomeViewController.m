//
//  MyCircleCenterHomeViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyCircleCenterHomeViewController.h"
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
#import "SixthMyCircleCenterHomeTableViewCell.h"
#import "TaskAssessmentDetailsViewController.h"
#import "MingZhuMyCircleCenterHomeTableViewCell.h"
#import "MingZhuPingYiDetailsViewController.h"
#import "ZhuTiMyCircleCenterHomeTableViewCell.h"
#import "ZhuTiHuoDongDetailsViewController.h"
#import "MyCircleCenterRequestDatas.h"
#import "DangYuanGuShiFangModel.h"
#import "MingZhuPingYiModel.h"

#import "SecondFirstMyCircleCenterHomeTableViewCell.h"
#import "NewFirstMyCircleCenterHomeTableViewCell.h"
#import "NewHuoDongModel.h"
#import "GuShiFangModel.h"
#import "MyCircleCenterDetails1ViewController.h"

#import "FivethLearningCenterHomeTableViewCell.h"
#import "SecondLearningCenterHomeTableViewCell.h"
#import "ThirdLearningCenterHomeTableViewCell.h"

@interface MyCircleCenterHomeViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate,JLCycleScrollerViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *theTitleView;
@property (nonatomic,weak)UIButton *lastbutton;
@property (nonatomic,assign)NSInteger mytag;
@property (nonatomic,strong)NSArray *lunboarray;
@property (nonatomic,strong)NSMutableArray *dataArray;
@property (nonatomic,strong)NSMutableArray *pingyidataArray;
@property (nonatomic,strong)NSMutableArray *huodongdataArray;

@property (nonatomic,strong)NSArray *titleArray;
@property (weak, nonatomic) IBOutlet UIView *topBottomView;
@property (weak, nonatomic) IBOutlet UIView *navBottomView;
/**页码*/
@property(nonatomic,assign)NSInteger tags;
@property (weak, nonatomic) IBOutlet UILabel *titlesTLabel;
@property (weak, nonatomic) IBOutlet UIButton *sanhuiyikeButton;
@property (weak, nonatomic) IBOutlet UIButton *zhutidangriButton;
@property (weak, nonatomic) IBOutlet UIButton *dangjianshouzhangButton;

@end

@implementation MyCircleCenterHomeViewController


//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    _titleArray = @[@"劳动知识",@"民俗知识",@"国学知识",@"农业科技",@"新闻时事",@"时代先锋"];
    self.dangjianshouzhangButton.hidden = YES;
    self.tags = 1;
    self.dataArray = [NSMutableArray array];
    self.pingyidataArray = [NSMutableArray array];
    self.lunboarray = [NSArray array];
    self.huodongdataArray = [NSMutableArray array];
//    self.titleArray = @[@"党员故事坊",@"民主评议",@"三会一课",@"主题活动",@"党建生活"];
//    self.titleArray = @[@"三会一课",@"主题党日",@"党建手账"];
    self.titleArray = @[@"三会一课",@"主题党日"];
    self.mytag = 600;
    [self initUI];
//    [self initscrollerView];
    [self initmyTableView];
//    [self requestCCmyzonegetList];
    //三会一课
    [self requestactivitymobileActivitygetPage];
    [self requestTeacherLectureHall];
//    [self requestmobileIndexcarouselIndex];//轮播图
//    [self requestmobileIndexinformationone]; //劳动知识
    self.fd_prefersNavigationBarHidden = YES;
//    [self requestactivitymobileActivitygetuplist];
    
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.sanhuiyikeButton.selected = YES;
    NSMutableAttributedString *attributedString3 = [[NSMutableAttributedString alloc] initWithString:@"党建活动" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"Source Han Serif CN" size: 18],NSForegroundColorAttributeName:[UIColor whiteColor]}];
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
            btn = [[UIButton alloc]initWithFrame:CGRectMake(10+80*i, 0, 110, 50)];
        
        }else{
           btn = [[UIButton alloc]initWithFrame:CGRectMake(10+85*i, 0, 110, 50)];
            btn.titleLabel.textAlignment = NSTextAlignmentLeft;

        }
        [btn setTitle:_titleArray[i] forState:UIControlStateNormal];

        
//                NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"特别提醒" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        

        NSMutableAttributedString *string = [[NSMutableAttributedString alloc] initWithString:_titleArray[i] attributes:@{NSFontAttributeName: [UIFont fontWithName:@"PingFang SC" size: 16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        [btn setAttributedTitle:string forState:UIControlStateNormal];


        NSMutableAttributedString *Selstring = [[NSMutableAttributedString alloc] initWithString:_titleArray[i] attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:22],NSForegroundColorAttributeName: [UIColor colorWithRed:212/255.0 green:55/255.0 blue:55/255.0 alpha:1.0]}];
        [btn setAttributedTitle:Selstring forState:UIControlStateSelected];
        [btn addTarget:self action:@selector(titleButtonAction:) forControlEvents:UIControlEventTouchUpInside];
        btn.tag = 600 + i;
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
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthLearningCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FivethLearningCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethLearningCenterHomeTableViewCellID"];
    
   
    [self.myTableView registerNib:[UINib nibWithNibName:@"MingZhuMyCircleCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"MingZhuMyCircleCenterHomeTableViewCellID"];
   
    [self.myTableView registerNib:[UINib nibWithNibName:@"SixthMyCircleCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SixthMyCircleCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZhuTiMyCircleCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZhuTiMyCircleCenterHomeTableViewCellID"];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondFirstMyCircleCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondFirstMyCircleCenterHomeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"NewFirstMyCircleCenterHomeTableViewCell" bundle:nil] forCellReuseIdentifier:@"NewFirstMyCircleCenterHomeTableViewCellID"];
  
    
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{

        self.tags = 1;
       // @[@"党员故事坊",@"民主评议",@"三会一课",@"主题活动",@"党建生活"];
        if (self.mytag == 600) {
           
            //三会一课
            [self requestactivitymobileActivitygetPage];
            [self requestTeacherLectureHall];
//            [self requestmobileIndexinformationone];
        }else if (self.mytag == 601) {
            //主题党日
            [self requestTeacherLectureHall];
//            [self requestmobileIndexinformationtwo];
        }else if (self.mytag == 602) {
            //三会一课
            [self requestactivitymobileActivitygetPage];
        }else if (self.mytag == 603) {
            //主题活动
            [self requestactivitymobileActivitygetPage];
        }else if (self.mytag == 604) {
            //党建生活
            [self requestactivitymobileActivitygetPage];
        }
        }];
    self.myTableView.mj_footer = [MJRefreshBackNormalFooter footerWithRefreshingBlock:^{

        self.tags++;
//        self.tags = 0;
       // @[@"三会一课",@"主题党日",@"党建手账"];
        if (self.mytag == 600) {
            //三会一课
            [self requestactivitymobileActivitygetPage];
            [self requestTeacherLectureHall];

//            [self requestmobileIndexcarouselIndex];//轮播图
//            //党员故事坊
//            [self requestCCmyzonegetList];

//            [self requestmobileIndexinformationone];
        }else if (self.mytag == 601) {
            //主题党日
            [self requestTeacherLectureHall];
//            [self requestmobileIndexinformationtwo];
        }else if (self.mytag == 602) {
            //三会一课
            [self requestactivitymobileActivitygetPage];
        }else if (self.mytag == 603) {
            //主题活动
            [self requestactivitymobileActivitygetPage];
        }else if (self.mytag == 604) {
            //党建生活
            [self requestactivitymobileActivitygetPage];
        }
    }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.mytag == 600) {
        return 2;

    }else if (self.mytag == 601){
        return 1;

    }else{
        return 1;
    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.mytag == 600) {
        if (section==0) {
            return self.huodongdataArray.count;

        }else{
            return self.dataArray.count;

        }

    }else if (self.mytag == 601){
        return self.dataArray.count;

    }else{
        return self.huodongdataArray.count;
    }
  
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mytag == 600) {
    
      if (indexPath.section == 0) {
          ZhuTiMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZhuTiMyCircleCenterHomeTableViewCellID"];

          [cell reloadData:self.huodongdataArray[indexPath.row]];
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
        
//        DangYuanGuShiFangModel *model = self.dataArray[indexPath.row];
//
//          if ([model.cover containsString:@"http"]){
//              //图片格式
//              NewFirstMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"NewFirstMyCircleCenterHomeTableViewCellID"];
//                [cell reloadData:model];
//                return cell;
//            }else{
//              //文字格式
//                SecondFirstMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondFirstMyCircleCenterHomeTableViewCellID"];
//                [cell reloadData:model];
//                 return cell;
//            }
        }


    }else if(self.mytag == 601){
//        MingZhuMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"MingZhuMyCircleCenterHomeTableViewCellID"];
//        [cell reloadData:self.pingyidataArray[indexPath.row]];
//         return cell;
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
    }else if(self.mytag == 602){
        ZhuTiMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZhuTiMyCircleCenterHomeTableViewCellID"];
        [cell reloadData:self.huodongdataArray[indexPath.row]];
         return cell;
    }else if(self.mytag == 603){
        ZhuTiMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZhuTiMyCircleCenterHomeTableViewCellID"];
        [cell reloadData:self.huodongdataArray[indexPath.row]];

         return cell;
    }else{
        ZhuTiMyCircleCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZhuTiMyCircleCenterHomeTableViewCellID"];
        [cell reloadData:self.huodongdataArray[indexPath.row]];

         return cell;
    }

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.mytag == 600) {
//    if (indexPath.section==1) {
// 
//            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
//            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
//            LCvc1.informationId = model.idx;
//            [LCvc1 setHidesBottomBarWhenPushed:YES];
//
//            [self.navigationController pushViewController:LCvc1 animated:YES];
//        }
//        GuShiFangModel *model = self.dataArray[indexPath.row];
//        MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
//        [CDvc1 setHidesBottomBarWhenPushed:YES];
////        CDvc1.model = self.dataArrayM[indexPath.row];
//        CDvc1.idx = [NSString stringWithFormat:@"%d",model.idx];
//        [self.navigationController pushViewController:CDvc1 animated:YES];
        if (indexPath.section==0) {
            ZhuTiHuoDongDetailsViewController *TAvc = [[ZhuTiHuoDongDetailsViewController alloc]init];
            NewHuoDongModel *model = self.huodongdataArray[indexPath.row];
                TAvc.activityId = [NSString stringWithFormat:@"%d",model.idx];
            [TAvc setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:TAvc animated:YES];
        }else if(indexPath.section==1){
            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
            LCvc1.informationId = model.idx;
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];
        }

    }else if (self.mytag == 601) {
        LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
        LearningCenterHomeModel *model = self.dataArray[indexPath.row];
        LCvc1.informationId = model.idx;
        [LCvc1 setHidesBottomBarWhenPushed:YES];

        [self.navigationController pushViewController:LCvc1 animated:YES];
//        MingZhuPingYiDetailsViewController *LCvc1 = [[MingZhuPingYiDetailsViewController alloc]init];
//        MingZhuPingYiModel *model = self.pingyidataArray[indexPath.row];
//        LCvc1.votingId = [NSString stringWithFormat:@"%d",model.idx];
//        [LCvc1 setHidesBottomBarWhenPushed:YES];
//
//        [self.navigationController pushViewController:LCvc1 animated:YES];
    }else if (self.mytag == 602) {
        ZhuTiHuoDongDetailsViewController *TAvc = [[ZhuTiHuoDongDetailsViewController alloc]init];
        NewHuoDongModel *model = self.huodongdataArray[indexPath.row];
            TAvc.activityId = [NSString stringWithFormat:@"%d",model.idx];
        [TAvc setHidesBottomBarWhenPushed:YES];

        [self.navigationController pushViewController:TAvc animated:YES];
    }else if (self.mytag == 603) {
        ZhuTiHuoDongDetailsViewController *TAvc = [[ZhuTiHuoDongDetailsViewController alloc]init];
        NewHuoDongModel *model = self.huodongdataArray[indexPath.row];
            TAvc.activityId = [NSString stringWithFormat:@"%d",model.idx];
        [TAvc setHidesBottomBarWhenPushed:YES];

        [self.navigationController pushViewController:TAvc animated:YES];
//        TaskAssessmentDetailsViewController *TAvc = [[TaskAssessmentDetailsViewController alloc]init];
////            TAvc.model = self.dataArrayM[indexPath.row];
//        [TAvc setHidesBottomBarWhenPushed:YES];
//
//        [self.navigationController pushViewController:TAvc animated:YES];
    }else if (self.mytag == 604) {
        
        ZhuTiHuoDongDetailsViewController *TAvc = [[ZhuTiHuoDongDetailsViewController alloc]init];
        NewHuoDongModel *model = self.huodongdataArray[indexPath.row];
            TAvc.activityId = [NSString stringWithFormat:@"%d",model.idx];
        [TAvc setHidesBottomBarWhenPushed:YES];

        [self.navigationController pushViewController:TAvc animated:YES];
    }

 
}

/**
 点击轮播Cell代理
 @param index 点击的<0.1.2...>
 @param sourceArray 传入进来的原始数据
 */
-(void)jl_cycleScrollerView:(JLCycleScrollerView*)view didSelectItemAtIndex:(NSInteger)index sourceArray:(NSArray*)sourceArray{
    if (self.lunboarray.count>0) {
        GuShiFangModel *model = self.lunboarray[index];
        MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
        [CDvc1 setHidesBottomBarWhenPushed:YES];
//        CDvc1.model = self.dataArrayM[indexPath.row];
        CDvc1.idx = [NSString stringWithFormat:@"%d",model.idx];
        [self.navigationController pushViewController:CDvc1 animated:YES];
        
//            LearningCenterDetails1ViewController *LCvc1 = [[LearningCenterDetails1ViewController alloc]init];
//           LaborLunBoModel *model = self.lunboarray[index];
//            LCvc1.informationId = model.idx;
//            [LCvc1 setHidesBottomBarWhenPushed:YES];
//
//            [self.navigationController pushViewController:LCvc1 animated:YES];
        
    }
    NSLog(@"%@",sourceArray[index]);
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (void)titleButtonAction:(UIButton*)sender{
    if (self.lastbutton == sender) {
        return;
    }
    sender.selected = YES;

    self.tags = 1;
    // @[@"党员故事坊",@"民主评议",@"三会一课",@"主题活动",@"党建生活"];

    if (sender.tag == 600) {
        //党员故事坊
        self.mytag = 600;
//        if (sender.selected == YES) {
//            sender.frame = CGRectMake(10, -2, 110, 50);
//            self.lastbutton.frame = CGRectMake(self.lastbutton.frame.origin.x, 0, 110, 50);
//        }

        [self requestCCmyzonegetList];
    }else if (sender.tag == 601){
        //民主评议
        self.mytag = 601;
//        if (sender.selected == YES) {
//            sender.frame = CGRectMake(10+85*(sender.tag-600), -2, 110, 50);
//            self.lastbutton.frame = CGRectMake(self.lastbutton.frame.origin.x, 0, 110, 50);
//
//        }

        //主题党日
        [self requestTeacherLectureHall];
//        [self requestmobileIndexinformationtwo];
    }else if (sender.tag == 602) {
        //三会一课
        self.mytag = 602;
        if (sender.selected == YES) {
            sender.frame = CGRectMake(10+85*(sender.tag-600), -2, 110, 50);
            self.lastbutton.frame = CGRectMake(self.lastbutton.frame.origin.x, 0, 110, 50);
        }

        [self requestactivitymobileActivitygetPage];
    }else if (sender.tag == 603){
        //主题活动
        self.mytag = 603;
        [self requestactivitymobileActivitygetPage];
    }else if (sender.tag == 604){
        //党建生活
        self.mytag = 604;
        [self requestactivitymobileActivitygetPage];
    }
    self.lastbutton.selected = NO;
    self.lastbutton = sender;
    
}

- (IBAction)sanhuiyikeButtonAction:(UIButton*)sender {
    self.mytag = 600;
    self.tags = 1;
    sender.selected = YES;
    self.zhutidangriButton.selected = NO;
    self.dangjianshouzhangButton.selected = NO;
    
    //三会一课
    [self requestactivitymobileActivitygetPage];
    [self requestTeacherLectureHall];

}
- (IBAction)zhutidangriButtonAction:(UIButton*)sender {
    self.mytag = 601;
    self.tags = 1;
    sender.selected = YES;
    self.sanhuiyikeButton.selected = NO;
    self.dangjianshouzhangButton.selected = NO;
    
    //主题党日
    [self requestTeacherLectureHall];
}
- (IBAction)dangjianshouzhangButtonAction:(UIButton*)sender {
    self.mytag = 602;

    self.tags = 1;
    sender.selected = YES;
    self.zhutidangriButton.selected = NO;
    self.sanhuiyikeButton.selected = NO;
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**党员故事坊*/
- (void)requestCCmyzonegetList{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"current"] = [NSString stringWithFormat:@"%ld",self.tags];

    [MyCircleCenterRequestDatas CCmyzonegetListrequestDataWithparameters:para success:^(id  _Nonnull result) {
        if (self.tags == 0) {
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
/**民主评议*/
- (void)requestactivityvotingvotingCenter{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"current"] = [NSString stringWithFormat:@"%ld",self.tags];

    [MyCircleCenterRequestDatas activityvotingvotingCenterrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.pingyidataArray = result;
        if (self.tags == 0) {
            self.pingyidataArray = result;
        }else{
            [self.pingyidataArray addObjectsFromArray:result];
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
/**三会一课，主题活动，党建活动*/
- (void)requestactivitymobileActivitygetPage{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    if (self.mytag == 602) {
//        para[@"categoryId"] = @"1";
//
//    }else if(self.mytag == 603) {
//        para[@"categoryId"] = @"2";
//
//    }else if(self.mytag == 604) {
//        para[@"categoryId"] = @"3";
//
//    }
    para[@"current"] = [NSString stringWithFormat:@"%ld",self.tags];

    [MyCircleCenterRequestDatas activitymobileActivitygetPagerequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.huodongdataArray = result;
        if (self.tags == 1) {
            self.huodongdataArray = result;
        }else{
            [self.huodongdataArray addObjectsFromArray:result];
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
//- (void)requestmobileIndexinformationone{
//     NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//     para[@"type"] = @"1";
//
//    [LearningCenterRequest mobileIndexinformationonerequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.dataArray = result;
//        [self.myTableView reloadData];
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    } failure:^(NSError * _Nonnull error) {
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    }];
//}
/**民俗知识*/
//- (void)requestmobileIndexinformationtwo{
//     NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//     para[@"type"] = @"2";
//
//    [LearningCenterRequest mobileIndexinformationtworequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.dataArray = result;
//        [self.myTableView reloadData];
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    } failure:^(NSError * _Nonnull error) {
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    }];
//}
///**国学知识*/
//- (void)requestmobileIndexinformationthr{
//     NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//     para[@"type"] = @"3";
//
//    [LearningCenterRequest mobileIndexinformationthrrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.dataArray = result;
//        [self.myTableView reloadData];
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    } failure:^(NSError * _Nonnull error) {
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    }];
//}
//
///**农业科技*/
//- (void)requestmobileIndexinformationfou{
//     NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//     para[@"type"] = @"4";
//
//    [LearningCenterRequest mobileIndexinformationfourequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.dataArray = result;
//        [self.myTableView reloadData];
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    } failure:^(NSError * _Nonnull error) {
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    }];
//}
//
///**新闻时事*/
//- (void)requestmobileIndexinformationfiv{
//     NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//     para[@"type"] = @"5";
//
//    [LearningCenterRequest mobileIndexinformationfivrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.dataArray = result;
//        [self.myTableView reloadData];
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    } failure:^(NSError * _Nonnull error) {
//        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
//    }];
//}

/**首页轮播*/
- (void)requestmobileIndexcarouselIndex{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"type"] = @"10";
    [LaborCenterRequestDatas mobileIndexcarouselIndexrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.lunboarray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**党员故事坊轮播图*/
- (void)requestactivitymobileActivitygetuplist{
    [MyCircleCenterRequestDatas activitymobileActivitygetuplistrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.lunboarray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**获取劳动知识*/
- (void)requestTeacherLectureHall{
//    1 党建要闻2 业务知识 3 信息公开4 先锋风采5 教育理论 6 习近平新时代中国特色社会主义思想7 公示公告 8 规章制度  9 工作动态 10 探索创新 11 建设成果  12 党建手账 13 思想文圩 14 立德树人  15 首页轮播
    
   
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    if (self.mytag == 600) {
        para[@"classificationId"] = @"12";

    }else if(self.mytag == 601){
        para[@"classificationId"] = @"11";

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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end

