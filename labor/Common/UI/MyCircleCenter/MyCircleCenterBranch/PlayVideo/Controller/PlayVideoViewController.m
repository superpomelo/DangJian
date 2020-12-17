//
//  PlayVideoViewController.m
//  labor
//
//  Created by 狍子 on 2020/9/22.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "PlayVideoViewController.h"
#import "SLAvPlayer.h"

@interface PlayVideoViewController ()<SLAvPlayerDelegate>
//@property (nonatomic, strong) UIImageView *preview1;
@property (weak, nonatomic) IBOutlet UIImageView *preview;// 预览视图
@property (weak, nonatomic) IBOutlet UIView *navBottomView;
@property (weak, nonatomic) IBOutlet UIView *topBottomView;
@property (nonatomic, assign) CMTime clippingBeginTime; //视频裁剪起始点
@property (nonatomic, assign) CMTime clippingEndTime; //视频裁剪结束点
//展示编辑的图片或视频
@property (nonatomic, strong) SLAvPlayer *avPlayer;  //视频播放预览
@end

@implementation PlayVideoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    [self setupUI];
    self.navBottomView.hidden = YES;
    self.topBottomView.hidden = YES;
    self.preview.userInteractionEnabled = NO;
    self.fd_prefersNavigationBarHidden = YES;

}
-(void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    


}
- (IBAction)backButtonAction:(id)sender {
    [self dismissViewControllerAnimated:false completion:^{
            
    }];
}
- (CMTime)clippingBeginTime {
    if (_clippingBeginTime.value == 0) {
        _clippingBeginTime = CMTimeMake(0, self.clippingEndTime.timescale);
    }
    return _clippingBeginTime;
}
- (CMTime)clippingEndTime {
    if (_clippingEndTime.value == 0) {
        _clippingEndTime = self.avPlayer.duration;
    }
    return _clippingEndTime;
}

- (SLAvPlayer *)avPlayer {
    if (!_avPlayer) {
        _avPlayer = [[SLAvPlayer alloc] init];
        
    }
    return _avPlayer;
}
- (void)setupUI {
    self.view.backgroundColor = [UIColor blackColor];
    [self.view addSubview:self.preview];
    
    self.avPlayer.url = self.videoPath;
    self.avPlayer.delegate = self;
    if (self.avPlayer.naturalSize.width != CGSizeZero.width) {
         self.preview.sl_h = self.preview.sl_w *  self.avPlayer.naturalSize.height/ self.avPlayer.naturalSize.width;
    }
    self.avPlayer.monitor = self.preview;
    self.preview.center = CGPointMake(self.view.sl_w/2.0, self.view.sl_h/2.0);
    [self.avPlayer play];
    
    
}
- (IBAction)touchButtonAction:(id)sender {
    [self.view bringSubviewToFront:self.topBottomView];
    [self.view bringSubviewToFront:self.navBottomView];

    self.navBottomView.hidden = !self.navBottomView.hidden;
    self.topBottomView.hidden = !self.topBottomView.hidden;
}

#pragma mark - SLAvPlayerDelegate
- (void)avPlayer:(SLAvPlayer *)avPlayer playingToCurrentTime:(CMTime)currentTime totalTime:(CMTime)totalTime {
    if (CMTimeGetSeconds(currentTime) >= CMTimeGetSeconds(self.clippingEndTime)) {
        [avPlayer seekToTime:self.clippingBeginTime completionHandler:nil];
        [avPlayer play];
    }
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
