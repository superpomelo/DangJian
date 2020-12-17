//
//  GuanXiZhuanJie2ViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "GuanXiZhuanJie2ViewController.h"
#import "FirstGuanXiZhuanJie2TableViewCell.h"
#import "SecondGuanXiZhuanJie2TableViewCell.h"
#import "ThirdGuanXiZhuanJie2TableViewCell.h"
#import "ZeroTop150JieGuoTableViewCell.h"
#import "GuanXiZhuanJie2OKView.h"
#import "PersonalCenterRequestDatas.h"

@interface GuanXiZhuanJie2ViewController ()<UITableViewDelegate,UITableViewDataSource,ThirdGuanXiZhuanJie2TableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic,strong)GuanXiZhuanJie2OKView *zhuanjieOiew;
@property (nonatomic,strong)NSString *titless;

@end

@implementation GuanXiZhuanJie2ViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.submitButton.layer.cornerRadius = 4;
    self.dataArray = [NSArray array];
    self.dataArray = @[@""];
    [self initUI];
    [self initmyTableView];
//    [self requestmobileEvaluationgetExamVoPage];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
-(GuanXiZhuanJie2OKView *)zhuanjieOiew{
    if (!_zhuanjieOiew) {
        _zhuanjieOiew = [[NSBundle mainBundle] loadNibNamed:@"GuanXiZhuanJie2OKView" owner:self options:nil][0];
        _zhuanjieOiew.frame = self.view.bounds;
        _zhuanjieOiew.whiteBottomView.layer.cornerRadius = 8;
//        _baomingOiew.delegate = self;
////        [_carImmediatelyView settingUI];
        [self.view addSubview:_zhuanjieOiew];
    }
    return _zhuanjieOiew;
}
- (void)initUI{
    self.zhuanjieOiew.hidden = YES;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
//    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstGuanXiZhuanJie2TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstGuanXiZhuanJie2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondGuanXiZhuanJie2TableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondGuanXiZhuanJie2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdGuanXiZhuanJie2TableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdGuanXiZhuanJie2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeroTop150JieGuoTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
//    self.myTableView.mj_header = [MJRefreshNormalHeader headerWithRefreshingBlock:^{
//        [self requestmobileEvaluationgetExamVoPage];
//    }];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        return SCR_H;

    }else{
        if (indexPath.section==0) {
            return 60;
        }else if (indexPath.section==1) {
            return 550;
        }{
            return 50;


        }
    }


}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    if (self.dataArray.count == 0) {
        return 1;

    }else{
        return 2;

    }
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
        return 1;
    
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (self.dataArray.count == 0) {
        ZeroTop150JieGuoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeroTop150JieGuoTableViewCellID"];
        return cell;

    }else{
        if (indexPath.section == 0) {
            FirstGuanXiZhuanJie2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstGuanXiZhuanJie2TableViewCellID"];
            cell.leftLabel.text = [NSString stringWithFormat:@"转入党组织:%@",self.model.name];
    //        [cell reloadData:self.dataArray[indexPath.row]];
            return cell;
        }else{
            ThirdGuanXiZhuanJie2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdGuanXiZhuanJie2TableViewCellID"];
            cell.delegate = self;
    //        [cell reloadData:self.dataArray[indexPath.row]];
            return cell;
        }

        

    }


}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
   

}
//MARK: - SubViews - 子视图
/**文本框代理*/
- (void)ThirdGuanXiZhuanJie2TableViewCellActiondelegate:(ThirdGuanXiZhuanJie2TableViewCell*)cell textview:(UITextView*)textView{
    self.titless = textView.text;
}
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}

- (IBAction)subMitButtonAction:(id)sender {
    [self requestadminsysuserchangesaddSysUserChangesPhone];
}

//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**关系转接申请*/
- (void)requestadminsysuserchangesaddSysUserChangesPhone{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"newsDeptId"] = [NSString stringWithFormat:@"%d",self.model.deptId];
    para[@"reason"] = self.titless;
    [PersonalCenterRequestDatas adminsysuserchangesaddSysUserChangesPhonerequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.zhuanjieOiew.hidden = NO;

        
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
