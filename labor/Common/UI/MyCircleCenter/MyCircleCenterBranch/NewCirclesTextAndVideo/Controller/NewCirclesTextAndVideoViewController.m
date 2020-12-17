//
//  NewCirclesTextAndVideoViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  新增视频圈子

#import "NewCirclesTextAndVideoViewController.h"
#import "FirstNewCirclesTextAndVideoTableViewCell.h"
#import "SecondNewCirclesTextAndVideoTableViewCell.h"
#import "MyFileRequestDatas.h"
#import "MyCircleCenterRequestDatas.h"
#import "PlayVideoViewController.h"
#import "FirstFrameOfTheVideo.h"
#import "LearningCenterRequest.h"

@interface NewCirclesTextAndVideoViewController ()<UITableViewDelegate,UITableViewDataSource,FirstNewCirclesTextAndVideoTableViewCellDelegate,SecondNewCirclesTextAndVideoTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
/**发布*/
@property (weak, nonatomic) IBOutlet UIButton *publishButton;
@property (nonatomic,strong)NSString *content;

@end

@implementation NewCirclesTextAndVideoViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;

}
//MARK: - Initalization - 初始化
- (void)initUI{
    self.publishButton.layer.cornerRadius = 30/2;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstNewCirclesTextAndVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstNewCirclesTextAndVideoTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondNewCirclesTextAndVideoTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondNewCirclesTextAndVideoTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 120;
            break;
        case 1:
            return 130;
                break;
            
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return 1;
            break;
        case 1:
                return 1;
                break;

        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstNewCirclesTextAndVideoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstNewCirclesTextAndVideoTableViewCellID"];
        cell.delegate = self;
         return cell;
    }else{
        SecondNewCirclesTextAndVideoTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondNewCirclesTextAndVideoTableViewCellID"];
        cell.delegate = self;
        if (self.state == NewCirclesStatePic) {
            [cell reloadDataImg:self.image];
            cell.playBottomView.hidden = YES;
        }else if (self.state == NewCirclesStateVideo) {
            [cell reloadDatavideo:self.videoPath];
            cell.playBottomView.hidden = NO;
        }
         return cell;
    }

    

}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件

- (IBAction)publishButtonAction:(id)sender {
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];

    if (self.state == NewCirclesStatePic) {
        //图片在这里压缩一下
        NSData *imageData = UIImageJPEGRepresentation(self.image, 0.5f);
    //    NSString *stringBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]; // base64格式的字符串
       dict[@"file"] = imageData;
    }else if (self.state == NewCirclesStateVideo) {
        NSData *data = [NSData dataWithContentsOfURL:self.videoPath];
    //    NSString *stringBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]; // base64格式的字符串
       dict[@"file"] = data;

    }

    [self requestlessonupload:dict];
}

- (IBAction)backButtonAction:(id)sender {
    [self dismissViewControllerAnimated:YES completion:^{
        
    }];
}
//MARK: - Utility - 多用途(功能)方法
/**文本框代理*/
- (void)FirstNewCirclesTextAndVideoTableViewCellActiondelegate:(FirstNewCirclesTextAndVideoTableViewCell*)cell textview:(UITextView*)textView{
    self.content = textView.text;
}
/**点击视频代理*/
- (void)SecondNewCirclesTextAndVideoTableViewCellActiondelegate:(SecondNewCirclesTextAndVideoTableViewCell*)cell{
    PlayVideoViewController *PVvc = [[PlayVideoViewController alloc]init];
    PVvc.videoPath = self.videoPath;
    PVvc.modalPresentationStyle = UIModalPresentationFullScreen;

    [self presentViewController:PVvc animated:NO completion:^{
        
    }];
}
//MARK: - Network request - 网络请求
/**视频上传*/
- (void)requestlessonupload:(NSMutableDictionary*)dict{
    
    self.publishButton.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
    self.publishButton.userInteractionEnabled = NO;
    [MyFileRequestDatas lessonuploadrequestDataWithparameters:dict imageDatas:dict success:^(id  _Nonnull result) {
       self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
        self.publishButton.userInteractionEnabled = YES;
        NSLog(@"我是url=    %@",result);
//        if (self.picTAG > self.coverArrayM.count) {
//           [self.coverArrayM addObject:result];
//        }else{
//            [self.coverArrayM replaceObjectAtIndex:self.picTAG-1 withObject:result];
//        }
        //视频
        if (self.state == NewCirclesStateVideo){
            NSMutableDictionary *dict = [NSMutableDictionary dictionary];

     
            NSString *http;
            if ([result containsString:@"http"]) {
                http = @"";
                
            }else{
                http = [NSString stringWithFormat:@"%@",VideoHost];
        //        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

            }
            
            //图片在这里压缩一下
//            NSData *imageData = [NSData dataWithContentsOfURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,result]]];

            NSData *imageData = UIImageJPEGRepresentation([FirstFrameOfTheVideo firstFrameWithVideoURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,result]] size:CGSizeMake(345, 183)], 0.5f);
        //    NSString *stringBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]; // base64格式的字符串
           dict[@"file"] = imageData;
            if (imageData != nil) {
               
                [self requestlessonupload2:dict cover:result];

            }else{
                [SVProgressHUD showInfoWithStatus:@"服务器开小差了"];

                NSLog(@"我要崩溃了让开");
            }

        }else{
            [self requestmyzone:result titlepage:nil];

        }
    } failure:^(NSError * _Nonnull error) {
        self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
        self.publishButton.userInteractionEnabled = NO;
    }];
}
/**封面图上传*/
- (void)requestlessonupload2:(NSMutableDictionary*)dict cover:(NSString*)cover{
    
    self.publishButton.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
    self.publishButton.userInteractionEnabled = NO;
    [MyFileRequestDatas informationuploadImgrequestDataWithparameters:dict imageDatas:dict success:^(id  _Nonnull result) {
       self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
        self.publishButton.userInteractionEnabled = YES;
        NSLog(@"我是url=    %@",result);
//        if (self.picTAG > self.coverArrayM.count) {
//           [self.coverArrayM addObject:result];
//        }else{
//            [self.coverArrayM replaceObjectAtIndex:self.picTAG-1 withObject:result];
//        }
        [self requestmyzone:cover titlepage:result];
    } failure:^(NSError * _Nonnull error) {
        self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
        self.publishButton.userInteractionEnabled = NO;
    }];
}
/**新增我的劳动圈*/
- (void)requestmyzone:(NSString*)cover titlepage:(NSString*)titlepage{
      NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //内容
    para[@"content"] = self.content;
//    NSMutableString *strM = [NSMutableString string];
//    for (int i=0; i<self.coverArrayM.count; i++) {
//        if (i==0) {
//            [strM appendString:self.coverArrayM[i]];
//        }else{
//            [strM appendString:@","];
//            [strM appendString:self.coverArrayM[i]];
//        }
//    }
    //图片
      para[@"cover"] = cover;
    //视频封面图
    para[@"titlepage"] = titlepage;
      para[@"id"] = @"0";
    para[@"title"] = @"0";
    para[@"createTime"] = nil;
    para[@"updateTime"] = nil;
    para[@"delFlag"] = @"0";
    para[@"tenantId"] = @"0";
    para[@"count"] = @"0";
    para[@"type"] = @"0";
    para[@"userId"] = @"0";
    /**0视频 1-图片 2文本*/
    if (self.state == NewCirclesStatePic) {
       para[@"imgorvid"] = @"1";

    }else if (self.state == NewCirclesStateVideo){
        para[@"imgorvid"] = @"0";

    }else{
        para[@"imgorvid"] = @"2";
    }
    [MyCircleCenterRequestDatas myzonerequestDataWithparameters:para success:^(id  _Nonnull result) {
        [SVProgressHUD showSuccessWithStatus:@"发布成功"];
//        [self requestsysintegralsaveIntegralFORMOV];
//        [self dismissViewControllerAnimated:NO completion:^{
//            self.resultBlock();
//        }];
        [self dismissToRootViewController];

    } failure:^(NSError * _Nonnull error) {
        
    }];
}
-(void)dismissToRootViewController
{
    UIViewController *vc = self;
    while (vc.presentingViewController) {
        vc = vc.presentingViewController;
    }
    [vc dismissViewControllerAnimated:YES completion:nil];
}

/**加积分*/
- (void)requestsysintegralsaveIntegralFORMOV{
    //type：0-课时 1-签到 2-新闻 3-活动-4-劳动圈
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"type"] = @"4";
//    para[@"forId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    [LearningCenterRequest sysintegralsaveIntegralFORMOVrequestDataWithparameters:para success:^(id  _Nonnull result) {
        [self dismissToRootViewController];

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
