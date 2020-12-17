//
//  LaborCenterHomeSearchResultViewController.m
//  labor
//
//  Created by 狍子 on 2020/10/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LaborCenterHomeSearchResultViewController.h"
#import "LaborCenterRequestDatas.h"
#import "FirstLearningCenterHomeTableViewCell.h"
#import "SecondLearningCenterHomeTableViewCell.h"
#import "ThirdLearningCenterHomeTableViewCell.h"
#import "FourthLearningCenterHomeTableViewCell.h"
#import "FivethLearningCenterHomeTableViewCell.h"
#import "LearningCenterDetails1ViewController.h"
#import "LearningCenterHomeModel.h"
#import "TeacherLectureHallModel.h"
#import "LaborCenterLessonDetailsViewController.h"
#import "ZeroJieGuo2TableViewCell.h"
#import "LearningCenterDetails1NewsViewController.h"

@interface LaborCenterHomeSearchResultViewController ()<UITableViewDelegate,UITableViewDataSource,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *xinwenButton;
@property (weak, nonatomic) IBOutlet UIButton *kechengButton;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@property (weak, nonatomic) IBOutlet UIView *top2BottomView;

@property (weak, nonatomic) IBOutlet UITextField *sousuoTextfild;
@property (weak, nonatomic) IBOutlet UIView *navBottomView;
@property (weak, nonatomic) IBOutlet UIView *sousuoBottomView;
/**0-新闻， 1-课程*/
@property (nonatomic,assign)NSInteger tagt;
@property (nonatomic,strong)NSMutableArray *dataArrayM;

@end

@implementation LaborCenterHomeSearchResultViewController
//MARK: - Life Cycle - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.dataArrayM = [NSMutableArray array];
    self.tagt = 0;
    [self initUI];
    [self initmyTableView];
    [self requestmobileIndexselect];
    self.fd_prefersNavigationBarHidden = YES;

}
//MARK: - Initalization - 初始化
-(void)initUI{
    self.top2BottomView.hidden = YES;
    self.xinwenButton.selected = YES;
    self.sousuoBottomView.layer.cornerRadius = self.sousuoBottomView.bounds.size.height/2;
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
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroJieGuo2TableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroJieGuo2TableViewCellID"];
    
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (self.tagt == 0) {
            [self requestmobileIndexselect];

        }else{
            [self requestmobileLearnselect];
        }
        
        }];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;

}
//- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (self.dataArrayM.count>0) {
//
//        if (self.tagt == 0) {
//            LearningCenterHomeModel *model = self.dataArrayM[indexPath.section];
//            if ([model.body containsString:@"http"]&&[model.body containsString:@"mp4"]) {
//                //视频格式
//                 return 300;
//            }else if ([model.body containsString:@"http"]){
//                //图片格式
//                return 100;
//            }else{
//               //文字格式
//                return 100;
//            }
//        }else{
//
//            //视频格式
//             return 300;
//        }
//
//
//
//    }else{
//        return 220;
//    }
//}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataArrayM.count == 0) {
        return 1;
    }else{
        return self.dataArrayM.count;

    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArrayM.count == 0) {
        ZeroJieGuo2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroJieGuo2TableViewCellID"];
         return cell;
    }else{
        if (self.tagt == 0) {
           //新闻
            LearningCenterHomeModel *model = self.dataArrayM[indexPath.section];
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

        }else{
            //课程
            
            TeacherLectureHallModel *model = self.dataArrayM[indexPath.section];

            //视频格式
               FivethLearningCenterHomeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethLearningCenterHomeTableViewCellID"];
            cell.titleLabel.text = model.title;
            cell.timeLabel.text = model.createTime;
            NSURL *Url;
            if ([model.faceUrl containsString:@"http"]) {
                Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",model.faceUrl]];

            }else{
                Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.faceUrl]];

            }
            [cell.videoImageView sd_setImageWithURL:Url placeholderImage:[UIImage imageNamed:@""]];
                return cell;
        }
    }

    


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArrayM.count == 0) {
        
    }else{
        if (self.tagt == 0) {
            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
            LearningCenterHomeModel *model = self.dataArrayM[indexPath.section];
            LCvc1.informationId = model.idx;
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];
//            LearningCenterDetails1ViewController *LCvc1 = [[LearningCenterDetails1ViewController alloc]init];
//            LearningCenterHomeModel *model = self.dataArrayM[indexPath.section];
//            LCvc1.informationId = model.idx;
//            [LCvc1 setHidesBottomBarWhenPushed:YES];
//
//            [self.navigationController pushViewController:LCvc1 animated:YES];
        }else{
//            LaborCenterLessonDetailsViewController *LCvc = [[LaborCenterLessonDetailsViewController alloc]init];
//            LCvc.model = self.dataArrayM[indexPath.row];
//
//            LCvc.array = self.dataArrayM;
//            [self.navigationController pushViewController:LCvc animated:YES];
            
            TeacherLectureHallModel *modelss = self.dataArrayM[indexPath.row];
            LaborCenterLessonDetailsViewController *LCvc = [[LaborCenterLessonDetailsViewController alloc]init];
        //    LCvc.model = self.array[indexPath.row];
        //    LCvc.array = self.array;
            LCvc.idx = [NSString stringWithFormat:@"%d",modelss.idx];
            LCvc.courseId = [NSString stringWithFormat:@"%d",modelss.courseId];

            [self.navigationController pushViewController:LCvc animated:YES];
        }
    }


 
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
/**新闻*/
- (IBAction)xinwenButtonAction:(UIButton*)sender {
    self.tagt = 0;

    sender.selected = YES;
    self.kechengButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestmobileIndexselect];
}

/**课程*/
- (IBAction)kechengButtonAction:(UIButton*)sender {
    self.tagt = 1;
    sender.selected = YES;
    self.xinwenButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    [self requestmobileLearnselect];
}

- (IBAction)sousuoButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**返回*/
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**课程搜索*/
- (void)requestmobileLearnselect{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"select"] = self.search;
    [LaborCenterRequestDatas mobileLearnselectrequestDataWithparameters:para success:^(id  _Nonnull result) {
     
        
        self.dataArrayM = [NSMutableArray arrayWithArray:result];    [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
    
        self.dataArrayM = [NSMutableArray array];
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
        
    }];
}

/**新闻搜索*/
- (void)requestmobileIndexselect{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"select"] = self.search;
    [LaborCenterRequestDatas mobileIndexselectrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
        self.dataArrayM = [NSMutableArray arrayWithArray:result];
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.dataArrayM = [NSMutableArray array];
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
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
