//
//  DangYuanXiangQinDetailsViewController.h
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "VotingQuestionVosModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface DangYuanXiangQinDetailsViewController : UIViewController
@property(nonatomic,strong)NSString *votingId;
@property(nonatomic,strong)VotingQuestionVosModel *model;
@property (weak, nonatomic) IBOutlet UIButton *toupiaoButton;

@end

NS_ASSUME_NONNULL_END
