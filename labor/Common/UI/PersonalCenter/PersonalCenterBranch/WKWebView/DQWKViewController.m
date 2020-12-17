//
//  DQWKViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/21.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "DQWKViewController.h"
#import <WebKit/WebKit.h>
#import "LoginRequestDatas.h"

@interface DQWKViewController ()<WKNavigationDelegate,WKUIDelegate>
{
    WKWebView *_wk;
}
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *BOTTOMview;

@end

@implementation DQWKViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self requestxieyi];
    //加入代码
    self.navigationController.navigationBar.translucent = NO;
    //初始化


//    meta.setAttribute('content', 'width=device-width');
    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta); var imgs = document.getElementsByTagName('img');for (var i in imgs){imgs[i].style.maxWidth='100%';imgs[i].style.height='auto';}";


    //以下代码适配大小
//    NSString *jScript = @"var meta = document.createElement('meta'); meta.setAttribute('name', 'viewport'); meta.setAttribute('content', 'width=device-width'); document.getElementsByTagName('head')[0].appendChild(meta);";

    WKUserScript *wkUScript = [[WKUserScript alloc] initWithSource:jScript injectionTime:WKUserScriptInjectionTimeAtDocumentEnd forMainFrameOnly:YES];
    WKUserContentController *wkUController = [[WKUserContentController alloc] init];
    [wkUController addUserScript:wkUScript];

    WKWebViewConfiguration *wkWebConfig = [[WKWebViewConfiguration alloc] init];
    wkWebConfig.userContentController = wkUController;
    
//    _wk = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, self.bottomView.bounds.size.height)];
    _wk = [[WKWebView alloc] initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H-64) configuration:wkWebConfig];
//    [self.view addSubview:titles];
    [self.bottomView addSubview:_wk];

//    [titles loadHTMLString:@"HTML" baseURL:[NSURL URLWithString:self.urlstring]];
    
//    _wk = [[WKWebView alloc]initWithFrame:self.BOTTOMview.bounds];
//    _wk.UIDelegate = self;
//    _wk.navigationDelegate = self;
//    [self.bottomView addSubview:_wk];
    [self loadData];
//    self.backButton.hidden = YES;
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    self.backButton.hidden = !self.backButton.hidden;
}
- (void)loadData{
    NSURL *url = [NSURL URLWithString:self.urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_wk loadRequest:request];
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**用户协议*/
- (void)requestxieyi{
    [LoginRequestDatas yonghuxieyirequestDataWithparameters:nil success:^(id  _Nonnull result) {
        
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
