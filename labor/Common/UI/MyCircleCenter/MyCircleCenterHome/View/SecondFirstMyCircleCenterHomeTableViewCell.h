//
//  SecondFirstMyCircleCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/18.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DangYuanGuShiFangModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondFirstMyCircleCenterHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *rightLabel;
- (void)reloadData:(DangYuanGuShiFangModel*)model;

@end

NS_ASSUME_NONNULL_END
