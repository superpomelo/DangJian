//
//  SecondMingZhuPingYiDetailsViewTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MingZhuPingYiDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondMingZhuPingYiDetailsViewTableViewCell : UITableViewCell
- (void)reloadData:(MingZhuPingYiDetailsModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *detailsLabel;
@property (weak, nonatomic) IBOutlet UILabel *daojishiLabel;
@property (weak, nonatomic) IBOutlet UILabel *tianMLabel;
@property (weak, nonatomic) IBOutlet UILabel *shiMLabel;
@property (weak, nonatomic) IBOutlet UILabel *fenMLabel;
@property (weak, nonatomic) IBOutlet UILabel *tianLabel;
@property (weak, nonatomic) IBOutlet UILabel *shiLabel;
@property (weak, nonatomic) IBOutlet UILabel *fenLabel;
@property (weak, nonatomic) IBOutlet UILabel *daojishibudongLabel;

/**完整倒计时*/
@property (weak, nonatomic) IBOutlet UILabel *finaldaojishiMLabel;
@property (weak, nonatomic) IBOutlet UIView *finaldaojishiBottomView;

@end

NS_ASSUME_NONNULL_END
