//
//  MyCircleCenterDetails1ViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  劳动圈-图文详情

#import "MyCircleCenterDetails1ViewController.h"
#import "FirstMyCircleCenterDetails1TableViewCell.h"
#import "SecondMyCircleCenterDetails1TableViewCell.h"
#import "ThirdMyCircleCenterDetails1TableViewCell.h"
#import "FivethMyCircleCenterDetails1TableViewCell.h"
#import "SixthMyCircleCenterDetails1TableViewCell.h"

#import "JLTextView.h"
#import <IQKeyboardManager.h>
#import "LearningCenterRequest.h"
#import "LearningCenterDetailsModel.h"
#import "LaborCenterRequestDatas.h"
#import "GKPhotoBrowser.h"
#import "MyCircleCenterRequestDatas.h"
#import "SevenMyCircleCenterDetails1TableViewCell.h"
#import "PlayVideoViewController.h"
#import "ZeropinlunTableViewCell.h"
#import "NoNetWorkView.h"
#import "UserInfoManager.h"
#import "LearningCenterDetailsModel.h"

@interface MyCircleCenterDetails1ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate,SixthMyCircleCenterDetails1TableViewCellDelegate,ThirdMyCircleCenterDetails1TableViewCellDelegate,NoNetWorkViewDelegate,FivethMyCircleCenterDetails1TableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *TFBottomView;
/**收藏button*/
@property (weak, nonatomic) IBOutlet UIButton *collectionButton;
@property (weak, nonatomic) JLTextView *textView;
@property (weak, nonatomic) UIView *commentContentView;
/**评论列表*/
@property (nonatomic,strong)NSArray *CommentVoListArray;
/**无网络*/
@property(nonatomic, strong)NoNetWorkView *nonetView;
@property(nonatomic,strong)MyCircleCenterHomeModel *model;
@property (weak, nonatomic) IBOutlet UIView *pinlunNumBottomView;
/**评论数量*/
@property (weak, nonatomic) IBOutlet UILabel *pinlunNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@end

@implementation MyCircleCenterDetails1ViewController


//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.pinlunNumBottomView.layer.cornerRadius = 14/2;

    [self addKeyBoardObservers];
    [self initmyTableView];
    [self initUI];
    self.myTableView.hidden = YES;

    [self requestmobileIndexgetCommentVoList];
    [self requestsyscollectmycollectstatus];
//    [self requestsysupmycollectstatusrequestDataWithparameters];
    [self requestmyzonegetbyid];
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
}


- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
// [IQKeyboardManager sharedManager].enable = YES;
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES; // 控制是否显示键盘上的工具条

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
    //按了回车键
    if ([_textView.text isEqualToString:@""]) {
        return ;
    }
//    NSString *comment = _textView.text;
    [self requestmobileIndexsubmitComment];

 
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
    self.titlesLabel.attributedText = [UILabel getABTbody:@"故事坊" font:18 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
    self.TFBottomView.layer.cornerRadius = self.TFBottomView.bounds.size.height/2;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
//    self.myTableView.bounces = NO;
    self.myTableView.estimatedRowHeight = 70.0;

    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyCircleCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyCircleCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdMyCircleCenterDetails1TableViewCellID"];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"FivethMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethMyCircleCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SixthMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"SixthMyCircleCenterDetails1TableViewCellID"];
    
    [self.myTableView registerNib:[UINib nibWithNibName:@"SevenMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"SevenMyCircleCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeropinlunTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeropinlunTableViewCellID"];
    
    
    
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
        if (self.model != nil) {
            /**imgorvid   0视频 1-图片 2文本*/
            if (self.model.imgorvid == 0) {
                return 2;
            }else if (self.model.imgorvid == 1){
                return 2;

            }else{
                return 1;

            }
        }else{
            return 0;
        }

    }else if (section == 2) {
        if (self.CommentVoListArray.count == 0) {
            return 1;
        }else{
            return self.CommentVoListArray.count;

        }
    }else if (section == 3) {
        return 1;
    }else{
        return 0;
    }

}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return 50;
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
        UIView *linevibg = [[UIView alloc]initWithFrame:CGRectMake(0, 44.5, SCR_W, 0.5)];
        linevibg.backgroundColor = [UIColor colorWithRed:235/255.0 green:235/255.0 blue:235/255.0 alpha:1];

        [vi addSubview:linevibg];
        
        UILabel *lbR = [[UILabel alloc]initWithFrame:CGRectMake(15, 20, 4, 16)];
        lbR.backgroundColor = [UIColor colorWithRed:196/255.0 green:48/255.0 blue:48/255.0 alpha:1.0];
        [vi addSubview:lbR];

        UILabel *lb = [[UILabel alloc]initWithFrame:CGRectMake(25, 10, SCR_W, 35)];
//        lb.backgroundColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:1];
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
        FirstMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyCircleCenterDetails1TableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];

        }
        return cell;
    }else if (indexPath.section == 1) {
        if (self.model.cover != nil){
            if (indexPath.row == 0) {
                SecondMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyCircleCenterDetails1TableViewCellID"];
                 [cell reloadData:self.model];
                 return cell;
            }else{
                if ([self.model.cover containsString:@","]) {
                    SixthMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SixthMyCircleCenterDetails1TableViewCellID"];
                    cell.delegate = self;
                    [cell reloadData:self.model];
                    return cell;
                }else{
                    ThirdMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyCircleCenterDetails1TableViewCellID"];
                    [cell reloadData:self.model];
                    cell.delegate = self;
                    return cell;
                }
            }



        }else{
           SecondMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyCircleCenterDetails1TableViewCellID"];
            if (self.model != nil) {
                [cell reloadData:self.model];

            }
            return cell;

        }

        
//        ThirdMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyCircleCenterDetails1TableViewCellID"];
//        return cell;
    }else{
        if (self.CommentVoListArray.count == 0) {
            ZeropinlunTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeropinlunTableViewCellID"];
            return cell;
        }else{
            FivethMyCircleCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethMyCircleCenterDetails1TableViewCellID"];
            cell.delegate = self;
            cell.indexpath = indexPath;
            [cell reloadData:self.CommentVoListArray[indexPath.row]];
            return cell;

        }

    }
  
    

    

}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    
    if (indexPath.section == 1) {
        /**imgorvid   0视频 1-图片 2文本*/
        if (self.model.imgorvid == 0) {
            if (indexPath.row == 0) {
                NSLog(@"0");
            }else if (indexPath.row == 1){
                PlayVideoViewController *PVvc = [[PlayVideoViewController alloc]init];
                NSString *http;
                if ([self.model.cover containsString:@"http"]) {
                    http = @"";
                    
                }else{
                    http = [NSString stringWithFormat:@"%@",VideoHost];
            //        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

                }
                PVvc.videoPath = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,self.model.cover]];
                PVvc.modalPresentationStyle = UIModalPresentationFullScreen;

                [self presentViewController:PVvc animated:NO completion:^{
                    
                }];
            }
            
        }
        
    }

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
    [self showTextView];
    

}
/**跳转到评论位置*/
- (IBAction)giveaLikeButtonAction:(UIButton*)sender {
    NSIndexPath * dayOne = [NSIndexPath indexPathForRow:0 inSection:2];
   [self.myTableView scrollToRowAtIndexPath:dayOne atScrollPosition:UITableViewScrollPositionTop animated:YES];
//    sender.selected = !sender.selected;
//    if (sender.selected == YES) {
//        [self requestsysuprequest];
//    }else{
//        [self requestsysupmycollectdele];
//    }
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
/***/
- (void)FivethMyCircleCenterDetails1TableViewCellButtonActiondelegate:(FivethMyCircleCenterDetails1TableViewCell*)cell button:(UIButton*)sender index:(NSIndexPath*)indexpath{
    GetCommentVoListModel *model = self.CommentVoListArray[indexpath.row];
//    if (model.type == 0) {
//        [self requestsysuprequestType:@"5"];
//    }else{
//        [self requestsysupmycollectdeleType:@"5"];
//    }
    
    if (model.type == 0) {
        [self  requestsysuprequestupId:[NSString stringWithFormat:@"%d",model.idx] Type:@"4"];
    
    }else{
        [self requestsysupmycollectdeleupId:[NSString stringWithFormat:@"%d",model.idx] Type:@"4"];
    }
}
/**无网络下返回*/
- (void)NoNetWorkViewBackButtonActiondelegate:(NoNetWorkView*)view{
    [self.navigationController popViewControllerAnimated:YES];
}
/**再试一下*/
- (void)NoNetWorkViewAgainButtonActiondelegate:(NoNetWorkView*)view{
    [self requestmobileIndexgetCommentVoList];
    [self requestsyscollectmycollectstatus];
//    [self requestsysupmycollectstatusrequestDataWithparameters];
    [self requestmyzonegetbyid];

}
- (void)ThirdMyCircleCenterDetails1TableViewCellActiondelegate:(ThirdMyCircleCenterDetails1TableViewCell*)cell{
    [self showbigImage:0];
}
/**预览图片*/
- (void)SixthMyCircleCenterDetails1TableViewCellActiondelegate:(SixthMyCircleCenterDetails1TableViewCell*)cell location:(NSInteger)loc{
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
        [GKPhotodataSource addObject:[NSString stringWithFormat:@"%@",dataSource[i]]];
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
/**评论列表*/
- (void)requestmobileIndexgetCommentVoList{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"myzoneId"] = self.idx;

    [MyCircleCenterRequestDatas CCmobileIndexgetCommentVoListrequestDataWithparameters:para success:^(id  _Nonnull result) {
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        self.CommentVoListArray =  [GetCommentVoListModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
        self.pinlunNumberLabel.text = [NSString stringWithFormat:@"%@",dict[@"data"][@"total"] ];
//        self.CommentVoListArray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**提交评论*/
- (void)requestmobileIndexsubmitComment{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"content"] = _textView.text;
    para[@"myzoneId"] = self.idx;

    [MyCircleCenterRequestDatas CCmobileIndexsubmitCommentrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.dataArray = result;
//        [self.myTableView reloadData];
        [self requestmobileIndexgetCommentVoList];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**新增收藏*/
- (void)requestsyscollect{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = self.idx;
    para[@"type"] = @"4"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
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
    para[@"type"] = @"4"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LaborCenterRequestDatas syscollectmycollectdelerequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**收藏状态*/
- (void)requestsyscollectmycollectstatus{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = self.idx;
    para[@"type"] = @"4"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈

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

/**新增点赞表*/
- (void)requestsysuprequest{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
      para[@"upId"] = self.idx;
      para[@"type"] = @"4"; //收藏类型1：新闻 2：课时 3：活动 4：故事坊评论点赞
    [LearningCenterRequest sysuprequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];


}

/**取消点赞*/
- (void)requestsysupmycollectdele{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
      para[@"upId"] = self.idx;
      para[@"type"] = @"4"; //收藏类型1：新闻 2：课时 3：活动 4：故事坊评论点赞
    [LearningCenterRequest sysupmycollectdelerequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];


}
/**点赞状态*/
//- (void)requestsysupmycollectstatusrequestDataWithparameters{
//      NSMutableDictionary *para = [NSMutableDictionary dictionary];
//      //收藏id，有课时id用课时id，没有用课程id
//      para[@"upId"] = self.idx;
//      para[@"type"] = @"4"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
//    [LearningCenterRequest sysupmycollectstatusrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.giveaLikeButton.userInteractionEnabled = YES;
//
//        if ([result[@"data"] boolValue] == YES) {
//            self.giveaLikeButton.selected = YES;
//        }else{
//            self.giveaLikeButton.selected = NO;
//        }
//    } failure:^(NSError * _Nonnull error) {
//        self.collectionButton.userInteractionEnabled = YES;
//
//    }];
//
//
//}

/**劳动圈详情*/
- (void)requestmyzonegetbyid{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"id"] = self.idx;
    [MyCircleCenterRequestDatas myzonegetbyidrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.model = result;
        [self.myTableView reloadData];
        dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
            self.myTableView.hidden = NO;

        });
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**新增点赞表*/
- (void)requestsysuprequestupId:(NSString*)upId Type:(NSString*)type{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
    
        para[@"upId"] = upId;

    
    
      para[@"type"] = type; //收藏类型1：新闻 2：课时 3：活动 4：故事坊评论点赞
    [LearningCenterRequest sysuprequestDataWithparameters:para success:^(id  _Nonnull result) {
 
        if ([type isEqualToString:@"4"]) {
            [self  requestmobileIndexgetCommentVoList];
        }else{
//            [self requestsysupmycollectalluprequestDataWithparameters];
//            [self requestsysupmycollectstatusrequestDataWithparametersType:type];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];


}

/**取消点赞*/
- (void)requestsysupmycollectdeleupId:(NSString*)upId Type:(NSString*)type{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
    para[@"upId"] = upId;
      para[@"type"] = type; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LearningCenterRequest sysupmycollectdelerequestDataWithparameters:para success:^(id  _Nonnull result) {

        if ([type isEqualToString:@"4"]) {
            [self  requestmobileIndexgetCommentVoList];
        }else{
//            [self requestsysupmycollectalluprequestDataWithparameters];
//            [self requestsysupmycollectstatusrequestDataWithparametersType:type];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];


}

/**点赞状态*/
- (void)requestsysupmycollectstatusrequestDataWithparametersType:(NSString*)type{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
    para[@"upId"] = self.idx;
      para[@"type"] = type; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LearningCenterRequest sysupmycollectstatusrequestDataWithparameters:para success:^(id  _Nonnull result) {

//        if ([result[@"data"] boolValue] == YES) {
//            self.dianzanStatus = 1;
//        }else{
//            self.dianzanStatus = 0;
//        }
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        self.collectionButton.userInteractionEnabled = YES;

    }];


}
/**点赞数量*/
- (void)requestsysupmycollectalluprequestDataWithparameters{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = self.idx;
      para[@"type"] = @"1"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LearningCenterRequest sysupmycollectalluprequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.dianzanNum = [result[@"data"] intValue];
//        [self.myTableView reloadData];
//        self.giveaLikeButton.userInteractionEnabled = YES;
//

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
