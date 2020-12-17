//
//  SLEditViewController.h
//  DarkMode
//
//  Created by wsl on 2019/10/12.
//  Copyright © 2019 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SLEditVideoControllerresultBlock)(NSURL*);
@class SLEditVideoController;
@protocol SLEditVideoControllerDelegate <NSObject>


/**视频成功回调*/
- (void)SLEditVideoControllerURLActiondelegate:(SLEditVideoController*)controller URL:(NSURL*)url;
@end
/// 拍摄完毕后 编辑
@interface SLEditVideoController : UIViewController
@property (nonatomic, strong) NSURL *videoPath; //当前拍摄的视频路径
@property (nonatomic, copy)SLEditVideoControllerresultBlock resultBlock;
@property (nonatomic,weak) id<SLEditVideoControllerDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
