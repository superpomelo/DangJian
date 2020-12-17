//
//  FirstLearningCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningCenterDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstLearningCenterDetails1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (void)reloadData:(LearningCenterDetailsModel*)model;
@end

NS_ASSUME_NONNULL_END
