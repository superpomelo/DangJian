//
//  FirstWoDeXinDeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "WodexindeListModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstWoDeXinDeTableViewCell : UITableViewCell
- (void)reloadData:(WodexindeListModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *bodyLabel;

@end

NS_ASSUME_NONNULL_END
