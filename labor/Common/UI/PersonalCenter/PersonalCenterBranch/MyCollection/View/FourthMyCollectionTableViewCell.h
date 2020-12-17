//
//  FourthMyCollectionTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "CollectionquanziModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FourthMyCollectionTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
- (void)reloadData:(CollectionquanziModel*)model;

@end

NS_ASSUME_NONNULL_END
