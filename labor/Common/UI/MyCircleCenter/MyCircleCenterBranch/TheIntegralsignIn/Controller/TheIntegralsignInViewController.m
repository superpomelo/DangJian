//
//  TheIntegralsignInViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "TheIntegralsignInViewController.h"
#import "FirstTheIntegralsignInTableViewCell.h"
#import "SecondTheIntegralsignInTableViewCell.h"
#import "ThirdTheIntegralsignInTableViewCell.h"
#import "FourthTheIntegralsignInTableViewCell.h"
#import "MyCircleCenterRequestDatas.h"
#import "PersonalCenterRequestDatas.h"

@interface TheIntegralsignInViewController ()<UITableViewDelegate,UITableViewDataSource,SecondTheIntegralsignInTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
/**签到状态*/
@property (nonatomic,assign)NSInteger status;
/**连续签到天数*/
@property (nonatomic,assign)NSInteger lianxu;
/**总积分*/
@property(nonatomic,assign)NSInteger score;


@end

@implementation TheIntegralsignInViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.status = 1;
    self.lianxu = 0;
    self.score = 0;
    [self initUI];
    [self initmyTableView];
    [self requestsyssigngetsignin];
    [self requestsyssignsignstatus];
    [self requestsysintegralgetSysIntegral];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstTheIntegralsignInTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTheIntegralsignInTableViewCellID"];
   [self.myTableView registerNib:[UINib nibWithNibName:@"SecondTheIntegralsignInTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondTheIntegralsignInTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdTheIntegralsignInTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdTheIntegralsignInTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthTheIntegralsignInTableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthTheIntegralsignInTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 65;
            break;
        case 1:
                return ((SCR_W-30)*171)/SCR_W;
                break;
        case 2:
                return 45;
                break;
        case 3:
                return 85;
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
                return 3;
                break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstTheIntegralsignInTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstTheIntegralsignInTableViewCellID"];
        if (self.status == 1) {
            cell.imageView1.hidden = NO;
        }else{
            cell.imageView1.hidden = YES;
        }
         return cell;
    }else if (indexPath.section == 1) {
        SecondTheIntegralsignInTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondTheIntegralsignInTableViewCellID"];
        cell.totalLabel.text = [NSString stringWithFormat:@"%ld",self.score];
        cell.delegate = self;
        cell.daysLabel.text = [NSString stringWithFormat:@"已连续签到%ld天",self.lianxu];
        if (self.status == 1) {
            cell.qianDaoButton.userInteractionEnabled = NO;
            [cell.qianDaoButton setTitle:@"已签到" forState:UIControlStateNormal];
            cell.qianDaoButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.3];
            [cell.qianDaoButton setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
        }else{
            cell.qianDaoButton.userInteractionEnabled = YES;

            [cell.qianDaoButton setTitle:@"签到" forState:UIControlStateNormal];
            cell.qianDaoButton.backgroundColor = [UIColor colorWithRed:255/255.0 green:223/255.0 blue:76/255.0 alpha:0.3];
            [cell.qianDaoButton setTitleColor:[UIColor colorWithRed:42/255.0 green:15/255.0 blue:5/255.0 alpha:1] forState:UIControlStateNormal];
        }
         return cell;
    }else if (indexPath.section == 2) {
        ThirdTheIntegralsignInTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdTheIntegralsignInTableViewCellID"];
         return cell;
    }else{
        FourthTheIntegralsignInTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FourthTheIntegralsignInTableViewCellID"];
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
/**点击签到*/
- (void)SecondTheIntegralsignInTableViewCellButtonActiondelegate:(SecondTheIntegralsignInTableViewCell*)cell{
    [self requestsyssignaddsign];
}
//MARK: - Network request - 网络请求
/**点击签到*/
- (void)requestsyssignaddsign{
    [MyCircleCenterRequestDatas  syssignaddsignrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**签到状态*/
- (void)requestsyssignsignstatus{
    [MyCircleCenterRequestDatas syssignsignstatusrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        if ([result[@"data"] boolValue] == YES) {
            self.status = 1;
        }else{
            self.status = 0;
        }
        
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**查询连续登签到天数*/
- (void)requestsyssigngetsignin{
    [MyCircleCenterRequestDatas syssigngetsigninrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.lianxu = [result[@"data"] integerValue];
        [self.myTableView reloadData];

        } failure:^(NSError * _Nonnull error) {
            
        }];
}

/**查询积分对象<总积分>*/
- (void)requestsysintegralgetSysIntegral{
    [PersonalCenterRequestDatas sysintegralgetSysIntegralrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.score = [result[@"score"] integerValue];
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
