//
//  LaborCenterLessonDetailsPlayEndView.h
//  labor
//
//  Created by 狍子 on 2020/10/20.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class LaborCenterLessonDetailsPlayEndView;
@protocol LaborCenterLessonDetailsPlayEndViewDelegate <NSObject>
/**再看一遍*/
- (void)LaborCenterLessonDetailsPlayEndViewLeftButtonActiondelegate:(LaborCenterLessonDetailsPlayEndView*)view;
/**劳动测试*/
- (void)LaborCenterLessonDetailsPlayEndViewrightButtonActiondelegate:(LaborCenterLessonDetailsPlayEndView*)view;

@end
@interface LaborCenterLessonDetailsPlayEndView : UIView
@property (weak, nonatomic) IBOutlet UIView *leftBottomView;
@property (weak, nonatomic) IBOutlet UIView *rightBottomView;
@property (weak, nonatomic) IBOutlet UILabel *tipsLabel;
@property (nonatomic,weak) id<LaborCenterLessonDetailsPlayEndViewDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
