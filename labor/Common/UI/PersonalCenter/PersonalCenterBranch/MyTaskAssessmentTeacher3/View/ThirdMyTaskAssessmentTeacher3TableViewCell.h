//
//  ThirdMyTaskAssessmentTeacher3TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyTaskAssessmentTeacher3Model.h"

NS_ASSUME_NONNULL_BEGIN
@class ThirdMyTaskAssessmentTeacher3TableViewCell;
@protocol ThirdMyTaskAssessmentTeacher3TableViewCellDelegate <NSObject>
/**预览图片*/
- (void)ThirdMyTaskAssessmentTeacher3TableViewCellActiondelegate:(ThirdMyTaskAssessmentTeacher3TableViewCell*)cell;


@end
@interface ThirdMyTaskAssessmentTeacher3TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (nonatomic,weak) id<ThirdMyTaskAssessmentTeacher3TableViewCellDelegate>delegate;

- (void)reloadData:(MyTaskAssessmentTeacher3Model*)model;
@end

NS_ASSUME_NONNULL_END
