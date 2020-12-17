//
//  FirstTheMessageCenterTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheMessageCenterModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstTheMessageCenterTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *colorBottomView;
- (void)reloadData:(TheMessageCenterModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

@end

NS_ASSUME_NONNULL_END
