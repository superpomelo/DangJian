//
//  SecondLearningCenterDetails1NewsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondLearningCenterDetails1NewsTableViewCell;
@protocol SecondLearningCenterDetails1NewsTableViewCellDelegate <NSObject>

- (void)SecondLearningCenterDetails1NewsTableViewCellButtonActiondelegate:(SecondLearningCenterDetails1NewsTableViewCell*)cell button:(UIButton*)sender;

@end
@interface SecondLearningCenterDetails1NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *yueduLabel;
@property (weak, nonatomic) IBOutlet UILabel *dianzanLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dianzanImageView;
@property (weak, nonatomic) IBOutlet UIView *yueduBottomView;
@property (weak, nonatomic) IBOutlet UIView *dianzanBottomView;
@property (weak, nonatomic) IBOutlet UIButton *dianzanButton;
@property (nonatomic,weak) id<SecondLearningCenterDetails1NewsTableViewCellDelegate>delegate;


- (void)reloadData:(int)selectNum;
- (void)reloadData2:(int)dianzanNum;
- (void)reloadData3:(int)dianzanStatus;

@end

NS_ASSUME_NONNULL_END
