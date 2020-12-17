//
//  NewCirclesTextAndVideoViewController.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  新增视频圈子

typedef enum  {

NewCirclesStatePic  = 0,

NewCirclesStateVideo


} NewCirclesTextAndVideoState;

#import <UIKit/UIKit.h>
typedef void(^NewCirclesTextAndVideoViewControllerresultBlock)(void);

NS_ASSUME_NONNULL_BEGIN

@interface NewCirclesTextAndVideoViewController : UIViewController
@property (nonatomic, strong) UIImage *image; //当前拍摄的照片
@property (nonatomic, strong) NSURL *videoPath; //当前拍摄的视频路径
/**朋友圈类型，图片/视频*/
@property (nonatomic, assign)NewCirclesTextAndVideoState  state; //视频/图片
@property (nonatomic, copy)NewCirclesTextAndVideoViewControllerresultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
