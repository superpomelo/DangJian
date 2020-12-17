//
//  MingZhuMyCircleCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MingZhuPingYiModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface MingZhuMyCircleCenterHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
- (void)reloadData:(MingZhuPingYiModel*)model;

@end

NS_ASSUME_NONNULL_END
