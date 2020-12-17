//
//  SecondFaBuGuShiVTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondFaBuGuShiVTableViewCell;
@protocol SecondFaBuGuShiVTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)SecondFaBuGuShiVTableViewCellActiondelegate:(SecondFaBuGuShiVTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface SecondFaBuGuShiVTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic,weak) id<SecondFaBuGuShiVTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@end

NS_ASSUME_NONNULL_END
