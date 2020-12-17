//
//  FirstDangYuanXiangQinDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VotingQuestionVosModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstDangYuanXiangQinDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
- (void)reloadData:(VotingQuestionVosModel*)model;
@property (weak, nonatomic) IBOutlet UIView *iconBottomView;

@end

NS_ASSUME_NONNULL_END
