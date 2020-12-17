//
//  FiveMyCircleCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCircleCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
@class FiveMyCircleCenterHomeTableViewCell;
@protocol FiveMyCircleCenterHomeTableViewCellDelegate <NSObject>
/**1收藏，2评论，3转发，4点赞*/
- (void)FiveMyCircleCenterHomeTableViewCellButtonActiondelegate:(FiveMyCircleCenterHomeTableViewCell*)cell indexpath:(NSIndexPath*)indexPath Tag:(int)tag;

@end
@interface FiveMyCircleCenterHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *headImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *schoolLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIImageView *shoucangImageView;
@property (weak, nonatomic) IBOutlet UILabel *shoucangLabel;
@property (weak, nonatomic) IBOutlet UIImageView *dianzanImageView;
@property (weak, nonatomic) IBOutlet UILabel *dianzanLabel;
@property (weak, nonatomic) IBOutlet UIView *myimgBottomView;
@property (weak, nonatomic) IBOutlet UIImageView *playButtonImageView;

@property (nonatomic,weak) id<FiveMyCircleCenterHomeTableViewCellDelegate>delegate;
@property (nonatomic,strong)NSIndexPath *indexPath;

- (void)reloadData:(MyCircleCenterHomeModel*)model;
@end

NS_ASSUME_NONNULL_END
