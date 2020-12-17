//
//  SecondNewCirclesTextAndVideoTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondNewCirclesTextAndVideoTableViewCell;
@protocol SecondNewCirclesTextAndVideoTableViewCellDelegate <NSObject>

- (void)SecondNewCirclesTextAndVideoTableViewCellActiondelegate:(SecondNewCirclesTextAndVideoTableViewCell*)cell;

@end
@interface SecondNewCirclesTextAndVideoTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *picImageView;

@property (weak, nonatomic) IBOutlet UIView *playBottomView;
@property (nonatomic,weak) id<SecondNewCirclesTextAndVideoTableViewCellDelegate>delegate;

- (void)reloadDataImg:(UIImage*)img;
- (void)reloadDatavideo:(NSURL*)video;

@end

NS_ASSUME_NONNULL_END
