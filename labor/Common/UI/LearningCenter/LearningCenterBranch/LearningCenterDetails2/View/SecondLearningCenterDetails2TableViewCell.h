//
//  SecondLearningCenterDetails2TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeacherLectureHallModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondLearningCenterDetails2TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *playNumLabel;
- (void)reloadData:(TeacherLectureHallModel*)model;

@end

NS_ASSUME_NONNULL_END
