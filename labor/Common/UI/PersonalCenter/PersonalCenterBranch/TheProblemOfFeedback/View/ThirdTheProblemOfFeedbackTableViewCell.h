//
//  ThirdTheProblemOfFeedbackTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/10/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ThirdTheProblemOfFeedbackTableViewCell;
@protocol ThirdTheProblemOfFeedbackTableViewCellDelegate <NSObject>
/**提交*/
- (void)ThirdTheProblemOfFeedbackTableViewCellActiondelegate:(ThirdTheProblemOfFeedbackTableViewCell*)cell;

@end
@interface ThirdTheProblemOfFeedbackTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *submitButton;
@property (nonatomic,weak) id<ThirdTheProblemOfFeedbackTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
