//
//  MyTaskAssessmentTeacherTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacherModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MyTaskAssessmentTeacherTableViewCell : UITableViewCell
- (void)reloadData:(MyTaskAssessmentTeacherModel*)model tagt:(int)tagt;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@property (weak, nonatomic) IBOutlet UILabel *stateLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;


@end

NS_ASSUME_NONNULL_END
