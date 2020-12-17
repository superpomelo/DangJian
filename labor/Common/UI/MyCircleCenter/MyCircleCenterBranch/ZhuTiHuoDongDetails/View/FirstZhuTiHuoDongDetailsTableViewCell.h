//
//  FirstZhuTiHuoDongDetailsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "ZhuTiHuoDongModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstZhuTiHuoDongDetailsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *coverImageView;
- (void)reloadData:(ZhuTiHuoDongModel*)model;

@end

NS_ASSUME_NONNULL_END
