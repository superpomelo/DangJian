//
//  StudyingHistoryViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "StudyingHistoryViewController.h"
#import "FirstStudyingHistoryTableViewCell.h"
#import "SecondStudyingHistoryTableViewCell.h"

@interface StudyingHistoryViewController ()<UITableViewDelegate,UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
/**课程 */
@property (weak, nonatomic) IBOutlet UIButton *courseButton;

/**文章*/
@property (weak, nonatomic) IBOutlet UIButton *articleButton;
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;
@end

@implementation StudyingHistoryViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
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
    self.courseButton.selected = YES;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstStudyingHistoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstStudyingHistoryTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondStudyingHistoryTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondStudyingHistoryTableViewCellID"];
   
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 70;
            break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 2;
            break;

        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        FirstStudyingHistoryTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstStudyingHistoryTableViewCellID"];
         return cell;


    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**课程*/
- (IBAction)courseButtonAction:(UIButton*)sender {
    sender.selected = YES;
    
    self.articleButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
    
}

/**文章*/
- (IBAction)articleButtonAction:(UIButton*)sender {
    sender.selected = YES;
   
    self.courseButton.selected = NO;
    [UIView animateWithDuration:0.3 animations:^{
        self.lineLabel.center = CGPointMake(sender.center.x, self.lineLabel.center.y);
    }];
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
