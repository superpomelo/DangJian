//
//  LaborCenterLessonDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LaborCenterLessonDetailsViewController.h"
#import "FirstLaborCenterLessonDetailsTableViewCell.h"
#import "SecondLaborCenterLessonDetailsTableViewCell.h"
#import "ThirdLaborCenterLessonDetailsTableViewCell.h"
#import "FourthLaborCenterLessonDetailsTableViewCell.h"
#import "FivethLaborCenterLessonDetailsTableViewCell.h"
#import "JLTextView.h"
#import <IQKeyboardManager.h>
#import "SelVideoPlayer.h"
#import "SelPlayerConfiguration.h"
#import "LaborCenterRequestDatas.h"
#import "ZeropinlunTableViewCell.h"
#import "LaborCenterLessonDetailsPlayEndView.h"
#import "TheExamRushedOffViewController.h"
#import "LaborCenterRequestDatas.h"
#import "LearningCenterRequest.h"
#import "NoNetWorkView.h"
#import "UserInfoManager.h"

@interface LaborCenterLessonDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,ThirdLaborCenterLessonDetailsTableViewCellDelegate,SelVideoPlayerDelegate,LaborCenterLessonDetailsPlayEndViewDelegate,NoNetWorkViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *TFBottomView;
@property (weak, nonatomic) JLTextView *textView;
@property (weak, nonatomic) UIView *commentContentView;

@property (nonatomic, strong) SelVideoPlayer *player;
@property (nonatomic, strong) SelPlayerConfiguration *configuration;
@property (weak, nonatomic) IBOutlet UIView *playBottomView;
@property (nonatomic,strong)NSArray *ExperienceArray;
/**推荐数组*/
@property (nonatomic,strong)NSMutableArray *recommendedArrayM;
/**收藏button*/
@property (weak, nonatomic) IBOutlet UIButton *collectionButton;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property(nonatomic, strong)LaborCenterLessonDetailsPlayEndView *playEndrView;
/**无网络*/
@property(nonatomic, strong)NoNetWorkView *nonetView;
@property (nonatomic,strong)TeacherLectureHallModel *model;
@property (nonatomic,strong)NSArray *array;
@end

@implementation LaborCenterLessonDetailsViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.array = [NSArray array];

    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//            [self initPlayView];
    });
    if ([IsIphoneX isIphoneX]==NO) {
        self.topConstraint.constant = -20.0f;
    }
    [self addKeyBoardObservers];
    [self initmyTableView];
    
    [self initUI];
    [self requestlearnmobileLearnplayVideo];
    [self requestexperienceexperienceforlesson];
    [self requestsyscollectmycollectstatus];
    [self requestmobileLearngetupdata];
//    [self requestmobileLearnsubmitExperience];
    self.fd_prefersNavigationBarHidden = YES;
    if ([[UserInfoManager getAFNetworkReachabilityStatus] isEqualToString:@"viaWWAN"]||[[UserInfoManager getAFNetworkReachabilityStatus] isEqualToString:@"viaWiFi"]) {
     //有网络
    }else{
       //无网络
        [self.view addSubview:self.nonetView];
        self.nonetView.hidden = NO;
    }
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    // [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;

}

- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
// [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES; // 控制是否显示键盘上的工具条
    [_player _deallocPlayer];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

 }


- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_textView resignFirstResponder];
}
//MARK: - Initalization - 初始化
/**无网络页面*/
- (NoNetWorkView *)nonetView{
    if (!_nonetView) {
    _nonetView = [[NSBundle mainBundle] loadNibNamed:@"NoNetWorkView" owner:self options:nil][0];
        _nonetView.frame = self.view.bounds;
        [_nonetView setUI];
        _nonetView.delegate = self;
//        [self.playBottomView addSubview:_playEndrView];
    }
    return _nonetView;
}
/**播放结束*/
- (LaborCenterLessonDetailsPlayEndView *)playEndrView{
    if (!_playEndrView) {
    _playEndrView = [[NSBundle mainBundle] loadNibNamed:@"LaborCenterLessonDetailsPlayEndView" owner:self options:nil][0];
        _playEndrView.frame = self.playBottomView.bounds;
        _playEndrView.leftBottomView.layer.cornerRadius = 4;
        _playEndrView.rightBottomView.layer.cornerRadius = 4;
        _playEndrView.delegate = self;
        [self.playBottomView addSubview:_playEndrView];
    }
    return _playEndrView;
}

/**处理推荐数组数据*/
- (void)initrecommendedArrayM{
    self.recommendedArrayM = [NSMutableArray array];
    for (int i = 0; i<self.array.count; i++) {
        TeacherLectureHallModel *modelT = self.array[i];
        if (self.model.idx == modelT.idx) {
            
        }else{
            [self.recommendedArrayM addObject:modelT];
        }
    }
}
/**播放视频页面*/
- (void)initPlayView{
        if ([[UIDevice currentDevice].systemVersion floatValue] > 7.0) {
            self.edgesForExtendedLayout = UIRectEdgeNone;
        }
        
        _configuration = [[SelPlayerConfiguration alloc]init];
        _configuration.shouldAutoPlay = YES;     //自动播放
        _configuration.supportedDoubleTap = YES;     //支持双击播放暂停
        _configuration.shouldAutorotate = NO;   //自动旋转
        _configuration.repeatPlay = NO;     //重复播放
        _configuration.statusBarHideState = SelStatusBarHideStateFollowControls;     //设置状态栏隐藏
    //    NSURL *localUrl = [[NSBundle mainBundle] URLForResource:@"/Users/superpomelo/Desktop/SelVideoPlayer/DaQiang 2020-09-09 09.24.08" withExtension:@"mp4"];
    //    NSURL *Url = [NSURL URLWithString:@"https://stream7.iqilu.com/10339/upload_transcode/202002/18/20200218114723HDu3hhxqIT.mp4"];
    NSURL *Url;
    if ([self.model.videoUrl containsString:@"http"]) {
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@",self.model.videoUrl]];

    }else{
        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,self.model.videoUrl]];

    }


        
        _configuration.sourceUrl = Url;     //设置播放数据源
    //拉伸方式
        _configuration.videoGravity = SelVideoGravityResize;
        
    _player = [[SelVideoPlayer alloc]initWithFrame:self.playBottomView.bounds configuration:_configuration];
    _player.delegate = self;
    [self.playBottomView addSubview:_player];
}


-(void)addKeyBoardObservers
{
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
    

}
-(void)keyboardWillShow:(NSNotification *)sender
{
    CGRect rect = [sender.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval duration = [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    

        CGRect frame = self.commentContentView.frame;
        frame.origin.y = SCR_H-rect.size.height-104;
        
        [UIView animateWithDuration:duration animations:^{
            self.commentContentView.frame = frame;
        } completion:^(BOOL finished) {
            
        }];
}
-(void)keyboardWillHide:(NSNotification *)sender
{
    NSTimeInterval duration = [[sender.userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey]doubleValue];
    
    CGRect frame = self.commentContentView.frame;
    frame.origin.y = SCR_H;
    
    [UIView animateWithDuration:duration animations:^{
        self.commentContentView.frame = frame;
    } completion:^(BOOL finished) {
        [self.commentContentView removeFromSuperview];
    }];
    
}


-(void)showTextView
{
    JLTextView *textView = [[JLTextView alloc] initWithFrame:CGRectMake(15, 12, SCR_W-15-90, 80)];
    
    textView.font = [UIFont systemFontOfSize:15.f];
//    textView.textColor = [UIColor colorWithHexString:@"2f2f2f"];
    textView.jlLineHeight = 20.f;
    textView.middleWhenMoreLineHeight = YES;

    textView.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
    textView.layer.cornerRadius = 4.f;
    textView.placeholder = NSLocalizedString(@"发布评论", nil);
    textView.maxTextLength = 100;
    textView.delegate = self;
    textView.returnKeyType = UIReturnKeySend;
    self.textView = textView;
    
    UIButton *btn = [[UIButton alloc] initWithFrame:CGRectMake(SCR_W-80, 35, 70, 30)];
    btn.layer.cornerRadius = btn.bounds.size.height/2;
    btn.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
    [btn setTitle:NSLocalizedString(@"发布", nil) forState:UIControlStateNormal];
    btn.titleLabel.font = [UIFont systemFontOfSize:16.f];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateNormal];
    [btn setTitleColor:[UIColor whiteColor] forState:UIControlStateDisabled];
//    [btn setTitleColor:[UIColor colorWithRed:117/255.0 green:117/255.0 blue:117/255.0 alpha:1] forState:UIControlStateDisabled];
    btn.enabled = NO;
    [btn addTarget:self action:@selector(commentBtnClick:) forControlEvents:UIControlEventTouchUpInside];
    
    UIView *line = [[UIView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, 1)];
    line.backgroundColor = [UIColor colorWithRed:243/255.0 green:243/255.0 blue:243/255.0 alpha:1];
    
    UIView *contentView = [[UIView alloc] initWithFrame:CGRectMake(0, SCR_H, SCR_W, 80+24)];
    contentView.backgroundColor = [UIColor whiteColor];
    
    [contentView addSubview:line];
    [contentView addSubview:btn];
    [contentView addSubview:textView];
    [self.view addSubview:contentView];
    _commentContentView = contentView;
    
    self.textView.textLengthHandler = ^(JLTextView * _Nonnull view, NSUInteger curryLength) {
        if (curryLength>0) {
            btn.enabled = YES;
        }else{
            btn.enabled = NO;
        }
    };
    [textView becomeFirstResponder];
}
-(void)commentBtnClick:(UIButton *)sender
{
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    [_textView resignFirstResponder];
    //提交心得
    [self requestmobileLearnsubmitExperience];
//    NSString *comment = _textView.text;
 
}
- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
    if ([text isEqualToString:@"\n"]) {
        [self commentBtnClick:nil];
        return NO;
    }
    return YES;
}
- (void)initUI{
    self.collectionButton.userInteractionEnabled = NO;
    self.TFBottomView.layer.cornerRadius = self.TFBottomView.bounds.size.height/2;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 250.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstLaborCenterLessonDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstLaborCenterLessonDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondLaborCenterLessonDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondLaborCenterLessonDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdLaborCenterLessonDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdLaborCenterLessonDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthLaborCenterLessonDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthLaborCenterLessonDetailsTableViewCellID"];
     [self.myTableView registerNib:[UINib nibWithNibName:@"FivethLaborCenterLessonDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethLaborCenterLessonDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeropinlunTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeropinlunTableViewCellID"];
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.000001)];
    self.myTableView.tableHeaderView = vi;
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{

    return UITableViewAutomaticDimension;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 4;
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
            if (self.ExperienceArray.count == 0) {
                return 1;
            }else{
                return self.ExperienceArray.count;

            }
            break;

        default:
            break;
    }
    return 0;
}


-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1||section == 2||section == 3) {
        return 45;
    }else{
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1||section == 2||section == 3) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 35)];
        vi.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];

        [self.myTableView addSubview:vi];
        UIView *vibg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 10)];
        vibg.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];
        
//        vibg.backgroundColor = [UIColor redColor];

        [vi addSubview:vibg];
        //线
        UIView *linevibg = [[UIView alloc]initWithFrame:CGRectMake(0, 44.5, SCR_W, 0.5)];
        linevibg.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];

        [vi addSubview:linevibg];
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, SCR_W, 34.5)];

//        lb.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
       NSString *str = [NSString string];
        if (section == 1) {
            str = @"更多推荐";
        }else if (section == 2) {
            str = @"视频简介";
        }else if(section == 3){
            str = @"评论";
        }
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName: [UIFont systemFontOfSize:14],NSForegroundColorAttributeName: [UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1.0]}];
        lb.attributedText = attributedString;
        [vi addSubview:lb];
        return vi;
    }else{
        return nil;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SecondLaborCenterLessonDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondLaborCenterLessonDetailsTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];

        }
        return cell;
    }else if (indexPath.section == 1) {
        ThirdLaborCenterLessonDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdLaborCenterLessonDetailsTableViewCellID"];
        cell.array = self.recommendedArrayM;
        cell.delegate = self;
        [cell reloadData];
        return cell;
    }else if (indexPath.section == 2) {

        FourthLaborCenterLessonDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FourthLaborCenterLessonDetailsTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];

        }
         return cell;
    }else{
        
        if (self.ExperienceArray.count == 0) {
            ZeropinlunTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeropinlunTableViewCellID"];
            return cell;
        }else{
            FivethLaborCenterLessonDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethLaborCenterLessonDetailsTableViewCellID"];
            [cell reloadData:self.ExperienceArray[indexPath.row]];
            return cell;

        }

    }
  
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
}


//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件

/**再看一遍*/
- (void)LaborCenterLessonDetailsPlayEndViewLeftButtonActiondelegate:(LaborCenterLessonDetailsPlayEndView*)view{
    [_player _deallocPlayer];
    [self initPlayView];
}
/**劳动测试*/
- (void)LaborCenterLessonDetailsPlayEndViewrightButtonActiondelegate:(LaborCenterLessonDetailsPlayEndView*)view{
    TheExamRushedOffViewController *TEvc = [[TheExamRushedOffViewController alloc]init];
    [self.navigationController pushViewController:TEvc animated:YES];
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
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
    [self showTextView];

}

- (IBAction)shareButtonAction:(id)sender {
    [SVProgressHUD showInfoWithStatus:@"开发中，敬请期待"];

}
/**收藏button*/
- (IBAction)collectButtonAction:(UIButton*)sender {
    sender.selected = !sender.selected;
    if (sender.selected == YES) {
        [self requestsyscollect];
    }else{
        [self requestsyscollectmycollectdele];
    }
}


//MARK: - Utility - 多用途(功能)方法
/**无网络下返回*/
- (void)NoNetWorkViewBackButtonActiondelegate:(NoNetWorkView*)view{
    [self.navigationController popViewControllerAnimated:YES];
}
/**再试一下*/
- (void)NoNetWorkViewAgainButtonActiondelegate:(NoNetWorkView*)view{
    [self requestlearnmobileLearnplayVideo];
    [self requestexperienceexperienceforlesson];
    [self requestsyscollectmycollectstatus];
    [self requestmobileLearngetupdata];
}
/**ThirdLearningCenterDetails2TableViewCellDelegate*/
- (void)ThirdLaborCenterLessonDetailsTableViewCellCollectionViewActiondelegate:(ThirdLaborCenterLessonDetailsTableViewCell*)cell  CollectionViewindexPath:(NSIndexPath*)indexPath{
    self.model = self.recommendedArrayM[indexPath.row];
    self.courseId = [NSString stringWithFormat:@"%d",self.model.courseId];
    self.idx = [NSString stringWithFormat:@"%d",self.model.idx];
//    [self initrecommendedArrayM];
    [self requestexperienceexperienceforlesson];
    [self requestsyscollectmycollectstatus];
    [self requestmobileLearngetupdata];

}
/**播放结束delegate*/
- (void)SelVideoPlayerEnddelegate:(SelVideoPlayer*)view{
    NSLog(@"10000");
    [self.playBottomView bringSubviewToFront:self.playEndrView];
    self.playEndrView.hidden = NO;
    [self requestsysintegralsaveIntegralFORMOV];
}
//MARK: - Network request - 网络请求
/**播放视频-<开始计时>*/
- (void)requestlearnmobileLearnplayVideo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"courseId"] = self.courseId;
    para[@"lessonId"] = self.idx;
    [LaborCenterRequestDatas learnmobileLearnplayVideorequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];

}

/**结束播放-<结束计时>*/
- (void)requestlearnmobileLearnendPlayVideo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"courseId"] = [NSString stringWithFormat:@"%d",self.model.courseId];
    para[@"lessonId"] = self.idx;
    //当前播放进度
    para[@"currentPlayProgress"] = @"";
    
    [LaborCenterRequestDatas learnmobileLearnendPlayVideorequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**通过lesson_id查询心得*/
- (void)requestexperienceexperienceforlesson{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"lesson_id"] = self.idx;

    
    [LaborCenterRequestDatas experienceexperienceforlessonrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.ExperienceArray = [NSArray array];
        self.ExperienceArray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**新增心得*/
- (void)requestmobileLearnsubmitExperience{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"body"] = _textView.text;
    para[@"courseId"] = self.courseId;
    para[@"lessonId"] = self.idx;
    para[@"dept_id"] = @"1";
    [LaborCenterRequestDatas mobileLearnsubmitExperiencerequestDataWithparameters:para success:^(id  _Nonnull result) {
        [self requestexperienceexperienceforlesson];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**新增收藏*/
- (void)requestsyscollect{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = self.idx;
    para[@"type"] = @"2"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    para[@"delFlag"] = @"1";
    para[@"userId"] = @"1";
    para[@"id"] = @"1";

    [LaborCenterRequestDatas syscollectrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**删除收藏*/
- (void)requestsyscollectmycollectdele{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = self.idx;
    para[@"type"] = @"2"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LaborCenterRequestDatas syscollectmycollectdelerequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**收藏状态*/
- (void)requestsyscollectmycollectstatus{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = self.idx;
    para[@"type"] = @"2"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈

    [LaborCenterRequestDatas syscollectmycollectstatusrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.collectionButton.userInteractionEnabled = YES;

        if ([result[@"data"] boolValue] == YES) {
            self.collectionButton.selected = YES;
        }else{
            self.collectionButton.selected = NO;
        }
    } failure:^(NSError * _Nonnull error) {
        self.collectionButton.userInteractionEnabled = YES;

    }];
}

/**加积分*/
- (void)requestsysintegralsaveIntegralFORMOV{
    //type：0-课时 1-签到 2-新闻 3-活动-4-劳动圈
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"type"] = @"0";
    para[@"forId"] = self.idx;
    [LearningCenterRequest sysintegralsaveIntegralFORMOVrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**课程详情*/
- (void)requestmobileLearngetupdata{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"lessonId"] = self.idx;
    [LaborCenterRequestDatas mobileLearngetupdatarequestDataWithparameters:para success:^(id  _Nonnull result) {
        NSDictionary *dictData = [NSDictionary dictionary];
        dictData = result;
        NSLog(@"%@",result);
        if ([dictData.allKeys containsObject:@"one"]) {
//            self.model = dictData[@"one"];
            self.model = [TeacherLectureHallModel mj_objectWithKeyValues:dictData[@"one"]];
            
            if ([dictData.allKeys containsObject:@"two"]) {
               self.recommendedArrayM =  [TeacherLectureHallModel mj_objectArrayWithKeyValuesArray:dictData[@"two"]]; //数组
            }
            [_player _deallocPlayer];
            [self initPlayView];
          [self.myTableView reloadData];
        }else{
            NSLog(@"4");

        }

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
