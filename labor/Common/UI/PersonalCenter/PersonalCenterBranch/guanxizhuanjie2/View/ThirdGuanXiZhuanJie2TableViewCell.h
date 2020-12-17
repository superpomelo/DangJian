//
//  ThirdGuanXiZhuanJie2TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class ThirdGuanXiZhuanJie2TableViewCell;
@protocol ThirdGuanXiZhuanJie2TableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)ThirdGuanXiZhuanJie2TableViewCellActiondelegate:(ThirdGuanXiZhuanJie2TableViewCell*)cell textview:(UITextView*)textView;

@end
@interface ThirdGuanXiZhuanJie2TableViewCell : UITableViewCell
@property (nonatomic,weak) id<ThirdGuanXiZhuanJie2TableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

NS_ASSUME_NONNULL_END
