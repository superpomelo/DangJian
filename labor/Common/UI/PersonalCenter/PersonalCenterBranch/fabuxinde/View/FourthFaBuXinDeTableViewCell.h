//
//  FourthFaBuXinDeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FourthFaBuXinDeTableViewCell;
@protocol FourthFaBuXinDeTableViewCellDelegate <NSObject>
/**提交*/
- (void)FourthFaBuXinDeTableViewCellActiondelegate:(FourthFaBuXinDeTableViewCell*)cell;

@end
@interface FourthFaBuXinDeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic,weak) id<FourthFaBuXinDeTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
