//
//  DangYuanXiangQinDetailsViewController.m
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "DangYuanXiangQinDetailsViewController.h"
#import "FirstDangYuanXiangQinDetailsTableViewCell.h"
#import "MyCircleCenterRequestDatas.h"
#import "SecondDangYuanXiangQinDetailsTableViewCell.h"
#import <WebKit/WebKit.h>

@interface DangYuanXiangQinDetailsViewController ()<UITableViewDelegate,UITableViewDataSource,WKNavigationDelegate,WKUIDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (nonatomic, assign) CGFloat wkheight;
@property (nonatomic, strong) WKWebView *wk;
@property (nonatomic, assign) int temp;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;

@end

@implementation DangYuanXiangQinDetailsViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.wkheight = 1;
    self.temp = 0;
    [self initUI];
    [self initmyTableView];

    self.fd_prefersNavigationBarHidden = YES;
    

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
}


//MARK: - Initalization - 初始化
- (void)initUI{
    
    self.titlesLabel.attributedText = [UILabel getABTbody:@"党员介绍" font:18 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];

    
    if (self.model.type == 0) {
        //未投票
        self.toupiaoButton.userInteractionEnabled = YES;
        self.toupiaoButton.backgroundColor = kGreenColor;
        [self.toupiaoButton setAttributedTitle:[UIButton getABTbody:@"投票" font:16 color:[UIColor whiteColor] zitistyle:@"Source Han Serif CN"] forState:UIControlStateNormal];
//        [self.toupiaoButton setTitle:@"投票" forState:UIControlStateNormal];
    }else{
        self.toupiaoButton.userInteractionEnabled = NO;
        self.toupiaoButton.backgroundColor = [UIColor lightGrayColor];
        [self.toupiaoButton setAttributedTitle:[UIButton getABTbody:@"已投票" font:16 color:[UIColor whiteColor] zitistyle:@"Source Han Serif CN"] forState:UIControlStateNormal];
//        [self.toupiaoButton setTitle:@"已投票" forState:UIControlStateNormal];

    }
    self.toupiaoButton.layer.cornerRadius = 2;
}

-(WKWebView *)wk{
    if (!_wk) {
            NSMutableString *jScript = [[NSMutableString alloc]initWithString:@"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';}"];
//    [jScript appendString:[NSString stringWithFormat:@"<span style=\"font-family: %@/span>",
//                           @"SourceHanSerifCN-Medium"]];
//   NSString *htmlString = [NSString stringWithFormat:@"<span style=\"font-family: %@; font-size: %i\">%@</span>",
//                                                @"SourceHanSerifCN-Medium",
//                                                14,
//                                                htmlString];
//        [jScript appendString:htmlString];

            //以下代码适配大小


            WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
            WKUserContentController *wkUController = [[WKUserContentController alloc] init];
            [wkUController addUserScript:wkUScript];

            WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
            wkWebConfig.userContentController = wkUController;
//        _wk = [[WKWebView alloc]init];
//        _wk.configuration = wkWebConfig;
        //    _wk = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, self.bottomView.bounds.size.height)];
        _wk = [[WKWebView alloc] initWithFrame:CGRectMake(10, 0, SCR_W-20, self.wkheight) configuration:wkWebConfig];
        //    [self.view addSubview:titles];
//            [cell.bottomView addSubview:self.wk];
        _wk.UIDelegate = self;
        _wk.navigationDelegate = self;
        _wk.scrollView.scrollEnabled = NO;//设置webview不可滚动，让tableview本身滚动即可
        [_wk loadHTMLString:self.model.resume baseURL:nil];

    }
    return _wk;
}

// 页面加载完成之后调用
- (void)webView:(WKWebView *)webView didFinishNavigation:(WKNavigation *)navigation{
    NSLog(@"加载完成");
    // 设置字体
//    NSString *fontFamilyStr = @"document.getElementsByTagName('body')[0].style.fontFamily='Arial';";
//    NSString *fontFamilyStr = @"document.getElementsByTagName('body')[0].style.font='SourceHanSerifCN-Medium';";
//    [webView evaluateJavaScript:fontFamilyStr completionHandler:nil];

    // 设置字体
    NSString *fontFamilyStr = @"document.getElementsByTagName('span')[0].style.fontFamily='Source Han Serif CN';";
    [webView evaluateJavaScript:fontFamilyStr completionHandler:nil];
    //设置颜色
//    [ webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextFillColor= '#9098b8'" completionHandler:nil];
    //修改字体大小
    [webView evaluateJavaScript:@"document.getElementsByTagName('body')[0].style.webkitTextSizeAdjust= '100%'"completionHandler:nil];

  
    
    
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
//            [self.myTableView reloadData];
            [self.myTableView reloadSections:[NSIndexSet indexSetWithIndex:1] withRowAnimation:UITableViewRowAnimationLeft];
        }
        self.temp = 1;

//        NSIndexPath *indexPath =[NSIndexPath indexPathForRow:0 inSection:2];
//
//        [self.myTableView reloadRowsAtIndexPaths:@[indexPath]withRowAnimation:UITableViewRowAnimationNone];


//            [self resetWebViewFrameWithHeight:newHeight];
//
//            //KVO监听网页内容高度变化
//            if (newHeight < CGRectGetHeight(self.view.frame)) {
//                //如果webView此时还不是满屏，就需要监听webView的变化  添加监听来动态监听内容视图的滚动区域大小
//                [self.wbScrollView addObserver:self forKeyPath:@"contentSize" options:NSKeyValueObservingOptionNew context:nil];
//            }
        }];
        
    }];
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstDangYuanXiangQinDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstDangYuanXiangQinDetailsTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondDangYuanXiangQinDetailsTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondDangYuanXiangQinDetailsTableViewCellID"];
  
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return UITableViewAutomaticDimension;

}
//- (CGFloat)tableView:(UITableView *)tableView estimatedHeightForRowAtIndexPath:(NSIndexPath *)indexPath{
//    if (indexPath.section==0) {
//        return 50;
//    }else if(indexPath.section == 1) {
//        return 25;
//    }else if(indexPath.section == 2) {
//        //
//        NSLog(@"%f",self.wkheight);
//        return self.wkheight;
//    }else{
//        return 95;
//    }
//}
-(CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        return self.wkheight;
    }
   
        return 0;
    
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    if (section == 1) {
        if (self.model.resume!= nil) {
            UIView *viwk = [[UIView alloc]initWithFrame:CGRectMake(15, 0, SCR_W-30, self.wkheight)];
            viwk.backgroundColor = [UIColor whiteColor];
           self.wk.frame = CGRectMake(10, 0, SCR_W-20, self.wkheight);
           

           [self.wk loadHTMLString:self.model.resume baseURL:nil];
            [viwk addSubview:self.wk];
            return viwk;
        }
    }else{
        UIView *viwk = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 0, 0)];
        return viwk;
    }
    return nil;
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section==0) {
        FirstDangYuanXiangQinDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstDangYuanXiangQinDetailsTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];

        }
             return cell;
    }else{
        SecondDangYuanXiangQinDetailsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondDangYuanXiangQinDetailsTableViewCellID"];
        if (self.model != nil) {
            [cell reloadData:self.model];

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
/**投票*/
- (IBAction)subMitbuttonAction:(id)sender {
    [self requestactivityvotinggetVotingDetails];
}


//MARK: - Utility - 多用途(功能)方法
/**投票*/
- (void)requestactivityvotinggetVotingDetails{
     NSMutableDictionary *para = [NSMutableDictionary dictionary];
     para[@"votingId"] = self.votingId;

     para[@"votingQuestionIds"] = [NSString stringWithFormat:@"%d",self.model.idx];

    [MyCircleCenterRequestDatas activityvotinggetOnVotingformovrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.toupiaoButton.userInteractionEnabled = NO;
        self.toupiaoButton.backgroundColor = [UIColor lightGrayColor];
//        [self.toupiaoButton setTitle:@"已投票" forState:UIControlStateNormal];
        [self.toupiaoButton setAttributedTitle:[UIButton getABTbody:@"已投票" font:16 color:[UIColor whiteColor] zitistyle:@"Source Han Serif CN"] forState:UIControlStateNormal];
//        self.model = result;
//        self.VotingQuestionVosarray =  [VotingQuestionVosModel mj_objectArrayWithKeyValuesArray:self.model.votingQuestionVos]; //数组
        [self.myTableView reloadData];
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
    } failure:^(NSError * _Nonnull error) {
        //手动结束刷新状态
        [self.myTableView.mj_header endRefreshing];
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
