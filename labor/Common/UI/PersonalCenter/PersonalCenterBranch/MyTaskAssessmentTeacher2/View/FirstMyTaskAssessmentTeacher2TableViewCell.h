//
//  FirstMyTaskAssessmentTeacher2TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacher2Model.h"
#import "MyTaskAssessmentTeacher2ViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyTaskAssessmentTeacher2TableViewCell : UITableViewCell
- (void)reloadData:(MyTaskAssessmentTeacher2Model*)model tagt:(int)tagt status:(MyTaskAssessmentTeacher2TypeState)status;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;


@end

NS_ASSUME_NONNULL_END
