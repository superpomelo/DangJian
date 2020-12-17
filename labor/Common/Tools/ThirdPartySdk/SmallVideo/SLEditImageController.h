//
//  SLEditImageController.h
//  DarkMode
//
//  Created by wsl on 2019/10/31.
//  Copyright © 2019 wsl. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

typedef void(^SLEditImageControllerresultBlock)(UIImage*);
@class SLEditImageController;
@protocol SLEditImageControllerDelegate <NSObject>


/**照片成功回调*/
- (void)SLEditImageControllerimgActiondelegate:(SLEditImageController*)controller img:(UIImage*)img;
@end
@interface SLEditImageController : UIViewController
@property (nonatomic, strong) UIImage *image; //当前拍摄的照片
@property (nonatomic, copy)SLEditImageControllerresultBlock resultBlock;
@property (nonatomic,weak) id<SLEditImageControllerDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
