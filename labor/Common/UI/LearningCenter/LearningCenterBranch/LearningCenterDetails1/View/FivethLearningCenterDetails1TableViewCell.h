//
//  FivethLearningCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningCenterDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FivethLearningCenterDetails1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
- (void)reloadData:(NSString*)model;
@end

NS_ASSUME_NONNULL_END
