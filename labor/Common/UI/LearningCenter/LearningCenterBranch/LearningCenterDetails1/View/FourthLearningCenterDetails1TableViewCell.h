//
//  FourthLearningCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningCenterDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN
@class FourthLearningCenterDetails1TableViewCell;
@protocol FourthLearningCenterDetails1TableViewCellDelegate <NSObject>
/**播放button*/
- (void)FourthLearningCenterDetails1TableViewCellButtonActiondelegate:(FourthLearningCenterDetails1TableViewCell*)cell button:(UIButton*)sender;

@end
@interface FourthLearningCenterDetails1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIView *coverBottomView;
@property (weak, nonatomic) IBOutlet UIImageView *playButtonImageView;
/**最终用来播放视频的view*/
@property (weak, nonatomic) IBOutlet UIView *BottomView;
/**播放button*/
@property (weak, nonatomic) IBOutlet UIButton *playButton;
- (void)reloadData:(LearningCenterDetailsModel*)model;
@property (nonatomic,weak) id<FourthLearningCenterDetails1TableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
