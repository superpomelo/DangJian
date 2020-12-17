//
//  FirstAssessmentOfTheTaskTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "AssessmentOfTheTaskModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstAssessmentOfTheTaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *enterBottomView;

@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
/**活动图片*/
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
- (void)reloadData:(AssessmentOfTheTaskModel*)model;
@end

NS_ASSUME_NONNULL_END
