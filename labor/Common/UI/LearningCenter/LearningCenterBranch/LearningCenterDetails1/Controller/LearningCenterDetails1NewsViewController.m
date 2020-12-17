//
//  LearningCenterDetails1NewsViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/4.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "LearningCenterDetails1NewsViewController.h"
#import "FirstLearningCenterDetails1NewsTableViewCell.h"
#import "ThirdLearningCenterDetails1TableViewCell.h"
#import "ZeropinlunTableViewCell.h"
#import "LaborCenterRequestDatas.h"
#import "LearningCenterRequest.h"
#import "JLTextView.h"
#import <IQKeyboardManager.h>
#import "NoNetWorkView.h"
#import "LearningCenterDetailsModel.h"
#import "MyTimeInterval.h"
#import "UserInfoManager.h"
#import <WebKit/WebKit.h>
#import "FivethLearningCenterDetails1TableViewCell.h"
#import "SixLearningCenterDetails1TableViewCell.h"
#import "LearningCenterDetailsModel.h"
#import "SecondLearningCenterDetails1NewsTableViewCell.h"
#import "GetCommentVoListModel.h"

@interface LearningCenterDetails1NewsViewController ()<UITableViewDelegate,UITableViewDataSource,NoNetWorkViewDelegate,WKNavigationDelegate,WKUIDelegate,ThirdLearningCenterDetails1TableViewCellDelegate,SecondLearningCenterDetails1NewsTableViewCellDelegate>
{
    CGFloat webContentHeight;
}

@property (weak, nonatomic) IBOutlet UITableView *myTableView;
/**收藏button*/
@property (weak, nonatomic) IBOutlet UIButton *collectionButton;
@property (weak, nonatomic) IBOutlet UIView *TextViewBottomView;
@property (nonatomic, strong) WKWebView *wk;

@property (weak, nonatomic) JLTextView *textView;
@property (weak, nonatomic) UIView *commentContentView;
/**评论列表*/
@property (nonatomic,strong)NSArray *CommentVoListArray;
/**无网络*/
@property(nonatomic, strong)NoNetWorkView *nonetView;
/**新闻标题*/
@property (nonatomic, strong) NSString *titles;
/**来源*/
@property (nonatomic, strong) NSString *laiyuanstr;
/**时间*/
@property (nonatomic, strong) NSString *timestr;
/**阅读数量*/
@property (nonatomic, assign) int selectNum;
/**点赞数量*/
@property (nonatomic, assign) int dianzanNum;
/**点赞状态*/
@property (nonatomic, assign) int dianzanStatus;

@property (nonatomic, strong) NSString *body;
@property (nonatomic, assign) CGFloat wkheight;
@property (nonatomic, assign) int temp;
@property (nonatomic, strong) LearningCenterDetailsModel *model;
@property (weak, nonatomic) IBOutlet UIView *pinlunNumBottomView;
/**评论数量*/
@property (weak, nonatomic) IBOutlet UILabel *pinlunNumberLabel;
@end

@implementation LearningCenterDetails1NewsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initmyTableView];
    self.temp = 0;
    self.dianzanStatus = 0;

    //加入代码
//    self.navigationController.navigationBar.translucent = NO;
    self.wkheight = 1;
    self.myTableView.hidden = YES;

    self.pinlunNumBottomView.layer.cornerRadius = 14/2;
    [self addKeyBoardObservers];

    [self requestmobileIndexinformationDetails];
    [self requestmobileIndexgetCommentVoList];
    [self requestsyscollectmycollectstatus];
    [self requestsysupmycollectstatusrequestDataWithparametersType:@"1"];
    [self requestsysintegralsaveIntegralFORMOV];
    [self requestsysupmycollectalluprequestDataWithparameters];
    self.fd_prefersNavigationBarHidden = YES;

    if ([[UserInfoManager getAFNetworkReachabilityStatus] isEqualToString:@"viaWWAN"]||[[UserInfoManager getAFNetworkReachabilityStatus] isEqualToString:@"viaWiFi"]) {
     //有网络
    }else{
       //无网络
        [self.view addSubview:self.nonetView];
        self.nonetView.hidden = NO;
    }
}




//MARK: - Life Cycle - 生命周期
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    // [IQKeyboardManager sharedManager].enable = NO;
//    [_wk.configuration.userContentController addScriptMessageHandler:self name:@"onError"];


    [IQKeyboardManager sharedManager].enableAutoToolbar = NO; // 控制是否显示键盘上的工具条
}


- (void)viewWillDisappear:(BOOL)animated {
 [super viewWillDisappear:animated];
// [IQKeyboardManager sharedManager].enable = YES;
//    _wk.UIDelegate = nil;
//    _wk.navigationDelegate = nil;
//    [_wk.configuration.userContentController removeScriptMessageHandlerForName:@"onError"];
    [IQKeyboardManager sharedManager].enableAutoToolbar = YES; // 控制是否显示键盘上的工具条

 }

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    
    [_textView resignFirstResponder];
}
//MARK: - Initalization - 初始化

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

- (WKWebView *)wk{
    if (!_wk) {
            NSMutableString *jScript = [[NSMutableString alloc]initWithString:@"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';}"];



            WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
            WKUserContentController *wkUController = [[WKUserContentController alloc] init];
            [wkUController addUserScript:wkUScript];

            WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
            wkWebConfig.userContentController = wkUController;
        _wk = [[WKWebView alloc] initWithFrame:CGRectMake(10, 0, SCR_W-20, self.wkheight) configuration:wkWebConfig];
        _wk.UIDelegate = self;
        _wk.navigationDelegate = self;
        _wk.scrollView.scrollEnabled = NO;//设置webview不可滚动，让tableview本身滚动即可
        [_wk loadHTMLString:self.body baseURL:nil];

    }
    return _wk;
}


#pragma mark  - KVO回调
-(void)observeValueForKeyPath:(NSString *)keyPath ofObject:(id)object change:(NSDictionary<NSKeyValueChangeKey,id> *)change context:(void *)context{
    
    //更具内容的高重置webView视图的高度
//    CGFloat newHeight = self.wk.scrollView.contentSize.height;
    NSLog(@"999");
    if (_wk != nil && _wk.scrollView != nil) {
        [self resetWebViewFrameWithHeight:self.wk.scrollView.contentSize.height];

    }
}
// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
        NSString *fileUrl = [[NSBundle mainBundle] pathForResource:@"SOURCEHANSERIFCN-MEDIUM" ofType:@"OTF"];
        NSData *fileData = [NSData dataWithContentsOfFile:fileUrl];
        NSString *boldFont = [fileData base64EncodedStringWithOptions:0];
        NSMutableString *javascript = [NSMutableString string];
        [javascript appendString:[NSString stringWithFormat:@"\
                                      var boldcss = '@font-face { font-family: \"%@\"; src: url(data:font/ttf;base64,%@) format(\"truetype\");} *{font-family: \"%@\" !important;}'; \
                                      var head = document.getElementsByTagName('head')[0], \
                                      style = document.createElement('style'); \
                                      style.type = 'text/css'; \
                                      style.innerHTML = boldcss; \
                                      head.appendChild(style);",@"SOURCEHANSERIFCN",boldFont,@"SOURCEHANSERIFCN"]];
    [webView evaluateJavaScript:javascript completionHandler:nil];

    
    //这个方法也可以计算出webView滚动视图滚动的高度
    [webView evaluateJavaScript:@"document.body.scrollWidth"completionHandler:^(id _Nullable result,NSError * _Nullable error){

        NSLog(@"scrollWidth高度：%.2f",[result floatValue]);
        CGFloat ratio =  CGRectGetWidth(webView.frame) /[result floatValue];

    [webView evaluateJavaScript:@"document.body.scrollHeight"completionHandler:^(id _Nullable result,NSError * _Nullable error){
            NSLog(@"scrollHeight高度：%.2f",[result floatValue]);
            NSLog(@"scrollHeight计算高度：%.2f",[result floatValue]*ratio);
            CGFloat newHeight = [result floatValue]*ratio;
        self.wkheight = newHeight;
//        self.wk.frame = CGRectMake(0, 0, SCR_W, newHeight);
        if (self.temp ==0) {
            //如果webView此时还不是满屏，就需要监听webView的变化  添加监听来动态监听内容视图的滚动区域大小
            [self.wk.scrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
            
            [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
            dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(0.2 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
                self.myTableView.hidden = NO;

            });
        }
        self.temp = 1;

        }];

    }];
}

-(void)resetWebViewFrameWithHeight:(CGFloat)height{
    /**去掉这个if 是因为KVO 监听的时候有时候网页会由原来的大值变小值 额**/
//    if (CGRectGetHeight(self.wkWebView.frame) == CGRectGetHeight(self.view.frame)) {
//        //如果高度已经达到最高，那么就不用设置，只有记录一下
//        webContentHeight = height;
//    }else{
        //如果是新高度，那就重置
        if (height != webContentHeight) {
            self.wkheight = height;
            

//            if(height >= CGRectGetHeight(self.view.frame)){
//
//                [self.wk setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), CGRectGetHeight(self.view.frame))];
//            }else{
//                [self.wk setFrame:CGRectMake(0, 0, CGRectGetWidth(self.view.frame), height)];
//            }
          [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:2] withRowAnimation:UITableViewRowAnimationNone];
            webContentHeight = height;
        }
    NSLog(@"10000");
//    }
}
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
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
//    self.myTableView.estimatedRowHeight = 150.0;

    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstLearningCenterDetails1NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstLearningCenterDetails1NewsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdLearningCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdLearningCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ZeropinlunTableViewCell" bundle:nil] forCellReuseIdentifier:@"ZeropinlunTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FivethLearningCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethLearningCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SixLearningCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"SixLearningCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondLearningCenterDetails1NewsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondLearningCenterDetails1NewsTableViewCellID"];
    
    
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0.000001)];
    self.myTableView.tableHeaderView = vi;
    
}


- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    
        return UITableViewAutomaticDimension;

    
}


- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 5;
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
            return 0;
            break;
        case 3:
            return 1;
            break;
        case 4:
            if (self.CommentVoListArray.count==0){
                return 1;
                break;

            }else{
                return  self.CommentVoListArray.count;
                break;

            }
        default:
            break;
    }
    return 0;
}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        return self.wkheight;
    }
    if (section == 4) {
        return 45;
    }else{
        return 0;
    }
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 2) {
        if (self.body!= nil) {
            UIView *viwk = [[UIView alloc]initWithFrame:CGRectMake(15, 0, SCR_W-30, self.wkheight)];
            viwk.backgroundColor = [UIColor whiteColor];
//            [self.wk mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.height.mas_equalTo(self.wkheight);
//                make.width.mas_equalTo(SCR_W-20);
//
//            }];
//           self.wk.frame = CGRectMake(0, 0, SCR_W, self.wkheight);
            self.wk.frame = CGRectMake(10, 0, SCR_W-20, self.wkheight);

            [viwk addSubview:self.wk];
//            [self.wk mas_updateConstraints:^(MASConstraintMaker *make) {
//                make.left.mas_equalTo(10);
//                make.height.mas_equalTo(self.wkheight);
//                make.width.mas_equalTo(SCR_W-20);
//
//            }];
            return viwk;
        }
    }
    if (section == 4) {
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

            FivethLearningCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FivethLearningCenterDetails1TableViewCellID"];
        if (self.titles != nil) {
            [cell reloadData:self.titles];

        }
            return cell;
  

    }else if(indexPath.section == 1){
        
        SixLearningCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SixLearningCenterDetails1TableViewCellID"];
        if (self.laiyuanstr != nil) {
            cell.laiyuanLabel.text = self.laiyuanstr;

        }
        if (self.timestr != nil) {
            cell.timeLabel.text = [MyTimeInterval IntervalStringToIneedDateString:self.timestr type:@"YYYY-MM-dd"];

        }
        return cell;
    }else if (indexPath.section == 2) {

        FirstLearningCenterDetails1NewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstLearningCenterDetails1NewsTableViewCellID"];

            return cell;
  

    }else if (indexPath.section == 3){
        SecondLearningCenterDetails1NewsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondLearningCenterDetails1NewsTableViewCellID"];
        cell.delegate = self;
        [cell reloadData:self.selectNum];
        [cell reloadData2:self.dianzanNum];
        [cell reloadData3:self.dianzanStatus];
            return cell;
    }else{
        if (self.CommentVoListArray.count==0){
            //评论
            ZeropinlunTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ZeropinlunTableViewCellID"];
            
            return cell;

        }else{
            //评论
           ThirdLearningCenterDetails1TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdLearningCenterDetails1TableViewCellID"];
            cell.delegate = self;
            cell.indexpath = indexPath;
            [cell reloadData:self.CommentVoListArray[indexPath.row]];
            return cell;

        }

    }
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
  
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
/**无网络下返回*/
- (void)NoNetWorkViewBackButtonActiondelegate:(NoNetWorkView*)view{
    [self.navigationController popViewControllerAnimated:YES];
}
/**再试一下*/
- (void)NoNetWorkViewAgainButtonActiondelegate:(NoNetWorkView*)view{
    [self requestmobileIndexinformationDetails];
    [self requestmobileIndexgetCommentVoList];
    [self requestsyscollectmycollectstatus];
    [self requestsysupmycollectstatusrequestDataWithparametersType:@"1"];
    [self requestsysintegralsaveIntegralFORMOV];
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
/**点赞*/
- (IBAction)giveaLikeButtonAction:(UIButton*)sender {
    sender.selected = !sender.selected;
//    if (sender.selected == YES) {
//        [self requestsysuprequest];
//    }else{
//        [self requestsysupmycollectdele];
//    }
}
/**改变到评论区偏移量*/
- (IBAction)tiaozhuandaopinlunButton:(id)sender {
    NSIndexPath * dayOne = [NSIndexPath indexPathForRow:0 inSection:4];
   [self.myTableView scrollToRowAtIndexPath:dayOne atScrollPosition:UITableViewScrollPositionTop animated:YES];
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
- (NSString*)H5stringstyle:(NSString*)style font:(NSString*)font body:(NSString*)body{
    NSString *s1 = @"<!DOCTYPE html>";
    NSString *s2 = @"<html>";
    NSString *s3 = @"<head>";
    NSString *s4 = @"<style>";
    NSString *s5 = [NSString stringWithFormat:@"@font-face {font-family: %@;src: url('%@');}",style,s2];
    NSString *s6 = [NSString stringWithFormat:@"* {font-family: '%@' !important;* {font-size: 1rem !important;}}",style];
    NSString *s7 = @"</style>";
    NSString *s8 = @"</head>";
    NSString *s9 = @"</body>";
    NSString *s10 = @"</html>";

    
    return [NSString stringWithFormat:@"%@%@%@%@%@%@%@%@%@%@",s1,s2,s3,s4,s5,s6,s7,s8,s9,s10];
  
}
/**评论点赞*/
- (void)ThirdLearningCenterDetails1TableViewCellButtonActiondelegate:(ThirdLearningCenterDetails1TableViewCell*)cell button:(UIButton*)sender index:(NSIndexPath*)indexpath{
    GetCommentVoListModel *model = self.CommentVoListArray[indexpath.row];
//    if (model.type == 0) {
//        [self requestsysuprequestType:@"5"];
//    }else{
//        [self requestsysupmycollectdeleType:@"5"];
//    }
    
    if (model.type == 0) {
        [self  requestsysuprequestupId:[NSString stringWithFormat:@"%d",model.idx] Type:@"5"];
    
    }else{
        [self requestsysupmycollectdeleupId:[NSString stringWithFormat:@"%d",model.idx] Type:@"5"];
    }
}
/**新闻点赞*/
- (void)SecondLearningCenterDetails1NewsTableViewCellButtonActiondelegate:(SecondLearningCenterDetails1NewsTableViewCell*)cell button:(UIButton*)sender{
    if (self.dianzanStatus == 0) {
        [self  requestsysuprequestupId:[NSString stringWithFormat:@"%ld",(long)self.informationId] Type:@"1"];
    
    }else{
        [self requestsysupmycollectdeleupId:[NSString stringWithFormat:@"%ld",(long)self.informationId] Type:@"1"];
    }
    
}

- (void)dealloc{
    NSLog(@"移除观察者");
    [self.wk.scrollView removeObserver:self forKeyPath:@"contentSize"];

}
//MARK: - Network request - 网络请求
/**新闻详情*/
- (void)requestmobileIndexinformationDetails{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"informationId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];

    [LearningCenterRequest mobileIndexinformationDetailsrequestDataWithparameters:para success:^(id  _Nonnull result) {
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;

//        self.dataArray = [LearningCenterDetailsModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"list"]]; //数组;
        NSDictionary *dict1 = dict[@"data"];

        if ([dict1.allKeys containsObject:@"informationVo"]) {
            NSDictionary *dict2 = dict1[@"informationVo"];
            if ([dict2.allKeys containsObject:@"body"]) {
//                [self loadData:dict2[@"body"]];
                self.body = dict2[@"body"];
            }
            if ([dict2.allKeys containsObject:@"title"]) {
                self.titles = dict2[@"title"];
            }
            if ([dict2.allKeys containsObject:@"source"]) {
                self.laiyuanstr = dict2[@"source"];
            }
            if ([dict2.allKeys containsObject:@"createTime"]) {
                self.timestr = dict2[@"createTime"];
            }
            if ([dict2.allKeys containsObject:@"selectNum"]) {
                self.selectNum = [dict2[@"selectNum"] intValue];
            }
        }
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**评论列表*/
- (void)requestmobileIndexgetCommentVoList{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"informationId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];

    [LearningCenterRequest mobileIndexgetCommentVoListrequestDataWithparameters:para success:^(id  _Nonnull result) {
        NSDictionary *dict = [NSDictionary dictionary];
        dict = result;
        self.CommentVoListArray =  [GetCommentVoListModel mj_objectArrayWithKeyValuesArray:dict[@"data"][@"records"]]; //数组
        self.pinlunNumberLabel.text = [NSString stringWithFormat:@"%@",dict[@"data"][@"total"] ];
//        self.CommentVoListArray = result;
        [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:4] withRowAnimation:UITableViewRowAnimationNone];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**提交评论*/
- (void)requestmobileIndexsubmitComment{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];

    para[@"body"] = _textView.text;
    para[@"informationId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];

    [LearningCenterRequest mobileIndexsubmitCommentrequestDataWithparameters:para success:^(id  _Nonnull result) {
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
    para[@"collectId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];
    para[@"type"] = @"1"; //收藏类型1：新闻 2：课时 3：活动 4：新闻评论
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
    para[@"collectId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];
    para[@"type"] = @"1"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LaborCenterRequestDatas syscollectmycollectdelerequestDataWithparameters:para success:^(id  _Nonnull result) {
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**收藏状态*/
- (void)requestsyscollectmycollectstatus{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];
    para[@"type"] = @"1"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈

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
- (void)requestsysuprequestupId:(NSString*)upId Type:(NSString*)type{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
    
        para[@"upId"] = upId;

    
    
      para[@"type"] = type; //收藏类型1：新闻 2：课时 3：活动 4：新闻评论点赞
    [LearningCenterRequest sysuprequestDataWithparameters:para success:^(id  _Nonnull result) {
 
        if ([type isEqualToString:@"5"]) {
            [self  requestmobileIndexgetCommentVoList];
        }else{
            [self requestsysupmycollectalluprequestDataWithparameters];
            [self requestsysupmycollectstatusrequestDataWithparametersType:type];
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

        if ([type isEqualToString:@"5"]) {
            [self  requestmobileIndexgetCommentVoList];
        }else{
            [self requestsysupmycollectalluprequestDataWithparameters];
            [self requestsysupmycollectstatusrequestDataWithparametersType:type];
        }
    } failure:^(NSError * _Nonnull error) {
        
    }];


}
/**点赞状态*/
- (void)requestsysupmycollectstatusrequestDataWithparametersType:(NSString*)type{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
    para[@"upId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];
      para[@"type"] = type; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LearningCenterRequest sysupmycollectstatusrequestDataWithparameters:para success:^(id  _Nonnull result) {
//        self.giveaLikeButton.userInteractionEnabled = YES;

        if ([result[@"data"] boolValue] == YES) {
            self.dianzanStatus = 1;
        }else{
            self.dianzanStatus = 0;
        }
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        self.collectionButton.userInteractionEnabled = YES;

    }];


}
/**点赞数量*/
- (void)requestsysupmycollectalluprequestDataWithparameters{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
      //收藏id，有课时id用课时id，没有用课程id
    para[@"collectId"] = [NSString stringWithFormat:@"%ld",(long)self.informationId];
      para[@"type"] = @"1"; //收藏类型1：新闻 2：课时 3：活动 4：劳动圈
    [LearningCenterRequest sysupmycollectalluprequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.dianzanNum = [result[@"data"] intValue];
        [self.myTableView reloadData];
//        self.giveaLikeButton.userInteractionEnabled = YES;
//

    } failure:^(NSError * _Nonnull error) {
        self.collectionButton.userInteractionEnabled = YES;

    }];


}
/**加积分*/
- (void)requestsysintegralsaveIntegralFORMOV{
    //type：0-课时 1-签到 2-新闻 3-活动-4-劳动圈
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"type"] = @"2";
    para[@"forId"] = [NSString stringWithFormat:@"%ld",self.informationId];
    [LearningCenterRequest sysintegralsaveIntegralFORMOVrequestDataWithparameters:para success:^(id  _Nonnull result) {
        
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
