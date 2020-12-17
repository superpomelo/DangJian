//
//  SecondLearningCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningCenterDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondLearningCenterDetails1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (void)reloadData:(LearningCenterDetailsModel*)model;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

NS_ASSUME_NONNULL_END
