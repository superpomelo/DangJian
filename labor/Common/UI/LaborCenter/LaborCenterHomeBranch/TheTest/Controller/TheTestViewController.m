//
//  TheTestViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "TheTestViewController.h"
#import "FirstTheTestTableViewCell.h"
#import "SecondTheTestTableViewCell.h"
#import "ThirdTheTestTableViewCell.h"
#import "ExaminationResultsViewController.h"
#import "LaborCenterRequestDatas.h"
#import "TheTestModel.h"
#import "JsonString.h"
#import "MyTimeInterval.h"
#import "ChooseQuestionView.h"
#import "TheTestTipsView.h"

@interface TheTestViewController ()<UITableViewDelegate,UITableViewDataSource,ChooseQuestionViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (weak, nonatomic) IBOutlet UIView *NextButtonBottomView;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;

@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSArray *optionsContentArray;
/**当前题号*/
@property (nonatomic,assign)int questionNumber;

/**当前选择的答案*/
@property (nonatomic,strong)NSString *selStr;
/**提交试卷时的questionsDtoList数组*/
@property (nonatomic,strong)NSMutableArray *questionsDtoListArrayM;
/**开始答题时间*/
@property (nonatomic,strong)NSString *startTime;
/**结束答题时间*/
@property (nonatomic,strong)NSMutableArray *submitTime;
/**选择题号view*/
@property (nonatomic,strong)ChooseQuestionView *mychooseQuestionView;
/**查看提示view*/
@property (nonatomic,strong)TheTestTipsView *thetesttipView;
@end

@implementation TheTestViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view from its nib.
    self.questionsDtoListArrayM = [NSMutableArray array];
    self.mychooseQuestionView.hidden = YES;
    self.thetesttipView.hidden = YES;
    self.questionNumber = 0;
    self.selStr = @" ";
    self.dataArray = [NSArray array];
    self.optionsContentArray = [NSArray array];
    [self initUI];
    [self initmyTableView];
    [self requestmobileEvaluationgetExamDetails];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
/**选择题号view*/
- (ChooseQuestionView *)mychooseQuestionView{
    if (!_mychooseQuestionView) {
        _mychooseQuestionView = [[NSBundle mainBundle] loadNibNamed:@"ChooseQuestionView" owner:self options:nil][0];
        _mychooseQuestionView.frame = self.view.bounds;
        _mychooseQuestionView.delegate = self;
////        [_carImmediatelyView settingUI];
        [self.view addSubview:_mychooseQuestionView];
    }
    return _mychooseQuestionView;
}

/**查看提示view*/
- (TheTestTipsView *)thetesttipView{
    if (!_thetesttipView) {
        _thetesttipView = [[NSBundle mainBundle] loadNibNamed:@"TheTestTipsView" owner:self options:nil][0];
        _thetesttipView.frame = self.view.bounds;
//        _thetesttipView.delegate = self;
////        [_carImmediatelyView settingUI];
        [self.view addSubview:_thetesttipView];
    }
    return _thetesttipView;
}
- (void)initquestionsDtoListArrayM{
    for (int i=0; i<self.dataArray.count; i++) {
         //存入空答案
        TheTestModel  *TTmodel  = self.dataArray[i];
        NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
        dictM[@"id"] = [NSString stringWithFormat:@"%d",TTmodel.idx];
        dictM[@"userAnswer"] = @" ";
        [self.questionsDtoListArrayM addObject:dictM];
    }

}

- (void)initUI{
    //未获取到试卷数据，不能进行上一题下一次等操作
    self.NextButtonBottomView.userInteractionEnabled = NO;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstTheTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTheTestTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondTheTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondTheTestTableViewCellID"];
        [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdTheTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdTheTestTableViewCellID"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    TheTestModel *TTmodel;
    if (self.dataArray.count>0) {
        TTmodel  = self.dataArray[self.questionNumber];
        
        self.optionsContentArray = [JsonString arrayWithJsonString:TTmodel.optionsContent] ;
        
    }

    switch (section) {
        case 0:
            return 1;
            break;

        case 1:

            return self.optionsContentArray.count;
                break;
        case 2:
                    return 1;
                    break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstTheTestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstTheTestTableViewCellID"];
        if (self.dataArray.count>0) {
         
            [cell reloadData:self.dataArray[self.questionNumber] num:[NSString stringWithFormat:@"%d",self.questionNumber+1] total:[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count] ];
        }
         return cell;
    }else if(indexPath.section == 1){
        SecondTheTestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondTheTestTableViewCellID"];
        TheTestModel *TTmodel;
        if (self.dataArray.count>0) {
            TTmodel  = self.dataArray[self.questionNumber];
            self.optionsContentArray = [JsonString arrayWithJsonString:TTmodel.optionsContent];
            [cell reloadData:self.optionsContentArray[indexPath.row]];
        }
        if (TTmodel.typeId == 0) {
            //单选题
            if ([self.selStr isEqualToString:@" "]) {
                cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
            }else{
                
                NSDictionary *dict = self.optionsContentArray[indexPath.row];
                if ([self.selStr isEqualToString:[NSString stringWithFormat:@"%@",dict.allValues[0]]] ) {
                    cell.bottomView.backgroundColor = [UIColor colorWithRed:218/255.0 green:246/255.0 blue:230/255.0 alpha:1];
                }else{
                   cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                }
            }
        }else if (TTmodel.typeId == 1){
            //多选题
            NSString *userAnswerStr = self.questionsDtoListArrayM[self.questionNumber][@"userAnswer"];
             
            if ([userAnswerStr isEqualToString:@" "]) {
                cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
            }else{
                if ([userAnswerStr containsString:@","]) {
                    //多选答案用,拼接
                   
                    NSArray *userAnswerArray = [userAnswerStr componentsSeparatedByString:@","];
                    NSDictionary *dict = self.optionsContentArray[indexPath.row];

                    for (int i = 0; i<userAnswerArray.count; ++i) {

                            if ([userAnswerArray[i] isEqualToString:dict.allValues[0]]) {
                                cell.bottomView.backgroundColor = [UIColor colorWithRed:218/255.0 green:246/255.0 blue:230/255.0 alpha:1];
                                break;
                            }else{
                               cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                            }
                        


                    }


                }else{
                    //只有1个答案无,号
                    NSDictionary *dict = self.optionsContentArray[indexPath.row];
                    if ([userAnswerStr isEqualToString:dict.allValues[0]]) {
                        cell.bottomView.backgroundColor = [UIColor colorWithRed:218/255.0 green:246/255.0 blue:230/255.0 alpha:1];
                    }else{
                       cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                    }

                }

            }

        }


         return cell;
    }else{
        ThirdTheTestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdTheTestTableViewCellID"];
        
         return cell;
    }

    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 1) {
            TheTestModel *TTmodel;
        if (self.dataArray.count>0) {
            TTmodel  = self.dataArray[self.questionNumber];
            self.optionsContentArray = [JsonString arrayWithJsonString:TTmodel.optionsContent];

            NSDictionary *dict = [NSDictionary dictionary];
            dict = self.optionsContentArray[indexPath.row];
            self.selStr =   [NSString stringWithFormat:@"%@",dict.allValues[0]];
            
            if ([self.selStr isEqualToString:@" "]) {
                        //没选择答案
            }else{
              //存入答案
             TheTestModel  *TTmodel  = self.dataArray[self.questionNumber];
            if (TTmodel.typeId == 0) {
              //单选题
                NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
                dictM[@"id"] = [NSString stringWithFormat:@"%d",TTmodel.idx];
                dictM[@"userAnswer"] = self.selStr;

                [self.questionsDtoListArrayM replaceObjectAtIndex:self.questionNumber withObject:dictM];
            }else if (TTmodel.typeId == 1){
               //多选题

                NSMutableDictionary *dictM = [NSMutableDictionary dictionary];
               
                if ([self.questionsDtoListArrayM[self.questionNumber][@"userAnswer"] isEqualToString:@" "]) {
                    //选第一个答案
                   dictM[@"id"] = [NSString stringWithFormat:@"%d",TTmodel.idx];
                   dictM[@"userAnswer"] = self.selStr;
                  [self.questionsDtoListArrayM replaceObjectAtIndex:self.questionNumber withObject:dictM];
                }else{
                    //选第2-n个答案
                    NSString *userAnswerStr = self.questionsDtoListArrayM[self.questionNumber][@"userAnswer"];
                    NSArray *userAnswerArray = [userAnswerStr componentsSeparatedByString:@","];
                    NSMutableArray *userAnswerArrayM = [NSMutableArray array];
                    userAnswerArrayM = [NSMutableArray arrayWithArray:userAnswerArray];
                    for (int i = 0; i<userAnswerArray.count; i++) {
                        if ([self.selStr isEqualToString:userAnswerArray[i]]) {
                            //说明答案已经有了，则移除该答案达到取消选中的效果
                            [userAnswerArrayM removeObjectAtIndex:i];
                            NSMutableString *strM = [NSMutableString string];
                            for (int k=0; k<userAnswerArrayM.count; k++) {
                                if (k==0) {
                                    [strM appendString:userAnswerArrayM[k]];

                                }else{
                                   [strM appendString:@","];
                                    [strM appendString:userAnswerArrayM[k]];
                                }
                            }
                            

                            dictM[@"id"] = [NSString stringWithFormat:@"%d",TTmodel.idx];
                            dictM[@"userAnswer"] = strM;
                            [self.questionsDtoListArrayM replaceObjectAtIndex:self.questionNumber withObject:dictM];
                           [self.myTableView reloadData];

                            return;
                        }
                    }
 
                    NSMutableString *strM = [[NSMutableString alloc]initWithString:userAnswerStr];
                    [strM appendString:@","];
                    [strM appendString:self.selStr];
                    dictM[@"id"] = [NSString stringWithFormat:@"%d",TTmodel.idx];
                    dictM[@"userAnswer"] = strM;
                    [self.questionsDtoListArrayM replaceObjectAtIndex:self.questionNumber withObject:dictM];
                }
                
            }

                      }
            [self.myTableView reloadData];

        }
    }else if (indexPath.section == 2) {
        TheTestModel  *TTmodel  = self.dataArray[self.questionNumber];

        self.thetesttipView.hidden = NO;
        [self.thetesttipView reloadData:TTmodel.analysis];
    }

    
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件

/**选择题目*/
- (void)ChooseQuestionViewmyCollectionViewActiondelegate:(ChooseQuestionView*)cell index:(NSIndexPath*)indexPath{
    if (indexPath.row == self.dataArray.count-1){
        NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"提交试卷" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
        [self.mychooseQuestionView.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
        [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
    }else{
        NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"下一题" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
        [self.mychooseQuestionView.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
        [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
    }
    
    self.questionNumber = indexPath.row;
    self.selStr = self.questionsDtoListArrayM[self.questionNumber][@"userAnswer"];
    
    [self.myTableView reloadData];
    [UIView animateWithDuration:1.0f animations:^{
        self.mychooseQuestionView.hidden = YES;
    }];
    NSLog(@"%ld",(long)indexPath.row);
}

/**选择题目的上一题，下一题*/
- (void)ChooseQuestionViewbuttonActiondelegate:(ChooseQuestionView*)view button:(UIButton*)sender{
        [UIView animateWithDuration:1.0f animations:^{
        self.mychooseQuestionView.hidden = YES;
    }];
    if ([sender.currentTitle isEqualToString:@"上一题"]) {

        [self lastButtonAction:sender];
        if (self.questionNumber == self.dataArray.count-1){
            NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"提交试卷" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
            [view.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
        }else{
            NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"下一题" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
            [view.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
        }
    }else{

        //下一题
        [self nextButtonAction:sender];
        if (self.questionNumber == self.dataArray.count-1){
            NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"提交试卷" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
            [view.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
        }else{
            NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"下一题" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
            [view.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
        }
    }
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
//    [self requestmobileEvaluationsubmitExam];
}
/**选择试题界面*/
- (IBAction)chooseQuestionButtonAction:(id)sender {
    [UIView animateWithDuration:1.0f animations:^{
        self.mychooseQuestionView.questionNumber = self.questionNumber;
        self.mychooseQuestionView.questionsDtoListArrayM = self.questionsDtoListArrayM;
        self.mychooseQuestionView.dataArray = self.dataArray;
        self.mychooseQuestionView.hidden = NO;
        [self.mychooseQuestionView.myCollectionView reloadData];
    }];
    
}

/**上一题*/
- (IBAction)lastButtonAction:(UIButton*)sender {
    if (self.dataArray.count>0) {
        if (self.questionNumber == 0) {
          if (self.questionNumber == self.dataArray.count-1){
              [self.nextButton setTitle:@"提交试卷" forState:UIControlStateNormal];
          }else{
              [self.nextButton setTitle:@"下一题" forState:UIControlStateNormal];
          }
        }else{
            
            self.questionNumber = self.questionNumber-1;
            self.selStr = self.questionsDtoListArrayM[self.questionNumber][@"userAnswer"];
            
            [self.myTableView reloadData];
            
            if (self.questionNumber == self.dataArray.count-1){
                NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"提交试卷" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
                [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
                [self.mychooseQuestionView.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            }else{
                NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"下一题" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
                [self.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
                [self.mychooseQuestionView.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            }
        }
    }

}
/**下一题/提交试卷*/
- (IBAction)nextButtonAction:(UIButton*)sender {
    if (self.dataArray.count>0) {
        if (self.questionNumber == self.dataArray.count-1) {
            sender.userInteractionEnabled = NO;
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                sender.userInteractionEnabled = YES;
            });
            [self requestmobileEvaluationsubmitExam];
            

        }else{


            self.questionNumber = self.questionNumber+1;
            self.selStr = self.questionsDtoListArrayM[self.questionNumber][@"userAnswer"];

            [self.myTableView reloadData];
            if (self.questionNumber == self.dataArray.count-1){
                NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"提交试卷" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
                [sender setAttributedTitle:atb forState:UIControlStateNormal];
                [self.mychooseQuestionView.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            }else{
                NSMutableAttributedString *atb = [[NSMutableAttributedString alloc]initWithString:@"下一题" attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor whiteColor]}];
                [sender setAttributedTitle:atb forState:UIControlStateNormal];
                [self.mychooseQuestionView.nextButton setAttributedTitle:atb forState:UIControlStateNormal];
            }
        }
    }


}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**在线考试*/
- (void)requestmobileEvaluationgetExamDetails{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //考试id
    para[@"examId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    //试卷id
    para[@"examPaperId"] = [NSString stringWithFormat:@"%d",self.model.examPaperId];
    para[@"startTime"] = [MyTimeInterval IntervalStringToDateString:[MyTimeInterval getNowDateSJC]];
    self.startTime = [MyTimeInterval getNowDateSJC];
    [LaborCenterRequestDatas mobileEvaluationgetExamDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
        NSArray *resultarray =  [TheTestModel mj_objectArrayWithKeyValuesArray:result[@"data"][@"questionVoList"]]; //数组
        self.dataArray = [NSArray array];
        self.dataArray = resultarray;
        [self.myTableView reloadData];
        [self initquestionsDtoListArrayM];
        //获取到试卷数据，可以上一题下一题
        self.NextButtonBottomView.userInteractionEnabled = YES;
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**提交试卷*/
- (void)requestmobileEvaluationsubmitExam{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
   
    
    //考试id
    para[@"id"] = [NSString stringWithFormat:@"%d",self.model.idx];
    //试卷id
    para[@"examPaperId"] = [NSString stringWithFormat:@"%d",self.model.examPaperId];
    para[@"submitTime"] = [MyTimeInterval IntervalStringToDateString:[MyTimeInterval getNowDateSJC]];
    
    /**考试时长*/
    int consumptionTime = [[MyTimeInterval getNowDateSJC] intValue] - [self.startTime intValue] ;
    para[@"consumptionTime"] = [NSString stringWithFormat:@"%d",consumptionTime/60] ;
    

    para[@"questionsDtoList"] = self.questionsDtoListArrayM;
    [LaborCenterRequestDatas mobileEvaluationsubmitExamrequestDataWithparameters:para success:^(id  _Nonnull result) {
            ExaminationResultsViewController *ERvc = [[ExaminationResultsViewController alloc]init];
        ERvc.model = self.model;
        ERvc.from = ExaminationResultsHome;
        [self.navigationController pushViewController:ERvc animated:YES];
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
