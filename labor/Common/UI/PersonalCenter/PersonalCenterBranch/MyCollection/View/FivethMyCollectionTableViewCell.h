//
//  FivethMyCollectionTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionquanziModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FivethMyCollectionTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;

- (void)reloadData:(CollectionquanziModel*)model;

@end

NS_ASSUME_NONNULL_END
