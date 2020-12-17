//
//  FourthMyPointsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyPointsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FourthMyPointsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pointLabel;
- (void)reloadData:(MyPointsModel*)model;

@end

NS_ASSUME_NONNULL_END
