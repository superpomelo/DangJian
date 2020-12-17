//
//  SevenMyCircleCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCircleCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SevenMyCircleCenterDetails1TableViewCell : UITableViewCell
- (void)reloadData:(MyCircleCenterHomeModel*)model;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIView *toumingView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@end

NS_ASSUME_NONNULL_END
