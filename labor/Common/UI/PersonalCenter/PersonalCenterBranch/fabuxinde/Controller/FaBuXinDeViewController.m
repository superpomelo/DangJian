//
//  FaBuXinDeViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FaBuXinDeViewController.h"
#import "FirstFaBuXinDeTableViewCell.h"
#import "SecondFaBuXinDeTableViewCell.h"
#import "ThirdFaBuXinDeTableViewCell.h"
#import "FourthFaBuXinDeTableViewCell.h"
#import "ZeroTop150JieGuoTableViewCell.h"
#import "PersonalCenterRequestDatas.h"

@interface FaBuXinDeViewController ()<UITableViewDelegate,UITableViewDataSource,FirstFaBuXinDeTableViewCellDelegate,SecondFaBuXinDeTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSString *titless;
@property (nonatomic,strong)NSString *body;


@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation FaBuXinDeViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"发布心得" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.submitButton.layer.cornerRadius = 4;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
//    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstFaBuXinDeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstFaBuXinDeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondFaBuXinDeTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondFaBuXinDeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdFaBuXinDeTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdFaBuXinDeTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthFaBuXinDeTableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthFaBuXinDeTableViewCellID"];
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
            return 100;
        }
        return 550;

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
        if (indexPath.section==0) {
            FirstFaBuXinDeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstFaBuXinDeTableViewCellID"];
            cell.delegate = self;
    //        [cell reloadData:self.dataArray[indexPath.row]];
            return cell;
        }else if (indexPath.section==1){
            SecondFaBuXinDeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondFaBuXinDeTableViewCellID"];
            cell.delegate = self;
    //        [cell reloadData:self.dataArray[indexPath.row]];
            return cell;
        }else if (indexPath.section==2){
            ThirdFaBuXinDeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdFaBuXinDeTableViewCellID"];
    //        [cell reloadData:self.dataArray[indexPath.row]];
            return cell;
        }else{
            FourthFaBuXinDeTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FourthFaBuXinDeTableViewCellID"];
    //        [cell reloadData:self.dataArray[indexPath.row]];
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

- (IBAction)submitButtonAction:(id)sender {
    [self requestactivityexperienceaddexp];
}

//MARK: - Utility - 多用途(功能)方法
/**文本框代理title*/
- (void)FirstFaBuXinDeTableViewCellActiondelegate:(FirstFaBuXinDeTableViewCell*)cell textview:(UITextView*)textView{
    self.titless = textView.text;
}
/**文本框代理body*/
- (void)SecondFaBuXinDeTableViewCellActiondelegate:(SecondFaBuXinDeTableViewCell*)cell textview:(UITextView*)textView{
    self.body = textView.text;
}
//MARK: - Network request - 网络请求
/**发布*/
- (void)requestactivityexperienceaddexp{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"body"] = self.body;
    para[@"title"] = self.titless;
    [PersonalCenterRequestDatas activityexperienceaddexprequestDataWithparameters:para success:^(id  _Nonnull result) {
        [self.navigationController popViewControllerAnimated:YES];
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
