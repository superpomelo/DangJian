//
//  FirstFaBuGuShiVTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstFaBuGuShiVTableViewCell;
@protocol FirstFaBuGuShiVTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)FirstFaBuGuShiVTableViewCellActiondelegate:(FirstFaBuGuShiVTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface FirstFaBuGuShiVTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
/**故事坊主题*/
@property (weak, nonatomic) IBOutlet UILabel *topTitleLabel;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (nonatomic,weak) id<FirstFaBuGuShiVTableViewCellDelegate>delegate;

@end

NS_ASSUME_NONNULL_END
