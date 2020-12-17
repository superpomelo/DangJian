//
//  SixthMyCircleCenterDetails1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "MyCircleCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
@class SixthMyCircleCenterDetails1TableViewCell;
@protocol SixthMyCircleCenterDetails1TableViewCellDelegate <NSObject>
/**预览图片*/
- (void)SixthMyCircleCenterDetails1TableViewCellActiondelegate:(SixthMyCircleCenterDetails1TableViewCell*)cell location:(NSInteger)loc;


@end
@interface SixthMyCircleCenterDetails1TableViewCell : UITableViewCell
@property (nonatomic,weak) id<SixthMyCircleCenterDetails1TableViewCellDelegate>delegate;

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

@property (weak, nonatomic) IBOutlet UIView *bottomView1;
@property (weak, nonatomic) IBOutlet UIView *bottomView2;
@property (weak, nonatomic) IBOutlet UIView *bottomView3;
@property (weak, nonatomic) IBOutlet UIView *bottomView4;
@property (weak, nonatomic) IBOutlet UIView *bottomView5;
@property (weak, nonatomic) IBOutlet UIView *bottomView6;
@property (weak, nonatomic) IBOutlet UIView *bottomView7;
@property (weak, nonatomic) IBOutlet UIView *bottomView8;
@property (weak, nonatomic) IBOutlet UIView *bottomView9;
- (void)reloadData:(MyCircleCenterHomeModel*)model;
@property(nonatomic,strong)NSArray *imageArray;

@end

NS_ASSUME_NONNULL_END
