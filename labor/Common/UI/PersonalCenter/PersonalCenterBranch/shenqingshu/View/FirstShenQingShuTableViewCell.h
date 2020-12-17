//
//  FirstShenQingShuTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstShenQingShuTableViewCell;
@protocol FirstShenQingShuTableViewCellDelegate <NSObject>
/**文本框代理*/
- (void)FirstShenQingShuTableViewCellActiondelegate:(FirstShenQingShuTableViewCell*)cell textview:(UITextView*)textView;

@end
@interface FirstShenQingShuTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (nonatomic,weak) id<FirstShenQingShuTableViewCellDelegate>delegate;
@end

NS_ASSUME_NONNULL_END
