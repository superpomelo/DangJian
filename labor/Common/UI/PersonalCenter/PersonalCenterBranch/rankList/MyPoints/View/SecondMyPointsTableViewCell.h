//
//  SecondMyPointsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondMyPointsTableViewCell;
@protocol SecondMyPointsTableViewCellDelegate <NSObject>
/**排行榜*/
- (void)SecondMyPointsTableViewCellrankListButtonActiondelegate:(SecondMyPointsTableViewCell*)cell;
/**积分兑换*/
- (void)SecondMyPointsTableViewCelljiFenDuiHuanButtonActiondelegate:(SecondMyPointsTableViewCell*)cell;

@end
@interface SecondMyPointsTableViewCell : UITableViewCell
@property (nonatomic,weak) id<SecondMyPointsTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

NS_ASSUME_NONNULL_END
