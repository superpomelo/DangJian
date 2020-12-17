//
//  ThirdMyCircleCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/25.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCircleCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
@class ThirdMyCircleCenterDetails1TableViewCell;
@protocol ThirdMyCircleCenterDetails1TableViewCellDelegate <NSObject>
/**预览图片*/
- (void)ThirdMyCircleCenterDetails1TableViewCellActiondelegate:(ThirdMyCircleCenterDetails1TableViewCell*)cell;


@end
@interface ThirdMyCircleCenterDetails1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UIView *bottomView;

@property (nonatomic,weak) id<ThirdMyCircleCenterDetails1TableViewCellDelegate>delegate;

- (void)reloadData:(MyCircleCenterHomeModel*)model;

@end

NS_ASSUME_NONNULL_END
