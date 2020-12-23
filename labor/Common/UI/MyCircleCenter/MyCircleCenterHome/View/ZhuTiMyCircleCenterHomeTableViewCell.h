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

- (void)reloadData:(NewHuoDongModel*)model;
/**灰色背景*/
@property (weak, nonatomic) IBOutlet UIView *midBottomView;
/**用来做效果的小三角图片*/
@property (weak, nonatomic) IBOutlet UIImageView *sanjiaoImageView;
/**左下的1010直角view*/
@property (weak, nonatomic) IBOutlet UIView *zhijiao1010View;

@end

NS_ASSUME_NONNULL_END
