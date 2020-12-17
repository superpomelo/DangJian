//
//  LearningCenterDetails2ViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LearningCenterDetails2ViewController.h"
#import "FirstLearningCenterDetails2TableViewCell.h"
#import "SecondLearningCenterDetails2TableViewCell.h"
#import "ThirdLearningCenterDetails2TableViewCell.h"
#import "FourthLearningCenterDetails2TableViewCell.h"
#import "FivethLearningCenterDetails2TableViewCell.h"
#import "JLTextView.h"
#import <IQKeyboardManager.h>
#import "SelVideoPlayer.h"
#import "SelPlayerConfiguration.h"
#import "LaborCenterRequestDatas.h"

@interface LearningCenterDetails2ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,ThirdLearningCenterDetails2TableViewCellDelegate>
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


@end

@implementation LearningCenterDetails2ViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initrecommendedArrayM];
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            [self initPlayView];
    });
    [self addKeyBoardObservers];
    [self initmyTableView];
    
    [self initUI];
    [self requestlearnmobileLearnplayVideo];
    [self requestexperienceexperienceforlesson];
    [self requestsyscollectmycollectstatus];
//    [self requestmobileLearnsubmitExperience];
}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [self.navigationController setNavigationBarHidden:YES animated:YES];
    // [IQKeyboardManager sharedManager].enable = NO;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
}


- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
// [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = NO; // 控制是否显示键盘上的工具条

 }

//MARK: - Initalization - 初始化
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
        _configuration.videoGravity = SelVideoGravityResizeAspect;   //拉伸方式
        
    _player = [[SelVideoPlayer alloc]initWithFrame:self.playBottomView.bounds configuration:_configuration];
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
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstLearningCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstLearningCenterDetails2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondLearningCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondLearningCenterDetails2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdLearningCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdLearningCenterDetails2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthLearningCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthLearningCenterDetails2TableViewCellID"];
     [self.myTableView registerNib:[UINib nibWithNibName:@"FivethLearningCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethLearningCenterDetails2TableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    switch (indexPath.section) {
//        case 0:
//            return 240;
//            break;
//        case 1:
//                return 80;
//                break;
//        case 2:
//                return 100;
//                break;
//        case 3:
//                return 100;
//                break;
//        default:
//            break;
//    }
//    return 0;
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
            return self.ExperienceArray.count;
            break;

        default:
            break;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1||section == 2||section == 3) {
        return 50;
    }else{
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1||section == 2||section == 3) {
        UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 35)];
        vi.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];

        [tableView addSubview:vi];
        UIView *vibg = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 10)];
        vibg.backgroundColor = [UIColor colorWithRed:239/255.0 green:239/255.0 blue:239/255.0 alpha:1];

        [vi addSubview:vibg];
        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(15, 10, SCR_W, 40)];

        lb.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
       NSString *str = [NSString string];
        if (section == 1) {
            str = @"更多推荐";
        }else if (section == 2) {
            str = @"视频简介";
        }else if(section == 3){
            str = @"评论";
        }
        NSMutableAttributedString *attributedString = [[NSMutableAttributedString alloc] initWithString:str attributes:@{NSFontAttributeName: [UIFont boldSystemFontOfSize:16],NSForegroundColorAttributeName: [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1.0]}];
        lb.attributedText = attributedString;
        [vi addSubview:lb];
        return vi;
    }else{
        return nil;
    }

}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        SecondLearningCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondLearningCenterDetails2TableViewCellID"];
        [cell reloadData:self.model];
        return cell;
    }else if (indexPath.section == 1) {
        ThirdLearningCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdLearningCenterDetails2TableViewCellID"];
        cell.array = self.recommendedArrayM;
        cell.delegate = self;
        [cell reloadData];
        return cell;
    }else if (indexPath.section == 2) {

        FourthLearningCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FourthLearningCenterDetails2TableViewCellID"];
        [cell reloadData:self.model];
         return cell;
    }else{
        FivethLearningCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethLearningCenterDetails2TableViewCellID"];
        [cell reloadData:self.ExperienceArray[indexPath.row]];
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
/**ThirdLearningCenterDetails2TableViewCellDelegate*/
- (void)ThirdLearningCenterDetails2TableViewCellCollectionViewActiondelegate:(ThirdLearningCenterDetails2TableViewCell*)cell  CollectionViewindexPath:(NSIndexPath*)indexPath{
    self.model = self.recommendedArrayM[indexPath.row];
    [self initrecommendedArrayM];
    [_player _deallocPlayer];
    [self initPlayView];
    [self requestexperienceexperienceforlesson];
    [self requestsyscollectmycollectstatus];

    
}
//MARK: - Network request - 网络请求
/**播放视频-<开始计时>*/
- (void)requestlearnmobileLearnplayVideo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"courseId"] = [NSString stringWithFormat:@"%d",self.model.courseId];
    para[@"lessonId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    [LaborCenterRequestDatas learnmobileLearnplayVideorequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];

}

/**结束播放-<结束计时>*/
- (void)requestlearnmobileLearnendPlayVideo{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"courseId"] = [NSString stringWithFormat:@"%d",self.model.courseId];
    para[@"lessonId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    //当前播放进度
    para[@"currentPlayProgress"] = @"";
    
    [LaborCenterRequestDatas learnmobileLearnendPlayVideorequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**通过lesson_id查询心得*/
- (void)requestexperienceexperienceforlesson{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"lesson_id"] = [NSString stringWithFormat:@"%d",self.model.idx];

    
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
    para[@"courseId"] = [NSString stringWithFormat:@"%d",self.model.courseId];
    para[@"lessonId"] = [NSString stringWithFormat:@"%d",self.model.idx];
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
    para[@"collectId"] = [NSString stringWithFormat:@"%d",self.model.idx];
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
    para[@"collectId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    para[@"type"] = @"2"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LaborCenterRequestDatas syscollectmycollectdelerequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**收藏状态*/
- (void)requestsyscollectmycollectstatus{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = [NSString stringWithFormat:@"%d",self.model.idx];
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
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
