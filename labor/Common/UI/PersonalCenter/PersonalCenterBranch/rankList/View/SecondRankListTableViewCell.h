//
//  SecondRankListTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "RankListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondRankListTableViewCell : UITableViewCell
- (void)reloadData:(RankListModel*)model indexPath:(NSIndexPath*)indexPath;
@property (weak, nonatomic) IBOutlet UILabel *numLabel;
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *usernameLabel;
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;

@end

NS_ASSUME_NONNULL_END
