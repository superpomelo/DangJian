//
//  SecondMyCircleCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCircleCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondMyCircleCenterHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *zhidingBottomView;
- (void)reloadData:(MyCircleCenterHomeModel*)model;

@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@end

NS_ASSUME_NONNULL_END
