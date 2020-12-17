//
//  FirstExaminationResultsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/7.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ExaminationResultsModel.h"

NS_ASSUME_NONNULL_BEGIN
@class FirstExaminationResultsTableViewCell;
@protocol FirstExaminationResultsTableViewCellDelegate <NSObject>
/**查看考卷/重新考试*/
- (void)FirstExaminationResultsTableViewCellButtonActiondelegate:(FirstExaminationResultsTableViewCell*)cell button:(UIButton*)sender;

@end
@interface FirstExaminationResultsTableViewCell : UITableViewCell
/**查看考卷*/
@property (weak, nonatomic) IBOutlet UIButton *textDetailButton;
/**再考一次*/
@property (weak, nonatomic) IBOutlet UIButton *againButton;
/**总题数*/
@property (weak, nonatomic) IBOutlet UILabel *totalQuestionNumLabel;
/**错题数*/
@property (weak, nonatomic) IBOutlet UILabel *wrongQuestionLabel;
/**考试用时*/
@property (weak, nonatomic) IBOutlet UILabel *UseTimeLabel;
/**总分数*/
@property (weak, nonatomic) IBOutlet UILabel *userScoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;
@property (weak, nonatomic) IBOutlet UIView *centerBottomView;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property (weak, nonatomic) IBOutlet UIView *topbottomView;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *centerBottomViewLatoutconstraint;

@property (nonatomic,weak) id<FirstExaminationResultsTableViewCellDelegate>delegate;

- (void)reloadData:(ExaminationResultsModel*)model;
@end

NS_ASSUME_NONNULL_END
