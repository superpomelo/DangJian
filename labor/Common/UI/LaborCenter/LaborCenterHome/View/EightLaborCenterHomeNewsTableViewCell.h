//
//  EightLaborCenterHomeNewsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/9.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class EightLaborCenterHomeNewsTableViewCell;
@protocol EightLaborCenterHomeNewsTableViewCellDelegate <NSObject>

- (void)EightLaborCenterHomeNewsTableViewCellActiondelegate:(EightLaborCenterHomeNewsTableViewCell*)cell index:(NSInteger)index;


@end
@interface EightLaborCenterHomeNewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *labelBottomView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
- (void)reloadData:(id)data;
@property (nonatomic,weak) id<EightLaborCenterHomeNewsTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
