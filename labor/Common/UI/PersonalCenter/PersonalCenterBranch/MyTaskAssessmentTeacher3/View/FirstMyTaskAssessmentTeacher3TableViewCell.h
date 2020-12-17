//
//  FirstMyTaskAssessmentTeacher3TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacher3Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyTaskAssessmentTeacher3TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (void)reloadData:(MyTaskAssessmentTeacher3Model*)model;
@property (weak, nonatomic) IBOutlet UILabel *schoolLabel;

@end

NS_ASSUME_NONNULL_END
