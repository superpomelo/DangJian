//
//  FirstPersonalMyCircleTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalMyCircleModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstPersonalMyCircleTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;
- (void)reloadData:(PersonalMyCircleModel*)model;

@end

NS_ASSUME_NONNULL_END
