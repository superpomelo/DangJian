//
//  FirstPersonalCenterHomeTableViewCell.h
//  com.tkhy.driver
//
//  Created by 狍子 on 2020/8/4.
//  Copyright © 2020 TK. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
@class FirstPersonalCenterHomeTableViewCell;
@protocol FirstPersonalCenterHomeTableViewCellDelegate <NSObject>
/**我的积分*/
- (void)FirstPersonalCenterHomeTableViewCellmyPointButtonActiondelegate:(FirstPersonalCenterHomeTableViewCell*)cell;

@end
@interface FirstPersonalCenterHomeTableViewCell : UITableViewCell
@property (nonatomic,weak) id<FirstPersonalCenterHomeTableViewCellDelegate>delegate;
/**用户昵称*/
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
/**头像*/
@property (weak, nonatomic) IBOutlet UIImageView *avatarImageView;
/**班级*/
@property (weak, nonatomic) IBOutlet UILabel *classNumLabel;
/**积分*/
@property (weak, nonatomic) IBOutlet UILabel *jiFenLabel;
- (void)reloadData:(PersonalCenterHomeModel*)model;
@end

NS_ASSUME_NONNULL_END
