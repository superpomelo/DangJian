//
//  FourthMyCircleCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/15.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FourthMyCircleCenterHomeTableViewCell;
@protocol FourthMyCircleCenterHomeTableViewCellDelegate <NSObject>
/**全部/校园圈/视频*/
- (void)FourthMyCircleCenterHomeTableViewCellButtonActiondelegate:(FourthMyCircleCenterHomeTableViewCell*)cell tag:(int)tag;

@end
@interface FourthMyCircleCenterHomeTableViewCell : UITableViewCell
/**全部*/
@property (weak, nonatomic) IBOutlet UIButton *allButton;
/**校园圈*/
@property (weak, nonatomic) IBOutlet UIButton *schoolButton;
/**视频*/
@property (weak, nonatomic) IBOutlet UIButton *videoButton;
@property (nonatomic,weak) id<FourthMyCircleCenterHomeTableViewCellDelegate>delegate;
/**联动*/
@property (weak, nonatomic) IBOutlet UILabel *lineLabel;

@end

NS_ASSUME_NONNULL_END
