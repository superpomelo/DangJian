//
//  MyTaskAssessmentTeacher3ViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyTaskAssessmentTeacher3ViewController.h"
#import <IQKeyboardManager.h>
#import "FirstMyTaskAssessmentTeacher3TableViewCell.h"
#import "SecondMyTaskAssessmentTeacher3TableViewCell.h"
#import "ThirdMyTaskAssessmentTeacher3TableViewCell.h"
#import "FourthMyTaskAssessmentTeacher3TableViewCell.h"
#import "GKPhotoBrowser.h"
#import "PersonalCenterRequestDatas.h"
#import "MyTaskAssessmentTeacher3Model.h"

@interface MyTaskAssessmentTeacher3ViewController ()<UITableViewDelegate,UITableViewDataSource,ThirdMyTaskAssessmentTeacher3TableViewCellDelegate,FourthMyTaskAssessmentTeacher3TableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)MyTaskAssessmentTeacher3Model *model;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;


@end

@implementation MyTaskAssessmentTeacher3ViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titlesLabel.text = [NSString stringWithFormat:@"关于%@的活动",self.titleName];
    [self initmyTableView];
    [self initUI];
    [self requestexperiencebyuserid];
    self.fd_prefersNavigationBarHidden = YES;

   
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    // [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
}


- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
// [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES; // 控制是否显示键盘上的工具条

 }

//MARK: - Initalization - 初始化

- (void)initUI{
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.estimatedRowHeight = 70.0;

    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyTaskAssessmentTeacher3TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyTaskAssessmentTeacher3TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyTaskAssessmentTeacher3TableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyTaskAssessmentTeacher3TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdMyTaskAssessmentTeacher3TableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdMyTaskAssessmentTeacher3TableViewCellID"];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthMyTaskAssessmentTeacher3TableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthMyTaskAssessmentTeacher3TableViewCellID"];
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    


    if (section == 0) {
        return 1;
    }else if (section == 1) {
   
       return 1;

        
    }else if (section == 2) {
        return 1;
    }else if (section == 3) {
        return 1;
    }else{
        return 0;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 0;
    }else{
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 35)];
        vi.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];

        [tableView addSubview:vi];
        UIView *vibg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 10)];
        vibg.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];

        [vi addSubview:vibg];
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, SCR_W, 40)];

        lb.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"评论" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        lb.attributedText = attributedString;
        [vi addSubview:lb];
        return vi;
    }else{
        return nil;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstMyTaskAssessmentTeacher3TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyTaskAssessmentTeacher3TableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];
            cell.schoolLabel.text = self.className;
            cell.userNameLabel.text = self.realName;

        }
        return cell;
    }else if (indexPath.section == 1) {
   
        SecondMyTaskAssessmentTeacher3TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyTaskAssessmentTeacher3TableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];

        }
        return cell;


        
//        ThirdMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyCircleCenterDetails1TableViewCellID"];
//        return cell;
    }else{
        if (self.model != nil) {
            if ([self.model.cover containsString:@","]) {
                FourthMyTaskAssessmentTeacher3TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FourthMyTaskAssessmentTeacher3TableViewCellID"];
                cell.delegate = self;
                [cell reloadData:self.model];
                return cell;
            }else{
                ThirdMyTaskAssessmentTeacher3TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyTaskAssessmentTeacher3TableViewCellID"];
                if (self.model != nil) {
                    [cell reloadData:self.model];
                }
                cell.delegate = self;
                return cell;
            }
        }else{
            ThirdMyTaskAssessmentTeacher3TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyTaskAssessmentTeacher3TableViewCellID"];
            if (self.model != nil) {
                [cell reloadData:self.model];
            }
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
/**发布*/
- (IBAction)showCommentViewBtnAction:(UIButton*)sender {
    //    AVUser *currentUser =[AVUser currentUser];
    //    if (!currentUser)
    //    {
    //        //登录
    //        RRBaseNavigationController *navi = [[UIStoryboard storyboardWithName:StoryBoard_Login bundle:nil] instantiateInitialViewController];
    //        [self presentViewController:navi animated:YES completion:nil];
    //
    //        return;
    //    }
//    [self showTextView];
    

}

//MARK: - Utility - 多用途(功能)方法
- (void)ThirdMyTaskAssessmentTeacher3TableViewCellActiondelegate:(ThirdMyTaskAssessmentTeacher3TableViewCell*)cell{
    [self showbigImage:0];
}
/**预览图片*/
- (void)FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:(FourthMyTaskAssessmentTeacher3TableViewCell*)cell location:(NSInteger)loc{
    [self showbigImage:loc];
}
- (void)showbigImage:(NSInteger)mysel{
    NSMutableArray *dataSource = [NSMutableArray array];
    NSMutableArray *GKPhotodataSource = [NSMutableArray array];

    if ([self.model.cover containsString:@","]) {
        NSArray *ary = [self.model.cover componentsSeparatedByString:@","];
        dataSource = [NSMutableArray arrayWithArray:ary];
        
    }else{
        [dataSource addObject:self.model.cover];
    }
    for (int i = 0; i<dataSource.count; i++) {
        [GKPhotodataSource addObject:[NSString stringWithFormat:@"%@%@",VideoHost,dataSource[i]]];
    }
    NSMutableArray *photos = [NSMutableArray new];
    [GKPhotodataSource enumerateObjectsUsingBlock:^(id  _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
       GKPhoto *photo = [GKPhoto new];
       photo.url = [NSURL URLWithString:obj];

       [photos addObject:photo];
    }];
    GKPhotoBrowser *browser = [GKPhotoBrowser photoBrowserWithPhotos:photos currentIndex:mysel];
    browser.showStyle = GKPhotoBrowserShowStyleNone;
    [browser showFromVC:self];

}

//MARK: - Network request - 网络请求
/**教师端查看学生提交的活动详情*/
- (void)requestexperiencebyuserid{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"activityId"] = self.activityId;
    para[@"userId"] = self.userId;
    [PersonalCenterRequestDatas experiencebyuseridrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.model = result;
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
