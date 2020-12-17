//
//  FirstMingZhuPingYiDetailsViewTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MingZhuPingYiDetailsModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMingZhuPingYiDetailsViewTableViewCell : UITableViewCell
- (void)reloadData:(MingZhuPingYiDetailsModel*)model;
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;

@end

NS_ASSUME_NONNULL_END
