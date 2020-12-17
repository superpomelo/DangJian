//
//  FirstMyCircleCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstMyCircleCenterHomeTableViewCell;
@protocol FirstMyCircleCenterHomeTableViewCellDelegate <NSObject>
/**签到*/
- (void)FirstMyCircleCenterHomeTableViewCelltheIntegralsignInButtonActiondelegate:(FirstMyCircleCenterHomeTableViewCell*)cell;

@end
@interface FirstMyCircleCenterHomeTableViewCell : UITableViewCell
@property (nonatomic,weak) id<FirstMyCircleCenterHomeTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *hotNumLabel;

@property (weak, nonatomic) IBOutlet UIView *theIntegralsignInButton;
- (void)reloadData:(int)fire;
@end

NS_ASSUME_NONNULL_END
