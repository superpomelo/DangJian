//
//  FirstNewCirclesTextAndVideoTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstNewCirclesTextAndVideoTableViewCell;
@protocol FirstNewCirclesTextAndVideoTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)FirstNewCirclesTextAndVideoTableViewCellActiondelegate:(FirstNewCirclesTextAndVideoTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface FirstNewCirclesTextAndVideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (nonatomic,weak) id<FirstNewCirclesTextAndVideoTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
