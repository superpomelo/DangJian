//
//  SecondMyTaskAssessmentTeacher3TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacher3Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondMyTaskAssessmentTeacher3TableViewCell : UITableViewCell
- (void)reloadData:(MyTaskAssessmentTeacher3Model*)model;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@end

NS_ASSUME_NONNULL_END
