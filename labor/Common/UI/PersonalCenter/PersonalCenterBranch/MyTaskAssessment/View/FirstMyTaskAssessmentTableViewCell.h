//
//  FirstMyTaskAssessmentTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyTaskAssessmentTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
- (void)reloadData:(MyTaskAssessmentModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *subTitleLabel;
/**活动图片*/
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stateImageView;
@property (weak, nonatomic) IBOutlet UIView *youshangjiaoView;

@end

NS_ASSUME_NONNULL_END
