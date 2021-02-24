//
//  PersonalinformationViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "PersonalinformationViewController.h"
#import "FirstPersonalinformationTableViewCell.h"
#import "SecondPersonalinformationTableViewCell.h"
#import "FillInPersonalInformationViewController.h"
#import "SexViewController.h"
#import "DateOfBirthViewController.h"
#import "PersonalCenterHomeModel.h"
#import "MyFileRequestDatas.h"
#import "PersonalCenterRequestDatas.h"
#import "SchoolNameViewController.h"
#import "StudentIdViewController.h"
#import "MobnumberViewController.h"
#import "SchoolNameModel.h"
#import "MyTimeInterval.h"
#import "ZuZhiMingChengViewController.h"
#import "JiGuan1ViewController.h"
#import "XueLiXuanZeViewController.h"
#import "MingZuXuanZeViewController.h"
#import "IdNumberXiuGaiViewController.h"

@interface PersonalinformationViewController ()<UITableViewDelegate,UITableViewDataSource,UINavigationControllerDelegate,UIImagePickerControllerDelegate>
{
   NSArray *_leftInformationArray1;
    NSArray *_leftInformationArray2;
    NSArray *_leftInformationArray3;

}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property(nonatomic,strong)NSString *avatarStr;
@property(nonatomic,strong)NSString *sex;
@property(nonatomic,strong)NSString *birthday;
@property(nonatomic,strong)NSString *phone;
@property(nonatomic,assign)int deptId;
@property(nonatomic,strong)NSString *realName;
@property(nonatomic,strong)NSString *mingzu;

@property(nonatomic,strong)NSArray *schoolArray;

@end

@implementation PersonalinformationViewController

//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    _leftInformationArray1 = @[@"账号",@"头像"];
    _leftInformationArray2 = @[@"工号/学号",@"真实姓名",@"性别",@"民族",@"出生年月",@"籍贯",@"身份证号"];

    _leftInformationArray3 = @[@"参加工作日期",@"学历",@"入党日期",@"组织名称"];

    self.avatarStr = self.model.avatar;
    self.sex = self.model.sex;
    self.birthday = self.model.birthday;
    self.realName = self.model.realName;
    self.deptId = self.model.deptId;
    [self initUI];
    [self initmyTableView];
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
//    [self.navigationController setNavigationBarHidden:YES animated:YES];
    [self requestadmindeptgetDeptVoList];
    [self requestmobileUsergetPersonalCenterVo];
        [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;

}


//MARK: - Initalization - 初始化
- (void)initUI{
    self.titlesLabel.attributedText = [UILabel getABTbody:@"个人资料" font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
}
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstPersonalinformationTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstPersonalinformationTableViewCellID"];
     [self.myTableView registerNib:[UINib nibWithNibName:@"SecondPersonalinformationTableViewCell" bundle:nil] forCellReuseIdentifier:@"SecondPersonalinformationTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
  
    return 50;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section{
    return 10;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    UIView *vi = [[UIView alloc]initWithFrame:CGRectMake(0, 0, SCR_W, 10)];
    vi.backgroundColor = [UIColor colorWithRed:245/255.0 green:245/255.0 blue:245/255.0 alpha:1];
    return vi;
    
}
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 3;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    switch (section) {
        case 0:
            return _leftInformationArray1.count;
            break;
        case 1:
            return _leftInformationArray2.count;
            break;
        case 2:
            return _leftInformationArray3.count;
            break;
        default:
            break;
    }
    return 0;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        FirstPersonalinformationTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstPersonalinformationTableViewCellID"];
//        cell.avatarImageView.hidden = NO;
////        [cell.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.model.avatar]];
//        [cell.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.model.avatar] placeholderImage:[UIImage imageNamed:@"touxiangpleasehold"]];
        cell.leftLabel.attributedText = [UILabel getABTbody:_leftInformationArray1[indexPath.row] font:16 color:SL_UIColorFromHex(666666, 1) zitistyle:@"Source Han Serif CN"];
//        cell.leftLabel.text = _leftInformationArray1[indexPath.row];
        if (indexPath.row==0) {
            if (self.model.username != nil) {
                cell.avatarImageView.hidden = YES;

                cell.rightLabel.attributedText = [UILabel getABTbody:self.model.username font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }else if(indexPath.row==1){
            if (self.model != nil) {
            cell.avatarImageView.hidden = NO;
            [cell.avatarImageView sd_setImageWithURL:[NSURL URLWithString:self.model.avatar] placeholderImage:[UIImage imageNamed:@"touxiangpleasehold"]];

            cell.rightLabel.text = @"";
            }
        }

         return cell;
    }else if (indexPath.section == 1) {
        SecondPersonalinformationTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondPersonalinformationTableViewCellID"];

        cell.leftLabel.attributedText = [UILabel getABTbody:_leftInformationArray2[indexPath.row] font:16 color:SL_UIColorFromHex(666666, 1) zitistyle:@"Source Han Serif CN"];
        if (indexPath.row==0) {
//            if (self.model.partyNumber != nil) {
            cell.rightLabel.attributedText = [UILabel getABTbody:[NSString stringWithFormat:@"%d",self.model.partyNumber] font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            cell.rightImageView.hidden = YES;
//            }
        }
        if (indexPath.row==1) {
            if (self.model.realName != nil) {

                cell.rightLabel.attributedText = [UILabel getABTbody:self.model.realName font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }else if(indexPath.row==2){
            if (self.model.sex != nil) {

            cell.rightLabel.attributedText = [UILabel getABTbody:self.model.sex font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }else if(indexPath.row==3){
            if (self.model.nationName != nil) {

                cell.rightLabel.attributedText = [UILabel getABTbody:self.model.nationName font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }else if(indexPath.row==4){
            if (self.model.birthday != nil) {

//            cell.rightLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:self.model.birthday type:@"YYYY-MM-dd"]];
                
            cell.rightLabel.attributedText = [UILabel getABTbody:[NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:self.model.birthday type:@"YYYY-MM-dd"]] font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }else if(indexPath.row==5){
            if (self.model.birthdaddrass != nil) {

                cell.rightLabel.attributedText = [UILabel getABTbody:self.model.birthdaddrass font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
                
                
            }
        }else if(indexPath.row==6){
            if (self.model.infoId != nil) {

//            cell.rightLabel.text = self.model.infoId;
            cell.rightLabel.attributedText = [UILabel getABTbody:self.model.infoId font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }
         return cell;
    }else{
        SecondPersonalinformationTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"SecondPersonalinformationTableViewCellID"];
        if (indexPath.row==0) {
            if (self.model.jobTime != nil) {
            cell.rightLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:self.model.jobTime type:@"YYYY-MM-dd"]];
                
                cell.rightLabel.attributedText = [UILabel getABTbody:[NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:self.model.jobTime type:@"YYYY-MM-dd"]] font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }else if (indexPath.row == 1){
            if (self.model.educationName != nil) {
            cell.rightLabel.attributedText = [UILabel getABTbody:self.model.educationName font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }

        }else if (indexPath.row == 2){
            if (self.model.partyTime != nil) {

//            cell.rightLabel.text = [NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:self.model.partyTime type:@"YYYY-MM-dd"]];
                
                cell.rightLabel.attributedText = [UILabel getABTbody:[NSString stringWithFormat:@"%@",[MyTimeInterval IntervalStringToIneedDateString:self.model.partyTime type:@"YYYY-MM-dd"]] font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];
            }
        }else if (indexPath.row == 3){
            if (self.schoolArray.count>0) {
                for (int i=0; i<self.schoolArray.count; i++) {
                    SchoolNameModel *models = self.schoolArray[i];
                    if (models.deptId == self.model.deptId) {
                        cell.rightLabel.attributedText = [UILabel getABTbody:models.name font:16 color:SL_UIColorFromHex(333333, 1) zitistyle:@"Source Han Serif CN"];

                    }
                }
                
            }

        }
        cell.leftLabel.attributedText = [UILabel getABTbody:_leftInformationArray3[indexPath.row] font:16 color:SL_UIColorFromHex(666666, 1) zitistyle:@"Source Han Serif CN"];
         return cell;
    }

    

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.section == 0) {
        if (indexPath.row==0) {
            MobnumberViewController *MBvc = [[MobnumberViewController alloc]init];
            MBvc.resultBlock = ^(NSString * _Nonnull mob) {
//                self.phone = mob;
//                [self.myTableView reloadData];
            };
            MBvc.model = self.model;
            [self.navigationController pushViewController:MBvc animated:YES];
        }
        if (indexPath.row==1) {
            [self chooseImageAction];
        }
    }else if (indexPath.section == 1) {
        if (indexPath.row == 1) {
            FillInPersonalInformationViewController *FPvc = [[FillInPersonalInformationViewController alloc]init];
            FPvc.model = self.model;
            FPvc.resultBlock = ^(NSString * _Nonnull realname) {
                self.realName = realname;
                [self.myTableView reloadData];
            };
            [self.navigationController pushViewController:FPvc animated:YES];
        }else if (indexPath.row == 2){
            SexViewController *SXvc = [[SexViewController alloc]init];
            SXvc.resultBlock = ^(NSString * _Nonnull result) {
                NSLog(@"%@",result);
//                self.sex = result;
//                [self.myTableView reloadData];
            };
            SXvc.model = self.model;
            [self.navigationController pushViewController:SXvc animated:YES];

        }else if (indexPath.row == 3){
            MingZuXuanZeViewController *MZvc = [[MingZuXuanZeViewController alloc]init];
            MZvc.resultBlock = ^(NSString * _Nonnull result1, NSString * _Nonnull result2) {
                self.mingzu = result1;
                [self.myTableView reloadData];
                NSLog(@"%@,%@",result1,result2);
            };
            [self.navigationController pushViewController:MZvc animated:YES];

        }else if (indexPath.row == 4){
            DateOfBirthViewController *DOvc = [[DateOfBirthViewController alloc]init];
            DOvc.titlestr = @"选择出生日期";
            DOvc.timetype = 0;
            DOvc.resultBlock = ^(NSString * _Nonnull result) {
                NSLog(@"%@",result);
//                self.birthday = result;
//                [self.myTableView reloadData];
            };
            DOvc.model = self.model;
            [self.navigationController pushViewController:DOvc animated:YES];
//            SchoolNameViewController *SNvc = [[SchoolNameViewController alloc]init];
//            SNvc.model = self.model;
//            SNvc.resultBlock = ^(NSString * _Nonnull school) {
//
//
//            };
//            [self.navigationController pushViewController:SNvc animated:YES];
        }else if (indexPath.row == 5){
            JiGuan1ViewController *SIvc = [[JiGuan1ViewController alloc]init];
            SIvc.resultBlock = ^(NSString * _Nonnull result) {
                
            };
            [self.navigationController pushViewController:SIvc animated:YES];
        }else if (indexPath.row == 6){
            IdNumberXiuGaiViewController *INvc = [[IdNumberXiuGaiViewController alloc]init];
            [self.navigationController pushViewController:INvc animated:YES];
        }
    }else if(indexPath.section == 2){
        if (indexPath.row == 0) {
            DateOfBirthViewController *DOvc = [[DateOfBirthViewController alloc]init];
            DOvc.titlestr = @"选择参加工作日期";
            DOvc.timetype = 1;
            DOvc.resultBlock = ^(NSString * _Nonnull result) {
                NSLog(@"%@",result);
//                self.birthday = result;
//                [self.myTableView reloadData];
            };
            DOvc.model = self.model;
            [self.navigationController pushViewController:DOvc animated:YES];
        }else if (indexPath.row == 1){
            XueLiXuanZeViewController *XLvc = [[XueLiXuanZeViewController alloc]init];
            XLvc.resultBlock = ^(NSString * _Nonnull result) {
                
            };
            [self.navigationController pushViewController:XLvc animated:YES];

        }else if (indexPath.row == 2){
//            DateOfBirthViewController *DOvc = [[DateOfBirthViewController alloc]init];
//            DOvc.titlestr = @"选择入党日期";
//            DOvc.timetype = 2;
//
//            DOvc.resultBlock = ^(NSString * _Nonnull result) {
//                NSLog(@"%@",result);
////                self.birthday = result;
////                [self.myTableView reloadData];
//            };
////            DOvc.model = self.model;
//            [self.navigationController pushViewController:DOvc animated:YES];
        }else if (indexPath.row == 3){
//            ZuZhiMingChengViewController *DOvc = [[ZuZhiMingChengViewController alloc]init];
//            DOvc.resultBlock = ^(NSString * _Nonnull result) {
//                NSLog(@"%@",result);
////                self.birthday = result;
////                [self.myTableView reloadData];
//            };
////            DOvc.model = self.model;
//            [self.navigationController pushViewController:DOvc animated:YES];
        }
    }

}


//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
//MARK: - Utility - 多用途(功能)方法
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
        //图片在这里压缩一下
        NSData *imageData = UIImageJPEGRepresentation(image, 0.5f);
    NSMutableDictionary *dict = [NSMutableDictionary dictionary];
    dict[@"file"] = imageData;
    [self requestinformationuploadImg:dict];

    FirstPersonalinformationTableViewCell *cell  = [self.myTableView   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:0]];
    cell.avatarImageView.image = image;
//        NSString *imageBase64 = [imageData base64EncodedString];
//    FirstTKDOrderCenterCompleteDischargeTableViewCell *cell  = [self.myTableView   cellForRowAtIndexPath:[NSIndexPath indexPathForRow:0 inSection:self.myTableView.numberOfSections-1]];
//    if (_TAG == 0) {
//        //第一张图片
//        cell.firstImageView.image = image;
////        self.firstImageStr = imageData.base64EncodedString;
//        cell.secondView.hidden = NO;
//
//    }
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
//MARK: - Network request - 网络请求
/**图片/视频上传*/
- (void)requestinformationuploadImg:(NSMutableDictionary*)dict{
    
//      NSMutableDictionary *para = [NSMutableDictionary dictionary];
//
//    //图片
//      para[@"file"] = str;
  
    [MyFileRequestDatas informationuploadImgrequestDataWithparameters:dict imageDatas:dict success:^(id  _Nonnull result) {
       
        NSLog(@"我是url=    %@",result);
        NSMutableDictionary *para = [NSMutableDictionary dictionary];
        para[@"avatar"] = result;
//        para[@"birthday"] = self.model.birthday;
//        para[@"deptId"] = [NSString stringWithFormat:@"%d",self.model.deptId];
//
//        para[@"partyNumber"] = [NSString stringWithFormat:@"%d",self.model.partyNumber];
//        para[@"phone"] = [NSString stringWithFormat:@"%d",self.model.phone];
//        para[@"realName"] = self.model.realName;
//        para[@"sex"] = self.model.sex;
//        para[@"username"] = self.model.username;
        [self requestmobileUsermyInfoX:para];

    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**个人信息修改*/
- (void)requestmobileUsermyInfo:(NSMutableDictionary*)para{

    [PersonalCenterRequestDatas mobileUsermyInforequestDataWithparameters:para success:^(id  _Nonnull result) {
            
        } failure:^(NSError * _Nonnull error) {
            
        }];
}

/**学校列表*/
- (void)requestadmindeptgetDeptVoList{
    [PersonalCenterRequestDatas admindeptgetDeptVoListrequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.schoolArray = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**更改头像*/
- (void)requestmobileUseravatar:(NSMutableDictionary*)para{
    [PersonalCenterRequestDatas mobileUseravatarrequestDataWithparameters:para success:^(id  _Nonnull result) {
        [self requestmobileUsergetPersonalCenterVo];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}
/**个人资料*/
- (void)requestmobileUsergetPersonalCenterVo{
    [PersonalCenterRequestDatas mobileUsergetPersonalCenterVorequestDataWithparameters:nil success:^(id  _Nonnull result) {
        self.model = result;
        [self.myTableView reloadData];
        } failure:^(NSError * _Nonnull error) {
            
        }];
}

/**个人修改信息*/
- (void)requestmobileUsermyInfoX:(NSMutableDictionary*)para{
//    NSMutableDictionary *para = [NSMutableDictionary dictionary];
//    para[@"avatar"] = @"";
    [PersonalCenterRequestDatas mobileUsermyInforequestDataWithparameters:para success:^(id  _Nonnull result) {
//       [SVProgressHUD showSuccessWithStatus:@"修改成功"];

        [self requestmobileUsergetPersonalCenterVo];
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
