//
//  CommentOnHistoryViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "CommentOnHistoryViewController.h"
#import "FirstCommentOnHistoryTableViewCell.h"
#import "PersonalCenterRequestDatas.h"
#import "LaborCenterLessonDetailsViewController.h"
#import "TheExamRushedOffModel.h"
#import "LaborCenterRequestDatas.h"
#import "TeacherLectureHallModel.h"
#import "kechengModel.h"
#import "LearningCenterHomeModel.h"
#import "LearningCenterDetails1ViewController.h"
#import "MyCircleCenterRequestDatas.h"
#import "MyCircleCenterHomeModel.h"
#import "MyCircleCenterDetails1ViewController.h"
#import "quanziModel.h"
#import "ZeroTop150JieGuoTableViewCell.h"
#import "LearningCenterDetails1NewsViewController.h"

@interface CommentOnHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *kechengButton;
@property (weak, nonatomic) IBOutlet UIButton *xinwenButton;
@property (weak, nonatomic) IBOutlet UIButton *laodongButton;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
/**课程*/
@property (nonatomic,strong) NSArray *kechengArray;
/**新闻*/
@property (nonatomic,strong) NSArray *xinwenArray;
/**圈子*/
@property (nonatomic,strong) NSArray *quanziArray;
/**课程,新闻,圈子 枚举*/
@property (nonatomic,assign)CommentOnHistoryState state;
@property (weak, nonatomic) IBOutlet UIView *top2BottomView;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation CommentOnHistoryViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.kechengArray = [NSArray array];
    self.xinwenArray = [NSArray array];
    self.quanziArray = [NSArray array];
    self.state = CommentOnHistoryStatexinwen;
    [self initUI];
    [self initmyTableView];
    [self requestmobileIndexmynewscomment];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"评论历史" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    
    self.top2BottomView.hidden = YES;
    self.kechengButton.selected = YES;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstCommentOnHistoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstCommentOnHistoryTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        if (self.state == CommentOnHistoryStatekecheng) {
            [self requestmobileLearnmyExperience];
        }else if (self.state == CommentOnHistoryStatexinwen){
            [self requestmobileIndexmynewscomment];

        }else{
            [self requestmyzonemembergetownzone];

        }
    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.state == CommentOnHistoryStatekecheng) {
        if (self.kechengArray.count == 0) {
            return SCR_H-50;
        }else{
            return 125;
        }
    }else if (self.state == CommentOnHistoryStatexinwen){
        if (self.xinwenArray.count == 0) {
            return SCR_H-50;
        }else{
            return 125;
        }
    }else{
        if (self.quanziArray.count == 0) {
            return SCR_H-50;
        }else{
            return 125;
        }
    }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.state == CommentOnHistoryStatekecheng) {
        if (self.kechengArray.count == 0) {
            return 1;
        }else{
            return  self.kechengArray.count;
        }
    }else if (self.state == CommentOnHistoryStatexinwen){
        if (self.xinwenArray.count == 0) {
            return 1;
        }else{
            return  self.xinwenArray.count;
        }
    }else{
        if (self.quanziArray.count == 0) {
            return 1;
        }else{
            return  self.quanziArray.count;
        }
    }


}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.state == CommentOnHistoryStatekecheng) {
        if (self.kechengArray.count == 0) {
            ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
            return cell;
        }else{
            FirstCommentOnHistoryTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstCommentOnHistoryTableViewCellID"];
        if (self.state == CommentOnHistoryStatekecheng) {
            [cell reloadDatakecheng:self.kechengArray[indexPath.row]];
        }else if (self.state == CommentOnHistoryStatexinwen){
            [cell reloadDataxinwen:self.xinwenArray[indexPath.row]];
            
        }else{
            [cell reloadDataquanzi:self.quanziArray[indexPath.row]];
        }
             return cell;
        }
    }else if (self.state == CommentOnHistoryStatexinwen){
        if (self.xinwenArray.count == 0) {
            ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
            return cell;
        }else{
            FirstCommentOnHistoryTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstCommentOnHistoryTableViewCellID"];
        if (self.state == CommentOnHistoryStatekecheng) {
            [cell reloadDatakecheng:self.kechengArray[indexPath.row]];
        }else if (self.state == CommentOnHistoryStatexinwen){
            [cell reloadDataxinwen:self.xinwenArray[indexPath.row]];
            
        }else{
            [cell reloadDataquanzi:self.quanziArray[indexPath.row]];
        }
             return cell;
        }
    }else{
        if (self.quanziArray.count == 0) {
            ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
            return cell;
        }else{
            FirstCommentOnHistoryTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstCommentOnHistoryTableViewCellID"];
        if (self.state == CommentOnHistoryStatekecheng) {
            [cell reloadDatakecheng:self.kechengArray[indexPath.row]];
        }else if (self.state == CommentOnHistoryStatexinwen){
            [cell reloadDataxinwen:self.xinwenArray[indexPath.row]];
            
        }else{
            [cell reloadDataquanzi:self.quanziArray[indexPath.row]];
        }
             return cell;
        }
    }



    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (self.state == CommentOnHistoryStatekecheng) {
        if (self.kechengArray.count == 0) {

        }else{
            if (self.state == CommentOnHistoryStatekecheng) {
                kechengModel *model = self.kechengArray[indexPath.row];
//                [self requestTeacherLectureHall:model.lessonId];
//                TeacherLectureHallModel *modelss = self.array[indexPath.row];
                LaborCenterLessonDetailsViewController *LCvc = [[LaborCenterLessonDetailsViewController alloc]init];
            //    LCvc.model = self.array[indexPath.row];
            //    LCvc.array = self.array;
                LCvc.idx = [NSString stringWithFormat:@"%d",model.lessonId];
                LCvc.courseId = [NSString stringWithFormat:@"%d",model.courseId];

                [self.navigationController pushViewController:LCvc animated:YES];
            }else if (self.state == CommentOnHistoryStatexinwen){
                xinwenModel *model = self.xinwenArray[indexPath.row];
                LearningCenterDetails1ViewController *LCvc1 = [[LearningCenterDetails1ViewController alloc]init];
                LCvc1.informationId = model.informationId;
        //        [LCvc1 setHidesBottomBarWhenPushed:YES];

                [self.navigationController pushViewController:LCvc1 animated:YES];
            }else{
                quanziModel *model = self.quanziArray[indexPath.row];
                [self requestmyzonepage:model.myzoneId];
            }
        }
    }else if (self.state == CommentOnHistoryStatexinwen){
        if (self.xinwenArray.count == 0) {
           
        }else{
            if (self.state == CommentOnHistoryStatekecheng) {
                kechengModel *model = self.kechengArray[indexPath.row];
                [self requestTeacherLectureHall:model.lessonId];
            }else if (self.state == CommentOnHistoryStatexinwen){
                xinwenModel *model = self.xinwenArray[indexPath.row];
                LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
    //            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
                LCvc1.informationId = model.idx;
                [LCvc1 setHidesBottomBarWhenPushed:YES];

                [self.navigationController pushViewController:LCvc1 animated:YES];
//                LearningCenterDetails1ViewController *LCvc1 = [[LearningCenterDetails1ViewController alloc]init];
//                LCvc1.informationId = model.informationId;
//        //        [LCvc1 setHidesBottomBarWhenPushed:YES];
//
//                [self.navigationController pushViewController:LCvc1 animated:YES];
            }else{
                quanziModel *model = self.quanziArray[indexPath.row];
                [self requestmyzonepage:model.myzoneId];
            }
        }
    }else{
        if (self.quanziArray.count == 0) {
            
        }else{
            if (self.state == CommentOnHistoryStatekecheng) {
                kechengModel *model = self.kechengArray[indexPath.row];
                [self requestTeacherLectureHall:model.lessonId];
            }else if (self.state == CommentOnHistoryStatexinwen){
                xinwenModel *model = self.xinwenArray[indexPath.row];
                LearningCenterDetails1ViewController *LCvc1 = [[LearningCenterDetails1ViewController alloc]init];
                LCvc1.informationId = model.informationId;
        //        [LCvc1 setHidesBottomBarWhenPushed:YES];

                [self.navigationController pushViewController:LCvc1 animated:YES];
            }else{
                quanziModel *model = self.quanziArray[indexPath.row];
//                [self requestmyzonepage:model.myzoneId];
                
                //        MyCircleCenterHomeModel *model = self.dataArrayM[indexPath.row];
                        MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
                        [CDvc1 setHidesBottomBarWhenPushed:YES];
                //        CDvc1.model = self.dataArrayM[indexPath.row];
                        CDvc1.idx = [NSString stringWithFormat:@"%d",model.myzoneId];
                        [self.navigationController pushViewController:CDvc1 animated:YES];
            }
        }
    }
    

}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**课程*/
- (IBAction)kechengButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.xinwenButton.selected = NO;
    self.laodongButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    self.state = CommentOnHistoryStatekecheng;
    [self requestmobileLearnmyExperience];
}
/**新闻*/
- (IBAction)xinwenButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.kechengButton.selected = NO;
    self.laodongButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    self.state = CommentOnHistoryStatexinwen;
    [self requestmobileIndexmynewscomment];
}
/**劳动圈*/
- (IBAction)laodongButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.kechengButton.selected = NO;
    self.xinwenButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    self.state = CommentOnHistoryStatequanzi;
    [self requestmyzonemembergetownzone];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**个人已发表心得接口<课程>*/
- (void)requestmobileLearnmyExperience{
    [PersonalCenterRequestDatas mobileLearnmyExperiencerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.kechengArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.kechengArray = [NSArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**我的新闻评论<新闻>*/
- (void)requestmobileIndexmynewscomment{
    [PersonalCenterRequestDatas mobileIndexmynewscommentrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.xinwenArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.xinwenArray = [NSArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}
/**我的劳动圈评论<劳动圈>*/
- (void)requestmyzonemembergetownzone{
    [PersonalCenterRequestDatas myzonemembergetownzonerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.quanziArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.quanziArray = [NSArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**名师讲堂-<课时列表>*/

- (void)requestTeacherLectureHall:(NSInteger)lessonId{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"courseId"] = @"6";
    [LaborCenterRequestDatas TeacherLectureHallrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        NSArray *ary = result;
//        for (int i = 0; i<ary.count; i++) {
//            TeacherLectureHallModel *model = ary[i];
//            if (model.idx == lessonId) {
//                LaborCenterLessonDetailsViewController *LCvc = [[LaborCenterLessonDetailsViewController alloc]init];
//                LCvc.model = model;
//                LCvc.array = result;
//                [self.navigationController pushViewController:LCvc animated:YES];
//            }
//        }

    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**分页查询<全部圈子>*/
- (void)requestmyzonepage:(NSInteger)myzoneId{
    [MyCircleCenterRequestDatas myzonepagerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        NSArray *ary = result;
        for (int i = 0; i<ary.count; i++) {
            MyCircleCenterHomeModel *model = ary[i];
            if (model.idx == myzoneId) {
                MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
//                [CDvc1 setHidesBottomBarWhenPushed:YES];
//                 CDvc1.model = model;
                [self.navigationController pushViewController:CDvc1 animated:YES];
            }

        }
        
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
