//
//  FirstCommentOnHistoryTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "kechengModel.h"
#import "xinwenModel.h"
#import "quanziModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstCommentOnHistoryTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *pinlunLabel;
/** * 原文章：为什么有些人喜欢吃扎撒大声地开声啊始...*/
@property (weak, nonatomic) IBOutlet UILabel *fromLabel;

- (void)reloadDatakecheng:(kechengModel*)model;
- (void)reloadDataxinwen:(xinwenModel*)model;
- (void)reloadDataquanzi:(quanziModel*)model;

@end

NS_ASSUME_NONNULL_END
