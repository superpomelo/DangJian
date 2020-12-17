//
//  TheProblemOfFeedbackViewController.m
//  labor
//
//  Created by 狍子 on 2020/10/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  问题反馈

#import "TheProblemOfFeedbackViewController.h"
#import "FirstTheProblemOfFeedbackTableViewCell.h"
#import "SecondTheProblemOfFeedbackTableViewCell.h"
#import "ThirdTheProblemOfFeedbackTableViewCell.h"
#import "MyFileRequestDatas.h"
#import "PersonalCenterRequestDatas.h"


@interface TheProblemOfFeedbackViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate,FirstTheProblemOfFeedbackTableViewCellDelegate,SecondTheProblemOfFeedbackTableViewCellDelegate,ThirdTheProblemOfFeedbackTableViewCellDelegate>
@property (weak, nonatomic) IBOutlet UITableView *myTableView;

@property (nonatomic,strong)NSMutableArray *coverArrayM;
@property (nonatomic,strong)NSString *content;
@property (nonatomic,assign)int picTAG;
@end

@implementation TheProblemOfFeedbackViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.coverArrayM = [NSMutableArray array];
    _picTAG = 1;
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
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstTheProblemOfFeedbackTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstTheProblemOfFeedbackTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"SecondTheProblemOfFeedbackTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondTheProblemOfFeedbackTableViewCellID"];
    [self.myTableView registerNib:[UINib nibWithNibName:@"ThirdTheProblemOfFeedbackTableViewCell" bundle:nil] forCellReuseIdentifier:@"ThirdTheProblemOfFeedbackTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    switch (indexPath.section) {
        case 0:
            return 120;
            break;
        case 1:
                return 100;
                break;
        case 2:
                return 100;
                break;
        default:
            break;
    }
    return 0;
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
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
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstTheProblemOfFeedbackTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstTheProblemOfFeedbackTableViewCellID"];
        cell.delegate = self;
         return cell;
    }else if (indexPath.section == 1){
        SecondTheProblemOfFeedbackTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondTheProblemOfFeedbackTableViewCellID"];
        cell.delegate = self;
         return cell;
    }else{
        ThirdTheProblemOfFeedbackTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"ThirdTheProblemOfFeedbackTableViewCellID"];
        cell.delegate = self;
         return cell;
    }

    

}

//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}



//MARK: - Utility - 多用途(功能)方法
/**文本框代理*/
- (void)FirstTheProblemOfFeedbackTableViewCellActiondelegate:(FirstTheProblemOfFeedbackTableViewCell*)cell textview:(UITextView*)textView{
    self.content = textView.text;
}
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
    SecondTheProblemOfFeedbackTableViewCell *cell  = [self.myTableView   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:1]];
    if (self.picTAG == 1) {
        //第一张图片
        cell.addImageView1.hidden = YES;
        cell.image1View.image = image;
//        self.firstImageStr = imageData.base64EncodedString;
        cell.bottomView2.hidden = NO;

    }else if (self.picTAG == 2) {
               cell.addImageView2.hidden = YES;
                cell.image2View.image = image;
        //        self.firstImageStr = imageData.base64EncodedString;
                cell.bottomView3.hidden = NO;
    }else if (self.picTAG == 3) {
               cell.addImageView3.hidden = YES;
                cell.image3View.image = image;
        //        self.firstImageStr = imageData.base64EncodedString;
//                cell.bottomView4.hidden = NO;
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

/**点击图片*/
- (void)SecondTheProblemOfFeedbackTableViewCellButtonActiondelegate:(SecondTheProblemOfFeedbackTableViewCell*)cell button:(UIButton*)sender tag:(int)tag{
    if (tag == 1) {
        self.picTAG = 1;
    }else if (tag == 2) {
        self.picTAG = 2;

    }else if (tag == 3) {
        self.picTAG = 3;

    }else if (tag == 4) {
        self.picTAG = 4;

    }else if (tag == 5) {
        self.picTAG = 5;

    }else if (tag == 6) {
        self.picTAG = 6;

    }else if (tag == 7) {
        self.picTAG = 7;

    }else if (tag == 8) {
        self.picTAG = 8;

    }else if (tag == 9) {
        self.picTAG = 9;

    }
    [self chooseImageAction];
}

/**提交*/
- (void)ThirdTheProblemOfFeedbackTableViewCellActiondelegate:(ThirdTheProblemOfFeedbackTableViewCell*)cell{
    [self requestsysfeedbackaddfeedback];
}
//MARK: - Network request - 网络请求
/**图片上传*/
- (void)requestinformationuploadImg:(NSMutableDictionary*)dict{
//      NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//    //图片
//      para[@"file"] = str;
//    self.publishButton.backgroundColor = [UIColor colorWithRed:219/255.0 green:219/255.0 blue:219/255.0 alpha:1];
//    self.publishButton.userInteractionEnabled = NO;
    [MyFileRequestDatas informationuploadImgrequestDataWithparameters:dict imageDatas:dict success:^(id  _Nonnull result) {
//       self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
//       self.publishButton.userInteractionEnabled = YES;
        NSLog(@"我是url=    %@",result);
        if (self.picTAG > self.coverArrayM.count) {
           [self.coverArrayM addObject:result];
        }else{
            [self.coverArrayM replaceObjectAtIndex:self.picTAG-1 withObject:result];
        }
    } failure:^(NSError * _Nonnull error) {
//        self.publishButton.backgroundColor = [UIColor colorWithRed:80/255.0 green:220/255.0 blue:142/255.0 alpha:1];
//        self.publishButton.userInteractionEnabled = NO;
    }];
}

/**建议反馈*/
- (void)requestsysfeedbackaddfeedback{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    para[@"content"] = self.content;
    NSMutableString *strM = [NSMutableString string];
    for (int i=0; i<self.coverArrayM.count; i++) {
        if (i==0) {
            [strM appendString:self.coverArrayM[i]];
        }else{
            [strM appendString:@","];
            [strM appendString:self.coverArrayM[i]];
        }
    }
    para[@"img"] = strM;
    [PersonalCenterRequestDatas sysfeedbackaddfeedbackrequestDataWithparameters:para success:^(id  _Nonnull result) {
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
