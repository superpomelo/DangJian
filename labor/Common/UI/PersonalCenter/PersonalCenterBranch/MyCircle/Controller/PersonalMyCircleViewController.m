//
//  PersonalMyCircleViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  我的圈子

#import "PersonalMyCircleViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "FirstPersonalMyCircleTableViewCell.h"
#import "SecondPersonalMyCircleTableViewCell.h"
#import "ThirdPersonalMyCircleTableViewCell.h"
#import "PersonalMyCircleModel.h"
#import "MyCircleCenterRequestDatas.h"
#import "MyCircleCenterHomeModel.h"
#import "MyCircleCenterDetails1ViewController.h"
#import "ZeroTop150JieGuoTableViewCell.h"


@interface PersonalMyCircleViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@end

@implementation PersonalMyCircleViewController
//MARK: - Life Cycle - 生命周期

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self requestmyzonegetownzone];
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstPersonalMyCircleTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstPersonalMyCircleTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondPersonalMyCircleTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondPersonalMyCircleTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdPersonalMyCircleTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdPersonalMyCircleTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
        [self requestmyzonegetownzone];
    }];
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
 
    if (self.dataArray.count == 0) {
        return NO;
    }else{
        return YES;
    }
    
}
 
// 定义编辑样式
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {
    return UITableViewCellEditingStyleDelete;
}

// 进入编辑模式，按下出现的编辑按钮后,进行删除操作
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        PersonalMyCircleModel *models = self.dataArray[indexPath.row];
        [self requestmyzonedelegate:[NSString stringWithFormat:@"%d",models.idx]];
    }
}
 
// 修改编辑按钮文字
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    return @"删除";
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        return SCR_H;
    }else{
        return 100;
    }
  
            /**imgorvid   0视频 1-图片 2文本*/
//            PersonalMyCircleModel *model = self.dataArray[indexPath.row];
//            if (model.imgorvid == 0) {
//                return 100;
//            }else if (model.imgorvid == 1){
//                return 100;
//
//            }else{
//                return 100;
//
//            }

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if (self.dataArray.count == 0) {
        return 1;
    }else{
        switch (section) {
            case 0:
                return self.dataArray.count;
                break;


            default:
                break;
        }
        return 0;
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];

         return cell;

    }else{
        /**imgorvid   0视频 1-图片 2文本*/
        PersonalMyCircleModel *model = self.dataArray[indexPath.row];
        if (model.imgorvid == 0) {
            ThirdPersonalMyCircleTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdPersonalMyCircleTableViewCellID"];
             [cell reloadData:self.dataArray[indexPath.row]];
    //         cell.indexPath = indexPath;
    //         cell.delegate = self;
             return cell;


        }else if (model.imgorvid == 1){
            SecondPersonalMyCircleTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondPersonalMyCircleTableViewCellID"];
             [cell reloadData:self.dataArray[indexPath.row]];
    //         cell.indexPath = indexPath;
    //         cell.delegate = self;
             return cell;

        }else{
            FirstPersonalMyCircleTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstPersonalMyCircleTableViewCellID"];
               [cell reloadData:self.dataArray[indexPath.row]];
                return cell;
        }
    }
 

    

}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        
    }else{
        PersonalMyCircleModel *model = self.dataArray[indexPath.row];
//        [self requestmyzonepage:model.idx];
        
//        MyCircleCenterHomeModel *model = self.dataArrayM[indexPath.row];
        MyCircleCenterDetails1ViewController *CDvc1 = [[MyCircleCenterDetails1ViewController alloc]init];
        [CDvc1 setHidesBottomBarWhenPushed:YES];
//        CDvc1.model = self.dataArrayM[indexPath.row];
        CDvc1.idx = [NSString stringWithFormat:@"%d",model.idx];
        [self.navigationController pushViewController:CDvc1 animated:YES];
    }

 
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
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
/**查询我的劳动圈*/
- (void)requestmyzonegetownzone{
    [PersonalCenterRequestDatas myzonegetownzonerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.dataArray = result;
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        self.dataArray = [NSArray array];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    }];
}

/**删除我的劳动圈*/
- (void)requestmyzonedelegate:(NSString *)myzoneId{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"myzoneId"] = myzoneId;
    [PersonalCenterRequestDatas myzonedelegaterequestDataWithparameters:para success:^(id  _Nonnull result) {
        [self requestmyzonegetownzone];
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
