//
//  FirstPublishTaskTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/8/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class FirstPublishTaskTableViewCell;
@protocol FirstPublishTaskTableViewCellDelegate <NSObject>
/**点击图片*/
- (void)FirstPublishTaskTableViewCellButtonActiondelegate:(FirstPublishTaskTableViewCell*)cell button:(UIButton*)sender tag:(int)tag;
/**文本框代理*/
- (void)FirstPublishTaskTableViewCellActiondelegate:(FirstPublishTaskTableViewCell*)cell textview:(UITextView*)textView;
/**班级选择*/
- (void)FirstPublishTaskTableViewCellClassActiondelegate:(FirstPublishTaskTableViewCell*)cell;
/**开始时间*/
- (void)FirstPublishTaskTableViewCellStartTimeActiondelegate:(FirstPublishTaskTableViewCell*)cell;
/**结束时间*/
- (void)FirstPublishTaskTableViewCellEndTimeActiondelegate:(FirstPublishTaskTableViewCell*)cell;
/**必选*/
- (void)FirstPublishTaskTableViewCellBiXuanActiondelegate:(FirstPublishTaskTableViewCell*)cell;
/**自选*/
- (void)FirstPublishTaskTableViewCellZiXuanActiondelegate:(FirstPublishTaskTableViewCell*)cell;
@end
@interface FirstPublishTaskTableViewCell : UITableViewCell
@property (nonatomic,weak) id<FirstPublishTaskTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UITextView *myTextView;
@property (weak, nonatomic) IBOutlet UILabel *pleaseholdLabel;
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIImageView *image1View;
@property (weak, nonatomic) IBOutlet UIView *bottomView1;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView1;
@property (weak, nonatomic) IBOutlet UITextField *titleTF;
@property (weak, nonatomic) IBOutlet UILabel *classLabel;
@property (weak, nonatomic) IBOutlet UIImageView *biXuanImageView;
@property (weak, nonatomic) IBOutlet UIImageView *ziXuanImageView;
@property (weak, nonatomic) IBOutlet UITextField *pleaceTF;
@property (weak, nonatomic) IBOutlet UILabel *startTimeLabel;
@property (weak, nonatomic) IBOutlet UILabel *endTimeLabel;

@end

NS_ASSUME_NONNULL_END
