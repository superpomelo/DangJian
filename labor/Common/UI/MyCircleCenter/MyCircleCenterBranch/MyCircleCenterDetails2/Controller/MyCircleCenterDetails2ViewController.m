//
//  MyCircleCenterDetails2ViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  劳动圈-视频详情

#import "MyCircleCenterDetails2ViewController.h"
#import "FirstMyCircleCenterDetails2TableViewCell.h"
#import "SecondMyCircleCenterDetails2TableViewCell.h"
#import "ThirdMyCircleCenterDetails2TableViewCell.h"
#import "FourthMyCircleCenterDetails2TableViewCell.h"
#import "JLTextView.h"
#import <IQKeyboardManager.h>
@interface MyCircleCenterDetails2ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextViewDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *backButtonBottomView;
@property (weak, nonatomic) IBOutlet UIButton *backButton;
@property (weak, nonatomic) IBOutlet UIView *TFBottomView;
@property (weak, nonatomic) JLTextView *textView;
@property (weak, nonatomic) UIView *commentContentView;
@end

@implementation MyCircleCenterDetails2ViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    
    [self addKeyBoardObservers];
    [self initmyTableView];
    [self initUI];

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
    
    NSString *comment = _textView.text;
 
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
    self.TFBottomView.layer.cornerRadius = self.TFBottomView.bounds.size.height/2;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    self.myTableView.rowHeight = UITableViewAutomaticDimension;
    self.myTableView.estimatedRowHeight = 250.0;

    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstMyCircleCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstMyCircleCenterDetails2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondMyCircleCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondMyCircleCenterDetails2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdMyCircleCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdMyCircleCenterDetails2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FourthMyCircleCenterDetails2TableViewCell" bundle:nil] forCellReuseIdentifier:@"FourthMyCircleCenterDetails2TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"FivethMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"FivethMyCircleCenterDetails1TableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SixthMyCircleCenterDetails1TableViewCell" bundle:nil] forCellReuseIdentifier:@"SixthMyCircleCenterDetails1TableViewCellID"];
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
            return 1;
                break;
     
      
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstMyCircleCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstMyCircleCenterDetails2TableViewCellID"];
        return cell;
    }else if (indexPath.section == 1) {
        SecondMyCircleCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondMyCircleCenterDetails2TableViewCellID"];
        return cell;
    }else if (indexPath.section == 2) {
        ThirdMyCircleCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdMyCircleCenterDetails2TableViewCellID"];
        return cell;
    }else{
        
        FourthMyCircleCenterDetails2TableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FourthMyCircleCenterDetails2TableViewCellID"];

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
//MARK: - Utility - 多用途(功能)方法
//MARK: - Network request - 网络请求
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
