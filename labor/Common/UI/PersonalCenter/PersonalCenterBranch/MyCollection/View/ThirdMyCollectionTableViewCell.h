//
//  ThirdMyCollectionTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionXinWenModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThirdMyCollectionTableViewCell : UITableViewCell
- (void)reloadData:(CollectionXinWenModel*)model;
@property (weak, nonatomic) IBOutlet UIImageView *mImageView;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *fromAndTimeLabel;

@end

NS_ASSUME_NONNULL_END
