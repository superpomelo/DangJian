//
//  DQVRWKViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "DQVRWKViewController.h"
#import <WebKit/WebKit.h>

@interface DQVRWKViewController ()<WKNavigationDelegate,WKUIDelegate>
{
    WKWebView *_wk;
}
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *topConstraint;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *vrBottomView;

@end

@implementation DQVRWKViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([IsIphoneX isIphoneX]==NO) {
        self.topConstraint.constant = -20.0f;
    }else{
        self.topConstraint.constant = -44.0f;

    }
    //初始化
    _wk = [[WKWebView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, SCR_H)];
    _wk.UIDelegate = self;
    _wk.navigationDelegate = self;
    if (@available(iOS 11.0, *)) {
        _wk.scrollView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;
    }
    self.navigationController.navigationBar.translucent = NO;

    [self.vrBottomView addSubview:_wk];
    [self loadData];
//    self.backButton.hidden = YES;
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.backButton.hidden = !self.backButton.hidden;
}
- (void)loadData{
    NSURL *url = [NSURL URLWithString:self.urlstring];
    NSURLRequest *request = [NSURLRequest requestWithURL:url];
    [_wk loadRequest:request];
}

- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
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
