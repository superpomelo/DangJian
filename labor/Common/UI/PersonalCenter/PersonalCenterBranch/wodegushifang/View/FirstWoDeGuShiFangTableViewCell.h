//
//  FirstWoDeGuShiFangTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WoDeGuShiListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstWoDeGuShiFangTableViewCell : UITableViewCell
- (void)reloadData:(WoDeGuShiListModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

NS_ASSUME_NONNULL_END
