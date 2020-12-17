//
//  SecondSubmitTaskTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN
@class SecondSubmitTaskTableViewCell;
@protocol SecondSubmitTaskTableViewCellDelegate <NSObject>
/**点击图片*/
- (void)SecondSubmitTaskTableViewCellButtonActiondelegate:(SecondSubmitTaskTableViewCell*)cell button:(UIButton*)sender tag:(int)tag;

@end
@interface SecondSubmitTaskTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIButton *button1;
@property (weak, nonatomic) IBOutlet UIImageView *image1View;
@property (weak, nonatomic) IBOutlet UIButton *button2;
@property (weak, nonatomic) IBOutlet UIImageView *image2View;

@property (weak, nonatomic) IBOutlet UIButton *button3;
@property (weak, nonatomic) IBOutlet UIImageView *image3View;
@property (weak, nonatomic) IBOutlet UIButton *button4;
@property (weak, nonatomic) IBOutlet UIImageView *image4View;
@property (weak, nonatomic) IBOutlet UIButton *button5;
@property (weak, nonatomic) IBOutlet UIImageView *image5View;
@property (weak, nonatomic) IBOutlet UIButton *button6;
@property (weak, nonatomic) IBOutlet UIImageView *image6View;
@property (weak, nonatomic) IBOutlet UIButton *button7;
@property (weak, nonatomic) IBOutlet UIImageView *image7View;
@property (weak, nonatomic) IBOutlet UIButton *button8;
@property (weak, nonatomic) IBOutlet UIImageView *image8View;
@property (weak, nonatomic) IBOutlet UIButton *button9;
@property (weak, nonatomic) IBOutlet UIImageView *image9View;
@property (nonatomic,weak) id<SecondSubmitTaskTableViewCellDelegate>delegate;
@property (weak, nonatomic) IBOutlet UIView *bottomView1;
@property (weak, nonatomic) IBOutlet UIView *bottomView2;
@property (weak, nonatomic) IBOutlet UIView *bottomView3;
@property (weak, nonatomic) IBOutlet UIView *bottomView4;
@property (weak, nonatomic) IBOutlet UIView *bottomView5;
@property (weak, nonatomic) IBOutlet UIView *bottomView6;
@property (weak, nonatomic) IBOutlet UIView *bottomView7;
@property (weak, nonatomic) IBOutlet UIView *bottomView8;
@property (weak, nonatomic) IBOutlet UIView *bottomView9;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView1;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView2;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView3;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView4;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView5;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView6;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView7;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView8;
@property (weak, nonatomic) IBOutlet UIImageView *addImageView9;
@end

NS_ASSUME_NONNULL_END
