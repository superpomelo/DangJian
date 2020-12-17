//
//  ThirdLearningCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "GetCommentVoListModel.h"

NS_ASSUME_NONNULL_BEGIN
@class ThirdLearningCenterDetails1TableViewCell;
@protocol ThirdLearningCenterDetails1TableViewCellDelegate <NSObject>
- (void)ThirdLearningCenterDetails1TableViewCellButtonActiondelegate:(ThirdLearningCenterDetails1TableViewCell*)cell button:(UIButton*)sender index:(NSIndexPath*)indexpath;

@end
@interface ThirdLearningCenterDetails1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *userNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *dianzanliangLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dianzanImageView;


@property (nonatomic,weak) id<ThirdLearningCenterDetails1TableViewCellDelegate>delegate;
@property (nonatomic,strong)NSIndexPath*indexpath;
- (void)reloadData:(GetCommentVoListModel*)model;
@end

NS_ASSUME_NONNULL_END
