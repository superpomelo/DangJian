//
//  SecondTaskAssessmentDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TaskAssessmentDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondTaskAssessmentDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *time1BottomView;
@property (weak, nonatomic) IBOutlet UIView *pleaceBottomView1;
@property (weak, nonatomic) IBOutlet UIView *time2BottomView;
@property (weak, nonatomic) IBOutlet UIView *pleaceBottomView2;
- (void)reloadData:(TaskAssessmentDetailsModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *lookNumberLabel;
@property (weak, nonatomic) IBOutlet UILabel *baoMingLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *activeDetailLabel;
@property (weak, nonatomic) IBOutlet UIView *biaoqianBottomView;

@end

NS_ASSUME_NONNULL_END
