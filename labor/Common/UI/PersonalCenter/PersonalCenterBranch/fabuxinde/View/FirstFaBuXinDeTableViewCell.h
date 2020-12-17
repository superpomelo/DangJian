//
//  FirstFaBuXinDeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstFaBuXinDeTableViewCell;
@protocol FirstFaBuXinDeTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)FirstFaBuXinDeTableViewCellActiondelegate:(FirstFaBuXinDeTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface FirstFaBuXinDeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (nonatomic,weak) id<FirstFaBuXinDeTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

NS_ASSUME_NONNULL_END
