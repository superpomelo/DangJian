//
//  WrongTestDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/2.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  错题解析

#import "WrongTestDetailsViewController.h"
#import "FirstWrongTestTableViewCell.h"
#import "SecondWrongTestTableViewCell.h"
#import "ThirdthWrongTestTableViewCell.h"
#import "LaborCenterRequestDatas.h"
#import "WrongChooseQuestionView.h"
#import "TheTestModel.h"
#import "JsonString.h"
#import "MyTimeInterval.h"
#import "WrongTestDetailsView.h"

@interface WrongTestDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,WrongChooseQuestionViewDelegate>
@property (weak, nonatomic) IBOutlet UIView *NextButtonBottomView;

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic,strong)NSArray *dataArray;
@property (nonatomic,strong)NSArray *optionsContentArray;
/**当前题号*/
@property (nonatomic,assign)int questionNumber;
/**选择题号view*/
@property (nonatomic,strong)WrongChooseQuestionView *mychooseQuestionView;
/**查看提示view*/
@property (nonatomic,strong)WrongTestDetailsView *thetesttipView;
@end

@implementation WrongTestDetailsViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
//    self.questionsDtoListArrayM = [NSMutableArray array];
//    self.mychooseQuestionView.hidden = YES;
//    self.thetesttipView.hidden = YES;
    self.questionNumber = 0;
//    self.selStr = @" ";
    self.dataArray = [NSArray array];
    self.optionsContentArray = [NSArray array];
    self.mychooseQuestionView.hidden = YES;
    self.thetesttipView.hidden = YES;
    [self initUI];
    [self initmyTableView];
    [self requestmobileEvaluationgetmyexaminfo];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    //未获取到试卷数据，不能进行上一题下一次等操作
    self.NextButtonBottomView.userInteractionEnabled = NO;
}
/**选择题号view*/
- (WrongChooseQuestionView *)mychooseQuestionView{
    if (!_mychooseQuestionView) {
        _mychooseQuestionView = [[NSBundle mainBundle] loadNibNamed:@"WrongChooseQuestionView" owner:self options:nil][0];
        _mychooseQuestionView.frame = self.view.bounds;
        _mychooseQuestionView.delegate = self;
////        [_carImmediatelyView settingUI];
        [self.view addSubview:_mychooseQuestionView];
    }
    return _mychooseQuestionView;
}

/**查看提示view*/
- (WrongTestDetailsView *)thetesttipView{
    if (!_thetesttipView) {
        _thetesttipView = [[NSBundle mainBundle] loadNibNamed:@"WrongTestDetailsView" owner:self options:nil][0];
        _thetesttipView.frame = self.view.bounds;
//        _thetesttipView.delegate = self;
////        [_carImmediatelyView settingUI];
        [self.view addSubview:_thetesttipView];
    }
    return _thetesttipView;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstWrongTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstWrongTestTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondWrongTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondWrongTestTableViewCellID"];
        [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdthWrongTestTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdthWrongTestTableViewCellID"];
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
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
        FirstWrongTestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstWrongTestTableViewCellID"];
        if (self.dataArray.count>0) {
         
            [cell reloadData:self.dataArray[self.questionNumber] num:[NSString stringWithFormat:@"%d",self.questionNumber+1] total:[NSString stringWithFormat:@"%lu",(unsigned long)self.dataArray.count] ];
        }
         return cell;
    }else if(indexPath.section == 1){
        SecondWrongTestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondWrongTestTableViewCellID"];
        TheTestModel *TTmodel;
        if (self.dataArray.count>0) {
            TTmodel  = self.dataArray[self.questionNumber];
            self.optionsContentArray = [JsonString arrayWithJsonString:TTmodel.optionsContent];
            [cell reloadData:self.optionsContentArray[indexPath.row] model:TTmodel];
        }
        if (TTmodel.typeId == 0) {
            //单选题
            if ([TTmodel.myanswer isEqualToString:@" "]||TTmodel.myanswer == nil) {
                cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                    make.left.equalTo(cell.bottomView.mas_right).offset(15);
                    make.size.mas_equalTo(CGSizeMake(0, 0));

                }];
            }else{
                
                NSDictionary *dict = self.optionsContentArray[indexPath.row];
                if ([TTmodel.myanswer isEqualToString:[NSString stringWithFormat:@"%@",dict.allValues[0]]] ) {
                   /**状态（0：未答，1：答对，2：答错）*/
                    if (TTmodel.status == 0||TTmodel.status == 2) {
                      cell.bottomView.backgroundColor = [UIColor colorWithRed:252/255.0 green:213/255.0 blue:213/255.0 alpha:1];
//                      cell.leftLabel.attributedText =
                        cell.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:237/255.0 green:66/255.0 blue:66/255.0 alpha:1];
                        cell.rightOrWrongImageView.image = [UIImage imageNamed:@"cuo"];
                        [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.left.equalTo(cell.bottomView.mas_right).offset(15);
                            make.size.mas_equalTo(CGSizeMake(15, 15));

                        }];
                    }else if (TTmodel.status == 1){
                      cell.bottomView.backgroundColor = [UIColor colorWithRed:218/255.0 green:246/255.0 blue:230/255.0 alpha:1];
                        cell.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:80/255.0 green:219/255.0 blue:142/255.0 alpha:1];
                        cell.rightOrWrongImageView.image = [UIImage imageNamed:@"dui-2"];
                        [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                            make.left.equalTo(cell.bottomView.mas_right).offset(15);
                            make.size.mas_equalTo(CGSizeMake(15, 15));

                        }];
                    }

                }else{
                   cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                    [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                        make.left.equalTo(cell.bottomView.mas_right).offset(15);
                        make.size.mas_equalTo(CGSizeMake(0, 0));

                    }];
                }
            }
        }else if (TTmodel.typeId == 1){
            //多选题
            NSString *userAnswerStr = TTmodel.myanswer;
             
            if ([userAnswerStr isEqualToString:@" "]||TTmodel.myanswer == nil) {
                cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
             
                 [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                     make.left.equalTo(cell.bottomView.mas_right).offset(15);
                     make.size.mas_equalTo(CGSizeMake(0, 0));

                 }];
            }else{
                if ([userAnswerStr containsString:@","]) {
                    //多选答案用,拼接
                   
                    NSDictionary *dict = self.optionsContentArray[indexPath.row];
                    NSArray *aryuserAnswerStr = [userAnswerStr componentsSeparatedByString:@","];
                    for (int i = 0; i<aryuserAnswerStr.count; ++i) {
                        /**状态（0：未答，1：答对，2：答错）*/
//                        TTmodel.status == 0||
                         if (TTmodel.status == 2) {
                             if ([aryuserAnswerStr[i] isEqualToString:dict.allValues[0]]) {
                              cell.bottomView.backgroundColor = [UIColor colorWithRed:252/255.0 green:213/255.0 blue:213/255.0 alpha:1];
                                 cell.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:237/255.0 green:66/255.0 blue:66/255.0 alpha:1];
                                 cell.rightOrWrongImageView.image = [UIImage imageNamed:@"cuo"];
                                 [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                     make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                     make.size.mas_equalTo(CGSizeMake(15, 15));

                                 }];
                                 break;
                                 
                             }else{
                                 cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                                 cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                                  [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                      make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                      make.size.mas_equalTo(CGSizeMake(0, 0));

                                  }];
                             }
                         }else if (TTmodel.status == 1){
                           if ([aryuserAnswerStr[i] isEqualToString:dict.allValues[0]]) {
                            cell.bottomView.backgroundColor = [UIColor colorWithRed:218/255.0 green:246/255.0 blue:230/255.0 alpha:1];
                               cell.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:80/255.0 green:219/255.0 blue:142/255.0 alpha:1];
                               cell.rightOrWrongImageView.image = [UIImage imageNamed:@"dui-2"];
                               [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                   make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                   make.size.mas_equalTo(CGSizeMake(15, 15));

                               }];
                               break;
                           }else{
                               cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                               cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                                [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                    make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                    make.size.mas_equalTo(CGSizeMake(0, 0));

                                }];
                           }
                         }else if (TTmodel.status == 0){
                             cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                             cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                              [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                  make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                  make.size.mas_equalTo(CGSizeMake(0, 0));

                              }];
                             
                         }
                    }
                }else{
                    //只有1个答案无,号
                    /**状态（0：未答，1：答对，2：答错）*/
                     NSDictionary *dict = self.optionsContentArray[indexPath.row];

                    if (TTmodel.status == 2) {
                         if ([userAnswerStr isEqualToString:dict.allValues[0]]) {
                          cell.bottomView.backgroundColor = [UIColor colorWithRed:252/255.0 green:213/255.0 blue:213/255.0 alpha:1];
                             cell.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:237/255.0 green:66/255.0 blue:66/255.0 alpha:1];
                             cell.rightOrWrongImageView.image = [UIImage imageNamed:@"cuo"];
                             [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                 make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                 make.size.mas_equalTo(CGSizeMake(15, 15));

                             }];
                         }else{
                            cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                             cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                              [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                  make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                  make.size.mas_equalTo(CGSizeMake(0, 0));

                              }];
                         }

                     }else if (TTmodel.status == 1){
                       if ([userAnswerStr isEqualToString:dict.allValues[0]]) {
                        cell.bottomView.backgroundColor = [UIColor colorWithRed:218/255.0 green:246/255.0 blue:230/255.0 alpha:1];
                           cell.rightOrWrongBottomView.backgroundColor = [UIColor colorWithRed:80/255.0 green:219/255.0 blue:142/255.0 alpha:1];
                           cell.rightOrWrongImageView.image = [UIImage imageNamed:@"dui-2"];
                           [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                               make.left.equalTo(cell.bottomView.mas_right).offset(15);
                               make.size.mas_equalTo(CGSizeMake(15, 15));

                           }];
                       }else{
                           cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                           cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                            [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                                make.left.equalTo(cell.bottomView.mas_right).offset(15);
                                make.size.mas_equalTo(CGSizeMake(0, 0));

                            }];
                       }

                     }else if (TTmodel.status == 0) {
                         cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                         cell.bottomView.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
                          [cell.rightOrWrongBottomView mas_remakeConstraints:^(MASConstraintMaker *make) {
                              make.left.equalTo(cell.bottomView.mas_right).offset(15);
                              make.size.mas_equalTo(CGSizeMake(0, 0));

                          }];
                     }
                }

            }

        }


         return cell;
    }else{
        ThirdthWrongTestTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdthWrongTestTableViewCellID"];
        
         return cell;
    }

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==2) {
      TheTestModel  *TTmodel  = self.dataArray[self.questionNumber];

        self.thetesttipView.hidden = NO;
        self.thetesttipView.buttonBottomView.hidden = YES;
        [self.thetesttipView reloadData:TTmodel];
    }
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件

/**选择题目*/
- (void)WrongChooseQuestionViewmyCollectionViewActiondelegate:(WrongChooseQuestionView*)cell index:(NSIndexPath*)indexPath{
    self.questionNumber = indexPath.row;
    
    [self.myTableView reloadData];
    [UIView animateWithDuration:1.0f animations:^{
        self.mychooseQuestionView.hidden = YES;
    }];
}
/**选择题目的上一题，下一题*/
- (void)WrongChooseQuestionViewbuttonActiondelegate:(WrongChooseQuestionView*)view button:(UIButton*)sender{
        [UIView animateWithDuration:1.0f animations:^{
        self.mychooseQuestionView.hidden = YES;
    }];
    if ([sender.currentTitle isEqualToString:@"上一题"]) {

        [self lastButtonAction:sender];
        if (self.questionNumber == self.dataArray.count-1){
         
        }else{
           
        }
    }else{

        //下一题
        [self nextButtonAction:sender];
        if (self.questionNumber == self.dataArray.count-1){
          
        }else{
            
        }
    }
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**选择试题*/
- (IBAction)chooseQuestionButtonAction:(id)sender {
    
    [UIView animateWithDuration:1.0f animations:^{
        self.mychooseQuestionView.questionNumber = self.questionNumber;
        self.mychooseQuestionView.questionsDtoListArrayM = [NSMutableArray arrayWithArray:self.dataArray];
        self.mychooseQuestionView.dataArray = self.dataArray;
        self.mychooseQuestionView.hidden = NO;
        [self.mychooseQuestionView.myCollectionView reloadData];
        
    }];
}
/**上一题*/
- (IBAction)lastButtonAction:(id)sender {
    if (self.dataArray.count>0) {
        if (self.questionNumber == 0) {
          if (self.questionNumber == self.dataArray.count-1){
          }else{
          }
        }else{
            
            self.questionNumber = self.questionNumber-1;
            
            [self.myTableView reloadData];
            
            if (self.questionNumber == self.dataArray.count-1){

            }else{

            }
        }
    }

}
/**下一题*/
- (IBAction)nextButtonAction:(id)sender {

    if (self.dataArray.count>0) {
        if (self.questionNumber == self.dataArray.count-1) {
            [SVProgressHUD showInfoWithStatus:@"已经是最后一题了"];


        }else{


            self.questionNumber = self.questionNumber+1;

            [self.myTableView reloadData];
            if (self.questionNumber == self.dataArray.count-1){
               
            }else{
               
            }
        }
    }
}


//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/**在线考试答题详情*/
- (void)requestmobileEvaluationgetmyexaminfo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //考试id
    para[@"examId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    para[@"examPaperId"] = [NSString stringWithFormat:@"%d",self.model.examPaperId];

    //试卷id
//    para[@"examPaperId"] = [NSString stringWithFormat:@"%d",self.model.examPaperId];
    [LaborCenterRequestDatas mobileEvaluationgetmyexaminforequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dataArray = [NSArray array];
        self.dataArray = result;
        [self.myTableView reloadData];
        //获取到试卷数据，可以上一题下一题
        self.NextButtonBottomView.userInteractionEnabled = YES;
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
