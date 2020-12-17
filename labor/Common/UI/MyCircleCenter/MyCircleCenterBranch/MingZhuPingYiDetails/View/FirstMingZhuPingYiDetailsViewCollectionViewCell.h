//
//  FirstMingZhuPingYiDetailsViewCollectionViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VotingQuestionVosModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstMingZhuPingYiDetailsViewCollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *userImageView;
@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *piaoShuLabel;
@property (weak, nonatomic) IBOutlet UIButton *toupiaoButton;
- (void)reloadData:(VotingQuestionVosModel*)model;

@end

NS_ASSUME_NONNULL_END
