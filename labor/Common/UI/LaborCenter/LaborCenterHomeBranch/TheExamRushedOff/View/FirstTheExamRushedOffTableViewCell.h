//
//  FirstTheExamRushedOffTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheExamRushedOffModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstTheExamRushedOffTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *statusLabel;
@property (weak, nonatomic) IBOutlet UILabel *starttimeLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (weak, nonatomic) IBOutlet UILabel *endtimeLabel;

- (void)reloadData:(TheExamRushedOffModel*)model;

@end

NS_ASSUME_NONNULL_END
