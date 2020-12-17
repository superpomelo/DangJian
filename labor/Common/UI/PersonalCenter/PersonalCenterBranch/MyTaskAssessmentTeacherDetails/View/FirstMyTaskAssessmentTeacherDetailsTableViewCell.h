//
//  FirstMyTaskAssessmentTeacherDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/10/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskAssessmentDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyTaskAssessmentTeacherDetailsTableViewCell : UITableViewCell

- (void)reloadData:(TaskAssessmentDetailsModel*)model;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@end

NS_ASSUME_NONNULL_END
