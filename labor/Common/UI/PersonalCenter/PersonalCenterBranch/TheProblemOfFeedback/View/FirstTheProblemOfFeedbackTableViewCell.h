//
//  FirstTheProblemOfFeedbackTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/10/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstTheProblemOfFeedbackTableViewCell;
@protocol FirstTheProblemOfFeedbackTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)FirstTheProblemOfFeedbackTableViewCellActiondelegate:(FirstTheProblemOfFeedbackTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface FirstTheProblemOfFeedbackTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (nonatomic,weak) id<FirstTheProblemOfFeedbackTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
