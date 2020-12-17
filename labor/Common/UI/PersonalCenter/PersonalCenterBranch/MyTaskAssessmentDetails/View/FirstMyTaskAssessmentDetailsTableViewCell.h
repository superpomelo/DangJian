//
//  FirstMyTaskAssessmentDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskAssessmentDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyTaskAssessmentDetailsTableViewCell : UITableViewCell
- (void)reloadData:(TaskAssessmentDetailsModel*)model;
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
@end

NS_ASSUME_NONNULL_END
