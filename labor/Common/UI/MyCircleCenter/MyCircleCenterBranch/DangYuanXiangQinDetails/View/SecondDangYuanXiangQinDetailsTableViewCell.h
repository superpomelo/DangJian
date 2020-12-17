//
//  SecondDangYuanXiangQinDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/19.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VotingQuestionVosModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondDangYuanXiangQinDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
- (void)reloadData:(VotingQuestionVosModel*)model;

@end

NS_ASSUME_NONNULL_END
