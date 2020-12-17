//
//  FirstMyPointsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyPointsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *scoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *weekscoreLabel;
@property (weak, nonatomic) IBOutlet UILabel *monthLabel;
@property (weak, nonatomic) IBOutlet UIImageView *beijingimageview;
@property (weak, nonatomic) IBOutlet UIView *topBottomView;
@property (weak, nonatomic) IBOutlet UIView *topBottom2View;


- (void)reloadUI;
@end

NS_ASSUME_NONNULL_END
