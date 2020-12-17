//
//  NewCirclesViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  发布新圈子

#import "NewCirclesViewController.h"
#import "NewCirclesTextAndPicViewController.h"
#import "NewCirclesTextAndVideoViewController.h"
#import "SLShotViewController.h"
#import <ZLPhotoBrowser-objc/ZLPhotoBrowser.h>
#import "GetFileSpace.h"

@interface NewCirclesViewController ()<SLShotViewControllerDelegate>
@property (weak, nonatomic) IBOutlet UIView *labelBottomView;
@property (weak, nonatomic) IBOutlet UIView *videoBottomView;

@end

@implementation NewCirclesViewController
//MARK: - Life Cycle - 生命周期
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self initUI];
    self.fd_prefersNavigationBarHidden = YES;

}
//MARK: - Initalization - 初始化
- (void)initUI{
    self.labelBottomView.layer.cornerRadius = self.labelBottomView.bounds.size.height/2;
     self.videoBottomView.layer.cornerRadius = self.videoBottomView.bounds.size.height/2;
}
//MARK: - SubViews - 子视图
//MARK: - Button Action - 点击事件
- (IBAction)textAndPicButtonAction:(id)sender {
    NewCirclesTextAndPicViewController *NCvc1 = [[NewCirclesTextAndPicViewController alloc]initWithNibName:@"NewCirclesTextAndPicViewController" bundle:nil];
//    [self presentViewController:NCvc1 animated:YES completion:nil];
    [self.navigationController pushViewController:NCvc1 animated:YES];
}
- (IBAction)textAndVideoButtonAction:(id)sender {
//    NewCirclesTextAndVideoViewController *NCvc2 = [[NewCirclesTextAndVideoViewController alloc]init];
//    [self.navigationController pushViewController:NCvc2 animated:YES];
    
//    SLShotViewController * shotViewController = [[SLShotViewController alloc] init];
//    shotViewController.modalPresentationStyle = UIModalPresentationFullScreen;
//    shotViewController.delegate = self;
//
//    [self presentViewController:shotViewController animated:YES completion:nil];
    // 直接调用相机
    ZLCustomCamera *camera = [[ZLCustomCamera alloc] init];


    camera.doneBlock = ^(UIImage *image, NSURL *videoUrl) {
        // 自己需要在这个地方进行图片或者视频的保存
        NSLog(@"1000000");
       
        
        if (image != nil) {
            NSLog(@"拍照片");
            NSLog(@"照片%@",image);
                NewCirclesTextAndVideoViewController *NCvc = [[NewCirclesTextAndVideoViewController alloc]init];
                NCvc.image = image;
                NCvc.state = NewCirclesStatePic;
            
                NCvc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:NCvc animated:YES completion:nil];
            
            
            
        }else if (videoUrl != nil) {
            NSLog(@"拍视频");
            NSLog(@"视频%@",videoUrl);
            [GetFileSpace getFileSize:videoUrl.path];
            NewCirclesTextAndVideoViewController *NCvc = [[NewCirclesTextAndVideoViewController alloc]init];
            NCvc.videoPath = videoUrl;
            NCvc.state = NewCirclesStateVideo;
        //    NCvc.resultBlock = ^{
        //        [self dismissViewControllerAnimated:false completion:^{
        //                [self.navigationController popToRootViewControllerAnimated:YES];
        //            }];
        //
        //
        //    };
        //    [self.navigationController pushViewController:NCvc animated:NO];
            NCvc.modalPresentationStyle = UIModalPresentationFullScreen;
            [self presentViewController:NCvc animated:YES completion:nil];
//        UIViewController *topRootViewController = [[UIApplication  sharedApplication] keyWindow].rootViewController;
//
//        // 在这里加一个这个样式的循环
//        while (topRootViewController.presentedViewController)
//        {
//        // 这里固定写法
//        topRootViewController = topRootViewController.presentedViewController;
//        }
//        // 然后再进行present操作
//        [topRootViewController presentViewController:NCvc animated:YES completion:nil];
        }
    };

    [self showDetailViewController:camera sender:nil];
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:NO];
}

//MARK: - Utility - 多用途(功能)方法
/**拍摄视频成功回调*/
- (void)SLShotViewControllerVideoActiondelegate:(SLShotViewController*)controller NSURL:(NSURL*)url{
    NewCirclesTextAndVideoViewController *NCvc = [[NewCirclesTextAndVideoViewController alloc]init];
    NCvc.videoPath = url;
    NCvc.state = NewCirclesStateVideo;
//    NCvc.resultBlock = ^{
//        [self dismissViewControllerAnimated:false completion:^{
//                [self.navigationController popToRootViewControllerAnimated:YES];
//            }];
//
//
//    };
//    [self.navigationController pushViewController:NCvc animated:NO];
    NCvc.modalPresentationStyle = UIModalPresentationFullScreen;
//    [self presentViewController:NCvc animated:YES completion:nil];
UIViewController *topRootViewController = [[UIApplication  sharedApplication] keyWindow].rootViewController;

// 在这里加一个这个样式的循环
while (topRootViewController.presentedViewController)
{
// 这里固定写法
topRootViewController = topRootViewController.presentedViewController;
}
// 然后再进行present操作
[topRootViewController presentViewController:NCvc animated:YES completion:nil];
}

/**照片成功回调*/
- (void)SLShotViewControllerimgActiondelegate:(SLShotViewController*)controller img:(UIImage*)img{
    NSLog(@"照片成功回调");
//    NewCirclesTextAndVideoViewController *NCvc = [[NewCirclesTextAndVideoViewController alloc]init];
//    NCvc.image = img;
//    NCvc.state = NewCirclesStatePic;
//
//    NCvc.modalPresentationStyle = UIModalPresentationFullScreen;
////
////    [self presentViewController:NCvc animated:YES completion:nil];
//
//    UIViewController *topRootViewController = [[UIApplication  sharedApplication] keyWindow].rootViewController;
//
//   // 在这里加一个这个样式的循环
//   while (topRootViewController.presentedViewController)
//   {
//       // 这里固定写法
//     topRootViewController = topRootViewController.presentedViewController;
//   }
//   // 然后再进行present操作
//    [topRootViewController presentViewController:NCvc animated:YES completion:nil];
    

}
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
