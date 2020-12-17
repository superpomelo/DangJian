//
//  FirstMyCollectionTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionKeChengModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyCollectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *teacherNameLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (void)reloadData:(CollectionKeChengModel*)model;

@end

NS_ASSUME_NONNULL_END
