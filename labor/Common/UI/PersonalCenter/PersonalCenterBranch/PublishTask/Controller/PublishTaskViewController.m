//
//  PublishTaskViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  发布任务

#import "PublishTaskViewController.h"
#import "FirstPublishTaskTableViewCell.h"
#import "SelectTemplateViewController.h"
#import "PersonalCenterRequestDatas.h"
#import "MyFileRequestDatas.h"
#import "SelectClassView.h"
#import "PublishTaskClassModel.h"
#import "TeacherTimerViewController.h"

@interface PublishTaskViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,FirstPublishTaskTableViewCellDelegate,SelectClassViewDelegate,UITextFieldDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIButton *publishButton;
@property (weak, nonatomic) IBOutlet UIButton *SelectTemplateButton;
@property (nonatomic,strong)NSMutableArray *coverArrayM;
@property (nonatomic,strong)NSMutableArray *classIdArrayM;

/**任务名称*/
@property (nonatomic,strong)NSString *titlestr;
/**活动地点*/
@property (nonatomic,strong)NSString *activityAddress;

@property (nonatomic,strong)SelectClassView *theselectclassView;

/**活动描述*/
@property (nonatomic,strong)NSString *content;
@property (nonatomic,strong)NSString *startTime;
@property (nonatomic,strong)NSString *endTime;
/**班级id*/
@property (nonatomic,strong)NSString *classId;
// 1必选2非必选
@property (nonatomic,assign)int categoryId;

@property (nonatomic,assign)int picTAG;


@end

@implementation PublishTaskViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _picTAG = 1;
    _categoryId = 1;
    self.theselectclassView.hidden = YES;
    self.coverArrayM = [NSMutableArray array];
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
    //暂时隐藏选择模版
    self.SelectTemplateButton.hidden = YES;
    self.publishButton.layer.cornerRadius = self.publishButton.bounds.size.height/2;
}
/**班级选择view*/
- (SelectClassView *)theselectclassView{
    if (!_theselectclassView) {
        _theselectclassView = [[NSBundle mainBundle] loadNibNamed:@"SelectClassView" owner:self options:nil][0];
        _theselectclassView.frame = self.view.bounds;
        _theselectclassView.delegate = self;
////        [_carImmediatelyView settingUI];
        [self.view addSubview:_theselectclassView];
    }
    return _theselectclassView;
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstPublishTaskTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstPublishTaskTableViewCellID"];
    
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 878;
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
            return 1;
            break;

        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        FirstPublishTaskTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstPublishTaskTableViewCellID"];
    cell.delegate = self;
    [cell.titleTF addTarget:self action:@selector(titleTFAction:) forControlEvents:UIControlEventEditingChanged];
//    cell.titleTF.delegate = self;
    
    [cell.pleaceTF addTarget:self action:@selector(pleaceTFAction:) forControlEvents:UIControlEventEditingChanged];
//    cell.pleaceTF.delegate = self;

         return cell;

   
}
/**任务名称*/
- (void)titleTFAction:(UITextField*)sender{
    self.titlestr = sender.text;
}
/**活动地点*/
- (void)pleaceTFAction:(UITextField*)sender{
    self.activityAddress = sender.text;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
 
}
//MARK: - SubViews - 子视图
//选择图片
- (void)chooseImageAction {
    //底部弹出来个actionSheet来选择拍照或者相册选择
    UIAlertController *userIconActionSheet = [UIAlertController alertControllerWithTitle:@"请选择上传类型" message:nil preferredStyle:UIAlertControllerStyleActionSheet];
    //相册选择
    UIAlertAction *albumAction = [UIAlertAction actionWithTitle:@"手机相册选择" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        //这里加一个判断，是否是来自图片库
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypePhotoLibrary]){
            UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;            //协议
            imagePicker.allowsEditing = NO;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeSavedPhotosAlbum;
            imagePicker.modalPresentationStyle = 0;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    //系统相机拍照
    UIAlertAction *photoAction = [UIAlertAction actionWithTitle:@"相机" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        if ([UIImagePickerController isSourceTypeAvailable:UIImagePickerControllerSourceTypeCamera]){
            UIImagePickerController * imagePicker = [[UIImagePickerController alloc]init];
            imagePicker.delegate = self;
            imagePicker.allowsEditing = NO;
            imagePicker.sourceType = UIImagePickerControllerSourceTypeCamera;
            imagePicker.modalPresentationStyle = 0;
            [self presentViewController:imagePicker animated:YES completion:nil];
        }
    }];
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:^(UIAlertAction * _Nonnull action) {
    }];
    [userIconActionSheet addAction:albumAction];
    [userIconActionSheet addAction:photoAction];
    [userIconActionSheet addAction:cancelAction];
    userIconActionSheet.modalPresentationStyle = 0;
    [self presentViewController:userIconActionSheet animated:YES completion:nil];
}


#pragma mark - UIImagePickerControllerDelegate

// 拍照完成回调
- (void)imagePickerController:(UIImagePickerController *)picker didFinishPickingMediaWithInfo:(NSDictionary<UIImagePickerControllerInfoKey,id> *)info{
     UIImage *image = [info objectForKey:UIImagePickerControllerOriginalImage];
     //   [self.senderBtn setBackgroundImage:image forState:UIControlStateNormal];
        //图片在这里压缩一下
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5f);
//    NSString *stringBase64 = [imageData base64EncodedStringWithOptions:NSDataBase64EncodingEndLineWithLineFeed]; // base64格式的字符串
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"file"] = imageData;
    [self requestinformationuploadImg:dict];
//        NSString *imageBase64 = [imageData base64EncodedString];
    FirstPublishTaskTableViewCell *cell  = [self.myTableView   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.myTableView.numberOfSections-1]];
    if (self.picTAG == 1) {
        //第一张图片
        cell.addImageView1.hidden = YES;
        cell.image1View.image = image;
//        self.firstImageStr = imageData.base64EncodedString;

    }
//    [self requestuploadimage:imageData.base64EncodedString];
    
   //     NSLog(@"%@",imageBase64);
        if (imageData.length/1024 > 1024*20)
        {
    //        mAlertView(@"温馨提示", @"请重新选择一张不超过20M的图片");
        }
        else
        {
    //        _imageType = [NSData typeForImageData:imageData];
    //        _imageBase64 = [imageData base64EncodedString];
        }
      [self dismissViewControllerAnimated:YES completion:nil];
}



//进入拍摄页面点击取消按钮

- (void)imagePickerControllerDidCancel:(UIImagePickerController *)picker

{
    
    [self dismissViewControllerAnimated:YES completion:nil];
    
}
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
- (IBAction)SelectTemplateButtonAction:(id)sender {
    SelectTemplateViewController *STvc = [[SelectTemplateViewController alloc]init];
    [self.navigationController pushViewController:STvc animated:YES];
}

/**发布*/
- (IBAction)publishButtonAction:(UIButton*)sender {
    //限制点击
    sender.userInteractionEnabled = NO;
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(1 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        sender.userInteractionEnabled = YES;
    });
    [self requestactivity];
}

//MARK: - Utility - 多用途(功能)方法
/**点击班级确定*/
- (void)SelectClassViewCollectionViewActiondelegate:(SelectClassView*)view selarray:(NSMutableArray*)selarrayM{
    self.classIdArrayM = [NSMutableArray arrayWithArray:selarrayM];
    FirstPublishTaskTableViewCell *cell  = [self.myTableView   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.myTableView.numberOfSections-1]];
    NSMutableString *strM = [NSMutableString string];
    for (int i = 0; i<selarrayM.count; i++) {
        PublishTaskClassModel *modelp = selarrayM[i];
        [strM appendString:modelp.name];
    }
    if (selarrayM.count>0) {
        cell.classLabel.text = strM;
    }
}
/**点击图片*/
- (void)FirstPublishTaskTableViewCellButtonActiondelegate:(FirstPublishTaskTableViewCell*)cell button:(UIButton*)sender tag:(int)tag{
    if (tag == 1) {
        self.picTAG = 1;
    }
    [self chooseImageAction];
}
/**文本框代理*/
- (void)FirstPublishTaskTableViewCellActiondelegate:(FirstPublishTaskTableViewCell*)cell textview:(UITextView*)textView{
    self.content = textView.text;
}
/**班级选择*/
- (void)FirstPublishTaskTableViewCellClassActiondelegate:(FirstPublishTaskTableViewCell*)cell{
    [self requestsysclassgetbytecuserid];
}
/**开始时间*/
- (void)FirstPublishTaskTableViewCellStartTimeActiondelegate:(FirstPublishTaskTableViewCell*)cell{
    
    TeacherTimerViewController *TTvc = [[TeacherTimerViewController alloc]init];
    TTvc.resultBlock = ^(NSString * _Nonnull result) {
        NSLog(@"%@",result);
        self.startTime = result;
        cell.startTimeLabel.text = result;
//                [self.myTableView reloadData];
    };
    TTvc.TITLES = @"开始时间";
    [self.navigationController pushViewController:TTvc animated:YES];
}
/**结束时间*/
- (void)FirstPublishTaskTableViewCellEndTimeActiondelegate:(FirstPublishTaskTableViewCell*)cell{
    TeacherTimerViewController *TTvc = [[TeacherTimerViewController alloc]init];
    TTvc.resultBlock = ^(NSString * _Nonnull result) {
        NSLog(@"%@",result);
        self.endTime = result;
//                [self.myTableView reloadData];
        cell.endTimeLabel.text = result;
    };
    TTvc.TITLES = @"结束时间";
    [self.navigationController pushViewController:TTvc animated:YES];
}
/**必选*/
- (void)FirstPublishTaskTableViewCellBiXuanActiondelegate:(FirstPublishTaskTableViewCell*)cell{
    _categoryId = 1;
    cell.ziXuanImageView.image = [UIImage imageNamed:@"ic_choice2"];
    cell.biXuanImageView.image = [UIImage imageNamed:@"ic_choice"];

}
/**自选*/
- (void)FirstPublishTaskTableViewCellZiXuanActiondelegate:(FirstPublishTaskTableViewCell*)cell{
    _categoryId = 2;
    cell.ziXuanImageView.image = [UIImage imageNamed:@"ic_choice"];
    cell.biXuanImageView.image = [UIImage imageNamed:@"ic_choice2"];
}
//MARK: - Network request - 网络请求
/**教师端获取班级列表<>*/
- (void)requestsysclassgetbytecuserid{
    [PersonalCenterRequestDatas sysclassgetbytecuseridrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.theselectclassView.dataArray = result;

        [self.theselectclassView initUI];
        self.theselectclassView.selArray = [NSMutableArray arrayWithArray:self.classIdArrayM];

        self.theselectclassView.hidden = NO;
        
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**图片上传*/
- (void)requestinformationuploadImg:(NSMutableDictionary*)dict{
//      NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//    //图片
//      para[@"file"] = str;
    self.publishButton.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
    self.publishButton.userInteractionEnabled = NO;
    [MyFileRequestDatas informationuploadImgrequestDataWithparameters:dict imageDatas:dict success:^(id  _Nonnull result) {
       self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
        self.publishButton.userInteractionEnabled = YES;
        NSLog(@"我是url=    %@",result);
        if (self.picTAG > self.coverArrayM.count) {
           [self.coverArrayM addObject:result];
        }else{
            [self.coverArrayM replaceObjectAtIndex:self.picTAG-1 withObject:result];
        }
    } failure:^(NSError * _Nonnull error) {
        self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
        self.publishButton.userInteractionEnabled = NO;
    }];
}
/**教师端发布活动*/
- (void)requestactivity{
    
    
  NSMutableDictionary *para = [NSMutableDictionary dictionary];
  para[@"activityAddress"] = self.activityAddress;
  // 1必选2非必选
    para[@"categoryId"] = [NSString stringWithFormat:@"%d",self.categoryId];
    NSMutableString *classIdM = [NSMutableString string];
    for (int i=0; i<self.classIdArrayM.count; i++) {
        PublishTaskClassModel *modelp = self.classIdArrayM[i];
        if (i==0) {
            [classIdM appendString:[NSString stringWithFormat:@"%d",modelp.classId]];
        }else{
            [classIdM appendString:@","];
            [classIdM appendString:[NSString stringWithFormat:@"%d",modelp.classId]];
        }
    }
    //班级id
  para[@"classId"] = classIdM;
    
    NSMutableString *strM = [NSMutableString string];
    for (int i=0; i<self.coverArrayM.count; i++) {
        if (i==0) {
            [strM appendString:self.coverArrayM[i]];
        }else{
            [strM appendString:@","];
            [strM appendString:self.coverArrayM[i]];
        }
    }
  para[@"cover"] = strM;
  para[@"endTime"] = self.endTime;
  para[@"introduction"] = self.content;
  para[@"startTime"] = self.startTime;
  para[@"title"] = self.titlestr;

  [PersonalCenterRequestDatas activityrequestDataWithparameters:para success:^(id  _Nonnull result) {
      [self.navigationController popViewControllerAnimated:YES];
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
