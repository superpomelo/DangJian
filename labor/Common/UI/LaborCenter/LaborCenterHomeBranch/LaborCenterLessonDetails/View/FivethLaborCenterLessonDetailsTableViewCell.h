//
//  FivethLaborCenterLessonDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExperienceModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FivethLaborCenterLessonDetailsTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *badyLabel;


- (void)reloadData:(ExperienceModel*)model;

@end

NS_ASSUME_NONNULL_END
