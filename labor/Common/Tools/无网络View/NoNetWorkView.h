//
//  NoNetWorkView.h
//  labor
//
//  Created by 狍子 on 2020/10/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NoNetWorkView;
@protocol NoNetWorkViewDelegate <NSObject>
/**无网络下返回*/
- (void)NoNetWorkViewBackButtonActiondelegate:(NoNetWorkView*)view;
/**再试一下*/
- (void)NoNetWorkViewAgainButtonActiondelegate:(NoNetWorkView*)view;

@end
@interface NoNetWorkView : UIView
@property (nonatomic,weak) id<NoNetWorkViewDelegate>delegate;
- (void)setUI;
@property (weak, nonatomic) IBOutlet UIButton *againButton;

@end

NS_ASSUME_NONNULL_END
