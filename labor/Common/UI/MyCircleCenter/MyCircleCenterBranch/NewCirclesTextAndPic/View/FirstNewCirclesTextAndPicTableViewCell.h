//
//  FirstNewCirclesTextAndPicTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstNewCirclesTextAndPicTableViewCell;
@protocol FirstNewCirclesTextAndPicTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)FirstNewCirclesTextAndPicTableViewCellActiondelegate:(FirstNewCirclesTextAndPicTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface FirstNewCirclesTextAndPicTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (nonatomic,weak) id<FirstNewCirclesTextAndPicTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
