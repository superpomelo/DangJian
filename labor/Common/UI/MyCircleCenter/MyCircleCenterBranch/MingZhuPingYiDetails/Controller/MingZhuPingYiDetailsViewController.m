//
//  MingZhuPingYiDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MingZhuPingYiDetailsViewController.h"
#import "ThirdthMingZhuPingYiDetailsViewTableViewCell.h"
#import "SecondMingZhuPingYiDetailsViewTableViewCell.h"
#import "FirstMingZhuPingYiDetailsViewTableViewCell.h"
#import "DangYuanXiangQinDetailsViewController.h"
#import "MyCircleCenterRequestDatas.h"
#import "MingZhuPingYiDetailsModel.h"
#import "VotingQuestionVosModel.h"
#import "MyTimeInterval.h"

@interface MingZhuPingYiDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,ThirdthMingZhuPingYiDetailsViewTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property(nonatomic,strong)MingZhuPingYiDetailsModel *model;
@property(nonatomic,strong)NSArray *VotingQuestionVosarray;
@property (nonatomic,weak)NSTimer *toupiaotimer;
@property (nonatomic,assign )int TAG;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;

@end

@implementation MingZhuPingYiDetailsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initmyTableView];
    self.VotingQuestionVosarray = [NSArray array];
    self.fd_prefersNavigationBarHidden = YES;
}
- (void)viewWillAppear:(BOOL)animated{
    [self requestactivityvotinggetVotingDetails];

}
//MARK: - Initalization - 初始化
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"评议详情" font:18 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
}
/**定时器*/
- (void)resignAddTimer{
    self.toupiaotimer = [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(resigntimerAction:) userInfo:nil repeats:YES];
    

    [self.toupiaotimer fire]; //开启
}
/**定时器任务*/
- (void)resigntimerAction:(NSTimer*)timer{
    
    self.TAG = self.TAG-1;
    SecondMingZhuPingYiDetailsViewTableViewCell *cell  = [self.myTableView   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    cell.tianMLabel.text = [NSString stringWithFormat:@"%d",self.TAG/86400];
    cell.shiMLabel.text = [NSString stringWithFormat:@"%d",(self.TAG%86400)/3600];
    cell.fenMLabel.text = [NSString stringWithFormat:@"%d",(self.TAG%3600)/60];
    if (self.TAG == 0) {
        [self stopresigntimer];
        
//        self.TAG = 60;

        

    }
    
}

//停止定时器
- (void)stopresigntimer{
    if (_toupiaotimer != nil) {
        [_toupiaotimer invalidate]; //销毁定时器
        _toupiaotimer = nil;
    }
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdthMingZhuPingYiDetailsViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdthMingZhuPingYiDetailsViewTableViewCellID"];
   [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMingZhuPingYiDetailsViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMingZhuPingYiDetailsViewTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMingZhuPingYiDetailsViewTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMingZhuPingYiDetailsViewTableViewCellID"];
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
        if (self.VotingQuestionVosarray.count%2 == 0) {
            return (225)*self.VotingQuestionVosarray.count/2 +(self.VotingQuestionVosarray.count/2*10);
        }else{
            return (225)*(self.VotingQuestionVosarray.count+1)/2 +((self.VotingQuestionVosarray.count+1)/2*10);
        }
//        return 550;
    }else
    return UITableViewAutomaticDimension;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}

-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
 
    if (section == 2) {
        return 45;
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

        //线
//        UIView *linevibg = [[UIView alloc]initWithFrame:CGRectMake(0, 44.5, SCR_W, 0.5)];
//        linevibg.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];
//
//        [vi addSubview:linevibg];
        
        UILabel *lbR = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 4, 16)];
        lbR.backgroundColor = [UIColor colorWithRed:196/255.0 green:48/255.0 blue:48/255.0 alpha:1.0];
        [vi addSubview:lbR];

        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(25, 10, SCR_W, 35)];
//        lb.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
        NSMutableAttributedString *attributedString1 = [[NSMutableAttributedString alloc] initWithString:@"优秀党员评选" attributes:@{NSFontAttributeName: [UIFont fontWithName:@"SourceHanSerifCN-Bold" size: 16],NSForegroundColorAttributeName:[UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1]}];
        NSAttributedString *abt1 = attributedString1;
        
//        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:@"优秀党员评选" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        lb.attributedText = abt1;
        [vi addSubview:lb];
        return vi;
    }else{
        return nil;
    }

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
            if (self.VotingQuestionVosarray.count>0) {
                return 1;
            }else{
                return 0;

            }
                break;
       
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstMingZhuPingYiDetailsViewTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMingZhuPingYiDetailsViewTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];
        }
         return cell;
    }else if (indexPath.section == 1) {
        SecondMingZhuPingYiDetailsViewTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMingZhuPingYiDetailsViewTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];
        }
         return cell;
    }else{
        ThirdthMingZhuPingYiDetailsViewTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdthMingZhuPingYiDetailsViewTableViewCellID"];
        if (self.VotingQuestionVosarray.count>0) {
            cell.dataArray = self.VotingQuestionVosarray;
            cell.delegate = self;

            [cell.myCollectionView reloadData];

        }
        
         return cell;
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
/**党员详情*/
- (void)ThirdthMingZhuPingYiDetailsViewTableViewCellCollectionViewActiondelegate:(ThirdthMingZhuPingYiDetailsViewTableViewCell*)cell index:(NSIndexPath*)indexPath{
    DangYuanXiangQinDetailsViewController *DYvc = [[DangYuanXiangQinDetailsViewController alloc]init];
    DYvc.votingId = self.votingId;
    VotingQuestionVosModel *modelv = self.VotingQuestionVosarray[indexPath.row];
    DYvc.model = modelv;
    [self.navigationController pushViewController:DYvc animated:YES];
}

/**民主评议详情*/
- (void)requestactivityvotinggetVotingDetails{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

     para[@"votingId"] = self.votingId;

    [MyCircleCenterRequestDatas activityvotinggetVotingDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.model = result;
        self.VotingQuestionVosarray =  [VotingQuestionVosModel mj_objectArrayWithKeyValuesArray:self.model.votingQuestionVos]; //数组
        self.TAG =  [[MyTimeInterval getTimestampFromTime:self.model.endTime]  intValue] - [[MyTimeInterval getNowDateSJC] intValue];
        [self resignAddTimer];
        [self.myTableView reloadData];
        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
//        [self.myTableView.mj_header endRefreshing];
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
