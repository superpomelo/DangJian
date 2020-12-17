//
//  SecondTheProblemOfFeedbackTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/10/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondTheProblemOfFeedbackTableViewCell;
@protocol SecondTheProblemOfFeedbackTableViewCellDelegate <NSObject>
/**点击图片*/
- (void)SecondTheProblemOfFeedbackTableViewCellButtonActiondelegate:(SecondTheProblemOfFeedbackTableViewCell*)cell button:(UIButton*)sender tag:(int)tag;

@end
@interface SecondTheProblemOfFeedbackTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIImageView *image1View;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIImageView *image2View;

@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIImageView *image3View;
@property (nonatomic,weak) id<SecondTheProblemOfFeedbackTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *bottomView1;
@property (weak, nonatomic) IBOutlet UIView *bottomView2;
@property (weak, nonatomic) IBOutlet UIView *bottomView3;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView3;
@end

NS_ASSUME_NONNULL_END
