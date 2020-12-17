//
//  SecondFaBuXinDeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondFaBuXinDeTableViewCell;
@protocol SecondFaBuXinDeTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)SecondFaBuXinDeTableViewCellActiondelegate:(SecondFaBuXinDeTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface SecondFaBuXinDeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (nonatomic,weak) id<SecondFaBuXinDeTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *bottomView;


@end

NS_ASSUME_NONNULL_END
