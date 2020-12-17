//
//  SeventhLaborCenterHomeNewsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/9.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SeventhLaborCenterHomeNewsTableViewCell : UITableViewCell
- (void)reloadData:(LearningCenterHomeModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@property (weak, nonatomic) IBOutlet UIImageView *videoImageView;
@property (weak, nonatomic) IBOutlet UIView *alphaBottomView;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
@end

NS_ASSUME_NONNULL_END
