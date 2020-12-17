//
//  NewSecondPersonalCenterHomeTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class NewSecondPersonalCenterHomeTableViewCell;
@protocol NewSecondPersonalCenterHomeTableViewCellDelegate <NSObject>
/***/
- (void)NewSecondPersonalCenterHomeTableViewCellButtonActiondelegate:(NewSecondPersonalCenterHomeTableViewCell*)cell tags:(int)tags;

@end
@interface NewSecondPersonalCenterHomeTableViewCell : UITableViewCell
@property (nonatomic,weak) id<NewSecondPersonalCenterHomeTableViewCellDelegate>delegate;
/**个人信息*/
@property (weak, nonatomic) IBOutlet UILabel *gerenxinxiLabel;
/**入党申请*/
@property (weak, nonatomic) IBOutlet UILabel *rudangshenqingLabel;
/**党费查询*/
@property (weak, nonatomic) IBOutlet UILabel *dangfeichaxunLabel;
/**我的收藏*/
@property (weak, nonatomic) IBOutlet UILabel *wodeshoucangLabel;
/**我的评论*/
@property (weak, nonatomic) IBOutlet UILabel *wodepinglunLabel;
/**我的考试*/
@property (weak, nonatomic) IBOutlet UILabel *wodekaoshiLabel;
/**我的书屋*/
@property (weak, nonatomic) IBOutlet UILabel *wodeshuwuLabel;
/**学习心得*/
@property (weak, nonatomic) IBOutlet UILabel *xuexixindeLabel;
/**组织活动*/
@property (weak, nonatomic) IBOutlet UILabel *zuzhihuodongLabel;
/**发布故事坊*/
@property (weak, nonatomic) IBOutlet UILabel *fabugushiLabel;
/**关系转接*/
@property (weak, nonatomic) IBOutlet UILabel *guanxizhuanjieLabel;
/**我的设置*/
@property (weak, nonatomic) IBOutlet UILabel *wodeshezhiLabel;

@end

NS_ASSUME_NONNULL_END
