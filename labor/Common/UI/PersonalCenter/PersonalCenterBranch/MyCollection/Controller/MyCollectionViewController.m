//
//  MyCollectionViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyCollectionViewController.h"
#import "FirstMyCollectionTableViewCell.h"
#import "SecondMyCollectionTableViewCell.h"
#import "ThirdMyCollectionTableViewCell.h"
#import "FourthMyCollectionTableViewCell.h"
#import "FivethMyCollectionTableViewCell.h"

#import "PersonalCenterRequestDatas.h"
#import "CollectionKeChengModel.h"
#import "CollectionXinWenModel.h"
#import "CollectionquanziModel.h"
#import "LearningCenterDetails1ViewController.h"
#import "MyCircleCenterDetails1ViewController.h"
#import "LaborCenterLessonDetailsViewController.h"
#import "MyCircleCenterRequestDatas.h"
#import "MyCircleCenterHomeModel.h"
#import "TheExamRushedOffModel.h"
#import "LaborCenterRequestDatas.h"
#import "ZeroTop150JieGuoTableViewCell.h"
#import "LearningCenterDetails1NewsViewController.h"

@interface MyCollectionViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
/**课程 */
@property (weak, nonatomic) IBOutlet UIButton *courseButton;
/** 新闻 */
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
/**动态*/
@property (weak, nonatomic) IBOutlet UIButton *dynamicButton;

@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
/**课程*/
@property (nonatomic,strong) NSArray *kechengArray;
/**新闻*/
@property (nonatomic,strong) NSArray *xinwenArray;
/**圈子*/
@property (nonatomic,strong) NSArray *quanziArray;

/**0课程 1新闻 2圈子*/
@property (nonatomic,assign) NSInteger type;
/**课程 1新闻 2圈子底部view*/
@property (weak, nonatomic) IBOutlet UIView *top2BottomView;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation MyCollectionViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.kechengArray = [NSArray array];
    self.xinwenArray = [NSArray array];
    self.quanziArray = [NSArray array];
    self.type = 1;
    [self initUI];
    [self initmyTableView];
    [self requestsyscollectpage];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"我的收藏" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.top2BottomView.hidden = YES;
    self.courseButton.selected = YES;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyCollectionTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyCollectionTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdMyCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdMyCollectionTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthMyCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthMyCollectionTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FivethMyCollectionTableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethMyCollectionTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self  requestsyscollectpage];
    }];
}

- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    /**0课程 1新闻 2圈子*/
    if (self.type == 0) {
     
        if (self.kechengArray.count == 0) {
            return  NO;
        }else{
            return YES;
        }
    }else if (self.type == 1){
        
           if (self.xinwenArray.count == 0) {
               return  NO;
           }else{
               return YES;
           }
    }else if (self.type == 2) {
       
        if (self.quanziArray.count == 0) {
            return  NO;
        }else{
            return YES;
        }
        
    }
    
    return YES;
}
 
// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        /**0课程 1新闻 2圈子*/
        if (self.type == 0) {
            CollectionKeChengModel *mode = self.kechengArray[indexPath.row][@"information"];
            [self requestsyscollectmycollectdele:mode.idx];
        }else if (self.type == 1){
            CollectionXinWenModel *model = [CollectionXinWenModel mj_objectWithKeyValues:self.xinwenArray[indexPath.row][@"information"]];
//            CollectionXinWenModel *mode = self.xinwenArray[indexPath.row][@"information"];
            [self requestsyscollectmycollectdele:model.idx];
        }else if (self.type == 2) {
            CollectionquanziModel *mode = self.quanziArray[indexPath.row][@"information"];
            [self requestsyscollectmycollectdele:mode.idx];
        }
    }
}
 
// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    /**0课程 1新闻 2圈子*/
    if (self.type == 0) {
       
        if (self.kechengArray.count == 0) {
            return SCR_H-50;
        }else{
            return 100;
        }
    }else if (self.type == 1){

        if (self.xinwenArray.count == 0) {
            return SCR_H-50;
        }else{
            return 100;
        }
    }else if (self.type == 2) {

        if (self.quanziArray.count == 0) {
            return SCR_H-50;
        }else{
            return 100;
        }
    }else{
        return 0;
    }

//    return UITableViewAutomaticDimension;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    /**0课程 1新闻 2圈子*/
    if (self.type == 0) {
       
        if (self.kechengArray.count == 0) {
            return 1;
        }else{
            return self.kechengArray.count;
        }
    }else if (self.type == 1){

        if (self.xinwenArray.count == 0) {
            return 1;
        }else{
            return self.xinwenArray.count;
        }
    }else if (self.type == 2) {

        if (self.quanziArray.count == 0) {
            return 1;
        }else{
            return self.quanziArray.count;
        }
    }else{
        return 0;
    }
 
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    /**0课程 1新闻 2圈子*/
    if (self.type == 0) {
       
        if (self.kechengArray.count == 0) {
            ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
             return cell;
        }else{
            FirstMyCollectionTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyCollectionTableViewCellID"];
             [cell reloadData:self.kechengArray[indexPath.row]];
             return cell;
        }
    }else if (self.type == 1){

        if (self.xinwenArray.count == 0) {
            ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
             return cell;
        }else{
                CollectionXinWenModel *model = [CollectionXinWenModel mj_objectWithKeyValues:self.xinwenArray[indexPath.row][@"information"]];

            if ([model.thumbnail containsString:@"http"]) {
                ThirdMyCollectionTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyCollectionTableViewCellID"];
//                CollectionXinWenModel *model = [CollectionXinWenModel mj_objectWithKeyValues:self.xinwenArray[indexPath.row][@"information"]];
                 [cell reloadData:model];
                 return cell;
            }else{
                SecondMyCollectionTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyCollectionTableViewCellID"];
//                CollectionXinWenModel *model = [CollectionXinWenModel mj_objectWithKeyValues:self.xinwenArray[indexPath.row][@"information"]];
                 [cell reloadData:model];
//                 [cell reloadData:self.xinwenArray[indexPath.row]];
                 return cell;
            }
        }
    }else if (self.type == 2) {

        if (self.quanziArray.count == 0) {
            ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
             return cell;
        }else{
            /**imgorvid   0视频 1-图片 2文本*/
            CollectionquanziModel *model = self.quanziArray[indexPath.row];
            if (model.imgorvid == 2) {
                FourthMyCollectionTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FourthMyCollectionTableViewCellID"];
            [cell reloadData:self.quanziArray[indexPath.row]];
                 return cell;
            }else{
                FivethMyCollectionTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethMyCollectionTableViewCellID"];
               [cell reloadData:self.quanziArray[indexPath.row]];
                 return cell;
            }
        }
    }else{
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
         return cell;
    }
    


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    /**0课程 1新闻 2圈子*/
    if (self.type == 0) {
       
        if (self.kechengArray.count == 0) {
            
        }else{
            CollectionKeChengModel *model = self.kechengArray[indexPath.row];
//            [self requestTeacherLectureHall:model.idx];
            
//            TeacherLectureHallModel *modelss = self.array[indexPath.row];
            LaborCenterLessonDetailsViewController *LCvc = [[LaborCenterLessonDetailsViewController alloc]init];
        //    LCvc.model = self.array[indexPath.row];
        //    LCvc.array = self.array;
            LCvc.idx = [NSString stringWithFormat:@"%d",model.idx];
            LCvc.courseId = [NSString stringWithFormat:@"%d",model.courseId];

            [self.navigationController pushViewController:LCvc animated:YES];
        }
    }else if (self.type == 1){

        if (self.xinwenArray.count == 0) {

        }else{
//            CollectionXinWenModel *model = self.xinwenArray[indexPath.row][@"information"];
            CollectionXinWenModel *model = [CollectionXinWenModel mj_objectWithKeyValues:self.xinwenArray[indexPath.row][@"information"]];
//            LearningCenterDetails1ViewController *LCvc1 = [[LearningCenterDetails1ViewController alloc]init];
//            LCvc1.informationId = model.idx;
//    //        [LCvc1 setHidesBottomBarWhenPushed:YES];
//
//            [self.navigationController pushViewController:LCvc1 animated:YES];
            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
//            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
            LCvc1.informationId = model.idx;
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];
        }
    }else if (self.type == 2) {

        if (self.quanziArray.count == 0) {

        }else{
            CollectionquanziModel *model = self.quanziArray[indexPath.row][@"information"];
//            [self requestmyzonepage:model.idx];
            
            //        MyCircleCenterHomeModel *model = self.dataArrayM[indexPath.row];
//                    MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
//                    [CDvc1 setHidesBottomBarWhenPushed:YES];
//            //        CDvc1.model = self.dataArrayM[indexPath.row];
//                    CDvc1.idx = [NSString stringWithFormat:@"%d",model.idx];
//                    [self.navigationController pushViewController:CDvc1 animated:YES];
            
            LearningCenterDetails1NewsViewController *LCvc1 = [[LearningCenterDetails1NewsViewController alloc]init];
//            LearningCenterHomeModel *model = self.dataArray[indexPath.row];
            LCvc1.informationId = [NSString stringWithFormat:@"%d",model.idx];
            [LCvc1 setHidesBottomBarWhenPushed:YES];

            [self.navigationController pushViewController:LCvc1 animated:YES];
        }
    }
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**课程*/
- (IBAction)courseButtonAction:(UIButton*)sender {
    
    sender.selected = YES;
    self.videoButton.selected = NO;
    self.dynamicButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    self.type = 0;
    [self.myTableView reloadData];
}
/**新闻 */
- (IBAction)videoButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.courseButton.selected = NO;
    self.dynamicButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    self.type = 1;
    [self.myTableView reloadData];
}
/**圈子*/
- (IBAction)dynamicButtonAction:(UIButton*)sender {
    sender.selected = YES;
    self.videoButton.selected = NO;
    self.courseButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    self.type = 2;
    [self.myTableView reloadData];
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**我的收藏*/
- (void)requestsyscollectpage{
//    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
//    dict[@""] = @"";
    [PersonalCenterRequestDatas syscollectpagerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.xinwenArray = result[@"data"];

//        if ([dict.allKeys containsObject:@"listlesson"]) {
//         self.kechengArray =  [CollectionKeChengModel mj_objectArrayWithKeyValuesArray:dict]; //数组
//        }
//        if ([dict.allKeys containsObject:@"list1Info"]) {
//         self.xinwenArray =  [CollectionXinWenModel mj_objectArrayWithKeyValuesArray:dict]; //数组
//        }
//        if ([dict.allKeys containsObject:@"list1Zone"]) {
//         self.quanziArray =  [CollectionquanziModel mj_objectArrayWithKeyValuesArray:dict[@"list1Zone"]]; //数组
//        }
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
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

/**删除收藏*/
- (void)requestsyscollectmycollectdele:(NSInteger)idx{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = [NSString stringWithFormat:@"%ld",(long)idx];
    
    /**0课程 1新闻 2圈子*/
    if (self.type == 0) {
        para[@"type"] = @"2"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈

    }else if(self.type == 1) {
        para[@"type"] = @"1"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈

    }else if(self.type == 2) {
        para[@"type"] = @"4"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈

    }
    
    [LaborCenterRequestDatas syscollectmycollectdelerequestDataWithparameters:para success:^(id  _Nonnull result) {
        [self requestsyscollectpage];
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
