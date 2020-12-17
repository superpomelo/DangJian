//
//  SecondTheIntegralsignInTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondTheIntegralsignInTableViewCell;
@protocol SecondTheIntegralsignInTableViewCellDelegate <NSObject>

/**点击签到*/
- (void)SecondTheIntegralsignInTableViewCellButtonActiondelegate:(SecondTheIntegralsignInTableViewCell*)cell;

@end
@interface SecondTheIntegralsignInTableViewCell : UITableViewCell
@property (nonatomic,weak) id<SecondTheIntegralsignInTableViewCellDelegate>delegate;
/**签到*/
@property (weak, nonatomic) IBOutlet UIButton *qianDaoButton;
/**分*/
@property (weak, nonatomic) IBOutlet UILabel *totalLabel;
/**已连续签到x天*/
@property (weak, nonatomic) IBOutlet UILabel *daysLabel;
@property (weak, nonatomic) IBOutlet UIImageView *qiandaobeijingView;

@end

NS_ASSUME_NONNULL_END
