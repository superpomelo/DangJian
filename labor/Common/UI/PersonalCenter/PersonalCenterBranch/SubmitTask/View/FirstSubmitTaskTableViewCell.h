//
//  FirstSubmitTaskTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstSubmitTaskTableViewCell;
@protocol FirstSubmitTaskTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)FirstSubmitTaskTableViewCellActiondelegate:(FirstSubmitTaskTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface FirstSubmitTaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (nonatomic,weak) id<FirstSubmitTaskTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
