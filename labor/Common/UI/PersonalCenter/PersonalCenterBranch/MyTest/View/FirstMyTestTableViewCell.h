//
//  FirstMyTestTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/4.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheExamRushedOffModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyTestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *scoreBottomView;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
- (void)reloadData:(TheExamRushedOffModel*)model;
@property (weak, nonatomic) IBOutlet UIView *zanweidatiBottomView;

@end

NS_ASSUME_NONNULL_END
