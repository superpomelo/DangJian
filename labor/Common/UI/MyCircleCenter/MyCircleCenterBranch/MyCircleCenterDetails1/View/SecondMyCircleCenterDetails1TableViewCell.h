//
//  SecondMyCircleCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCircleCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondMyCircleCenterDetails1TableViewCell : UITableViewCell
- (void)reloadData:(MyCircleCenterHomeModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end

NS_ASSUME_NONNULL_END
