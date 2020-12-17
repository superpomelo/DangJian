//
//  FirstAboutUSTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstAboutUSTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIImageView *myImageView;
@property (weak, nonatomic) IBOutlet UILabel *appNameLabel;
@property (weak, nonatomic) IBOutlet UILabel *banbenhaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *wangzhiLabel;
@property (weak, nonatomic) IBOutlet UILabel *gongzhonghaoLabel;
@property (weak, nonatomic) IBOutlet UILabel *phoneLabel;
@property (weak, nonatomic) IBOutlet UILabel *emailLabel;

@end

NS_ASSUME_NONNULL_END
