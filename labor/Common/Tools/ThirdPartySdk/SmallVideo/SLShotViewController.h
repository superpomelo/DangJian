//
//  SLShotViewController.h
//  DarkMode
//
//  Created by wsl on 2019/9/18.
//  Copyright © 2019 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
typedef void(^SLShotViewControllerimageresultBlock)(UIImage*);
typedef void(^SLShotViewControllervideoresultBlock)(NSURL*);

@class SLShotViewController;
@protocol SLShotViewControllerDelegate <NSObject>
/**拍摄视频成功回调*/
- (void)SLShotViewControllerVideoActiondelegate:(SLShotViewController*)controller NSURL:(NSURL*)url;

/**照片成功回调*/
- (void)SLShotViewControllerimgActiondelegate:(SLShotViewController*)controller img:(UIImage*)img;
@end
/// 拍摄视图控制器
@interface SLShotViewController : UIViewController
@property (nonatomic, copy)SLShotViewControllerimageresultBlock imageresultBlock;
@property (nonatomic, copy)SLShotViewControllervideoresultBlock videoresultBlock;
@property (nonatomic,weak) id<SLShotViewControllerDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
