//
//  ThirdPersonalMyCircleTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalMyCircleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ThirdPersonalMyCircleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
- (void)reloadData:(PersonalMyCircleModel*)model;
@property (weak, nonatomic) IBOutlet UIImageView *bofangImageView;

@end

NS_ASSUME_NONNULL_END
