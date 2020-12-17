//
//  SecondMyClassTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondMyClassTableViewCell;
@protocol SecondMyClassTableViewCellDelegate <NSObject>
/**提交*/
- (void)SecondMyClassTableViewCellActiondelegate:(SecondMyClassTableViewCell*)cell;

@end
@interface SecondMyClassTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *tijiaoButton;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (nonatomic,weak) id<SecondMyClassTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIImageView *dangqiImageView;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *stepLabel;
@property (weak, nonatomic) IBOutlet UIImageView *stepImageView;

@end

NS_ASSUME_NONNULL_END
