//
//  SecondGuanXiZhuanJie1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/13.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Guanxizhuanjie1Model.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondGuanXiZhuanJie1TableViewCell : UITableViewCell
- (void)reloadData:(Guanxizhuanjie1Model*)model;
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;

@end

NS_ASSUME_NONNULL_END
