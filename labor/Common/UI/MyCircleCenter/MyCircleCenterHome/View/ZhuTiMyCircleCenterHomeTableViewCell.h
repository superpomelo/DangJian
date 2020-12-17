//
//  ZhuTiMyCircleCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "NewHuoDongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface ZhuTiMyCircleCenterHomeTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *biaoqianBottomView;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *typeLabel;
@property (weak, nonatomic) IBOutlet UILabel *placeLabel;
@property (weak, nonatomic) IBOutlet UILabel *timeLabel;
@property (weak, nonatomic) IBOutlet UILabel *renshuLabel;
@property (weak, nonatomic) IBOutlet UIImageView *myimageView;
- (void)reloadData:(NewHuoDongModel*)model;

@end

NS_ASSUME_NONNULL_END
