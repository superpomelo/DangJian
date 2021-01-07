//
//  MyClassViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyClassViewController.h"
#import "FirstMyClassTableViewCell.h"
#import "SecondMyClassTableViewCell.h"
#import "ThirdMyClassTableViewCell.h"
#import "PersonalCenterRequestDatas.h"
#import "PublishTaskClassModel.h"
#import "PublishTaskClassStudentModel.h"
#import "ShenQingShuViewController.h"
#import "RuDangShenQingModel.h"

@interface MyClassViewController ()<UITableViewDelegate,UITableViewDataSource,FirstMyClassTableViewCellDelegate,SecondMyClassTableViewCellDelegate,UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSMutableArray *dataArrayM;
@property (nonatomic,strong)NSMutableArray *studentdataArrayM;
@property (weak, nonatomic) IBOutlet UIView *topBottomView;
@property (nonatomic,assign)int step;
@property (nonatomic,strong)RuDangShenQingModel *model;
@property (nonatomic,strong)NSIndexPath *indexPathMM;
@property (nonatomic,strong)NSArray *titleArrayM1;
@property (nonatomic,strong)NSArray *titleArrayM2;
@property (nonatomic,strong)NSArray *titleArrayM3;
@property (nonatomic,strong)NSArray *titleArrayM4;
@property (nonatomic,strong)NSArray *titleArrayM5;

@property (nonatomic,strong)NSArray *titleArrayM11;
@property (nonatomic,strong)NSArray *titleArrayM22;
@property (nonatomic,strong)NSArray *titleArrayM33;
@property (nonatomic,strong)NSArray *titleArrayM44;
@property (nonatomic,strong)NSArray *titleArrayM55;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplayoutconstraint;
@property (weak, nonatomic) IBOutlet UIView *navBottomView;
@property (weak, nonatomic) IBOutlet UIView *nav2BottomView;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;

@end

@implementation MyClassViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.step = 0;
    self.indexPathMM = [NSIndexPath indexPathForRow:0 inSection:0];
    self.dataArrayM = [NSMutableArray arrayWithObjects:@"入党申请",@"入党积极分子",@"确认发展对象",@"接受预备党员",@"预备党员转正", nil];
    self.titleArrayM1 = @[@"递交入党申请书",@"组织派人谈话"];

    self.titleArrayM2 = @[@"推荐和确定入党积极分子",@"上级党委备案",@"指定培养联系人",@"培养教育考察"];
    self.titleArrayM3 = @[@"确定发展对象",@"上级党委备案",@"确定入党介绍人",@"政治审查",@"开展集中培训"];
    self.titleArrayM4 = @[@"支部委员会审查",@"上级党委预审",@"填写入党志愿书",@"支部大会讨论",@"上级党委派人谈话",@"上级党委派人审批",@"党委组织部门备案"];
    self.titleArrayM5 = @[@"编入党支部和党小组",@"入党宣誓",@"继续考察教育",@"提出转正申请",@"支部大会讨论",@"上级党委审批",@"材料归档"];
    
    self.titleArrayM11 = @[@"第1步",@"第2步"];

    self.titleArrayM22 = @[@"第3步",@"第4步",@"第5步",@"第6步"];
    self.titleArrayM33 = @[@"第7步",@"第8步",@"第9步",@"第10步",@"第11步"];
    self.titleArrayM44 = @[@"第12步",@"第13步",@"第14步",@"第15步",@"第16步",@"第17步",@"第18步"];
    self.titleArrayM55 = @[@"第19步",@"第20步",@"第21步",@"第22步",@"第23步",@"第24步",@"第25步"];

    self.studentdataArrayM = [NSMutableArray array];

    [self initUI];
    [self initmyTableView];
//    [self requestsysclassgetbytecuserid];
    [self requestCCadminsysjoinuscheckmine];
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
}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"发展党员" font:16 color:[UIColor whiteColor] zitistyle:@"Source Han Serif CN"];
//    CAGradientLayer *glS = [CAGradientLayer layer];
//       glS.frame = CGRectMake(0,0,SCR_W,self.topBottomView.bounds.size.height);
//       glS.startPoint = CGPointMake(0, 0);
//       glS.endPoint = CGPointMake(0, 1);
//       glS.colors = @[(__bridge id)[UIColor colorWithRed:255/255.0 green:110/255.0 blue:87/255.0 alpha:1.0].CGColor,(__bridge id)[UIColor colorWithRed:251/255.0 green:61/255.0 blue:61/255.0 alpha:1.0].CGColor];
//       glS.locations = @[@(0.0),@(1.0)];
//
//       [self.topBottomView.layer addSublayer:glS];
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyClassTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyClassTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdMyClassTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdMyClassTableViewCellID"];
    self.myTableView.tableFooterView = [[UIView alloc]initWithFrame:CGRectZero];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
//            return 115;
            if ([IsIphoneX isIphoneX]==NO) {
                return 229;

            }else{
                return 249;

            }
            break;
        case 1:
                return 135;
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
    if (section==0) {
        return 1;
    }else{
        if (self.indexPathMM.row==0) {
            return 2;
        }else if (self.indexPathMM.row==1){
            return 4;
        }else if (self.indexPathMM.row==2){
            return 5;
        }else if (self.indexPathMM.row==3){
            return 7;
        }else{
            return 7;
        }
//        if (self.step >0 && self.step < 3) {
//            return 2;
//        }else if (self.step > 2 && self.step < 7) {
//            return 4;
//        }else if (self.step > 6 && self.step < 12) {
//            return 5;
//        }else if (self.step > 11 && self.step < 19) {
//            return 7;
//        }else{
//            return 7;
//        }
    }

}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstMyClassTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyClassTableViewCellID"];
        cell.delegate = self;
        cell.array  = self.dataArrayM;
        cell.indexpathT = self.indexPathMM;
        [cell reloadData];
         return cell;

    }else{
        
//        if (indexPath.row ==0) {
            SecondMyClassTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyClassTableViewCellID"];
//        cell.stepLabel.text = [NSString stringWithFormat:@"第%ld步",indexPath.row+1];
        if (self.indexPathMM.row == 0) {
            if (self.step>2) {
                cell.tijiaoButton.hidden = YES;
                cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
            }else{
                if (self.step==0) {
                    cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                    cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                    cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    if (indexPath.row==0) {
                        cell.tijiaoButton.hidden = NO;

                    }else{
                        cell.tijiaoButton.hidden = YES;

                    }
                }else if (self.step==1) {
                    if (indexPath.row==0) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.tijiaoButton.hidden = YES;
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.tijiaoButton.hidden = YES;
                    }
                }else if (self.step==2) {
                    cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                    cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                    cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    cell.tijiaoButton.hidden = YES;
                }
            }
            
            cell.bodyLabel.text = self.titleArrayM1[indexPath.row];
            cell.stepLabel.text = self.titleArrayM11[indexPath.row];
//            if (indexPath.row==0) {
//                cell.tijiaoButton.hidden = NO;
//            }else{
//                cell.tijiaoButton.hidden = YES;
//
//            }
        }else if (self.indexPathMM.row == 1) {
            if (self.step>6) {
                cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
            }else{
                if (self.step<3) {
                    cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                    cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                    cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                }else if(self.step==3){
                    if (indexPath.row==0) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==4){
                    if (indexPath.row==0||indexPath.row==1) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==5){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==6){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }
            }
            cell.bodyLabel.text = self.titleArrayM2[indexPath.row];
            cell.stepLabel.text = self.titleArrayM22[indexPath.row];

            cell.tijiaoButton.hidden = YES;
        }else if (self.indexPathMM.row == 2) {
            if (self.step>11) {
                cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
            }else{
                if (self.step<7) {
                    cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                    cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                    cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                }else if(self.step==7){
                    if (indexPath.row==0) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==8){
                    if (indexPath.row==0||indexPath.row==1) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==9){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==10){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==11){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3||indexPath.row==4) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }
            }
            cell.stepLabel.text = self.titleArrayM33[indexPath.row];

            cell.bodyLabel.text = self.titleArrayM3[indexPath.row];
            cell.tijiaoButton.hidden = YES;
        }else if (self.indexPathMM.row == 3) {
            if (self.step>17) {
                cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
            }else{
                if (self.step<12) {
                    cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                    cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                    cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                }else if(self.step==12){
                    if (indexPath.row==0) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==13){
                    if (indexPath.row==0||indexPath.row==1) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==14){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==15){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==16){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3||indexPath.row==4) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==17){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3||indexPath.row==4||indexPath.row==5) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }
            }
            cell.bodyLabel.text = self.titleArrayM4[indexPath.row];
            cell.stepLabel.text = self.titleArrayM44[indexPath.row];

            cell.tijiaoButton.hidden = YES;
        }else if (self.indexPathMM.row == 4) {
            if (self.step>24) {
                cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
            }else{
                if (self.step<19) {
                    cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                    cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                    cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                }else if(self.step==19){
                    if (indexPath.row==0) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==20){
                    if (indexPath.row==0||indexPath.row==1) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        
                    }


                }else if(self.step==21){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==22){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==23){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3||indexPath.row==4) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }else if(self.step==24){
                    if (indexPath.row==0||indexPath.row==1||indexPath.row==2||indexPath.row==3||indexPath.row==4||indexPath.row==5) {
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 37"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 16 – 8"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
                    }else{
                        cell.dangqiImageView.image = [UIImage imageNamed:@"路径 377"];
                        cell.stepImageView.image = [UIImage imageNamed:@"组件 33 – 10"];
                        cell.bodyLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                        cell.stepLabel.textColor = [UIColor colorWithRed:184/255.0 green:184/255.0 blue:184/255.0 alpha:1];
                    }


                }
            }
            cell.bodyLabel.text = self.titleArrayM5[indexPath.row];
            cell.stepLabel.text = self.titleArrayM55[indexPath.row];

            cell.tijiaoButton.hidden = YES;
        }
            cell.delegate = self;
             return cell;
//        }else{
//
//            ThirdMyClassTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyClassTableViewCellID"];
////                [cell reloadData:self.studentdataArrayM[indexPath.row] xuhao:indexPath.row];
//                 return cell;
//        }

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

- (void)FirstMyClassTableViewCellCollectionViewActiondelegate:(FirstMyClassTableViewCell*)cell  CollectionViewindexPath:(NSIndexPath*)indexPath{
    self.indexPathMM = indexPath;
    [self.myTableView reloadData];
    NSLog(@"%ld",indexPath.row);
//    PublishTaskClassModel *model = self.dataArrayM[indexPath.row];
//    self.studentdataArrayM = [PublishTaskClassStudentModel mj_objectArrayWithKeyValuesArray:model.count];
//    [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
    
}
/**提交*/
- (void)SecondMyClassTableViewCellActiondelegate:(SecondMyClassTableViewCell*)cell{
    ShenQingShuViewController *SQvc = [[ShenQingShuViewController alloc]init];
    [self.navigationController pushViewController:SQvc animated:YES];
}
//MARK: - Network request - 网络请求
/**入党申请状态*/
- (void)requestCCadminsysjoinuscheckmine{
    [PersonalCenterRequestDatas CCadminsysjoinuscheckminerequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.model = result;
        NSArray *ary = [self.model.handler componentsSeparatedByString:@","];
        for (int i = 0; i<ary.count; i++) {
            if ([ary[i] isEqualToString:@"1"]) {
                self.step = self.step + 1;
            }
        }
                if (self.step >=0 && self.step < 3) {
                    self.indexPathMM = [NSIndexPath indexPathForRow:0 inSection:0];
                }else if (self.step > 2 && self.step < 7) {
                    self.indexPathMM = [NSIndexPath indexPathForRow:1 inSection:0];
                }else if (self.step > 6 && self.step < 12) {
                    self.indexPathMM = [NSIndexPath indexPathForRow:2 inSection:0];
                }else if (self.step > 11 && self.step < 19) {
                    self.indexPathMM = [NSIndexPath indexPathForRow:3 inSection:0];
                }else{
                    self.indexPathMM = [NSIndexPath indexPathForRow:4 inSection:0];
                }
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**教师端查询学生表*/
//- (void)requestsysclassgetbyclassid:(NSString*)classId{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"classId"] = classId;
//    [PersonalCenterRequestDatas sysclassgetbyclassidrequestDataWithparameters:para success:^(id  _Nonnull result) {
//
//    } failure:^(NSError * _Nonnull error) {
//
//    }];
//}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
