//
//  SecondWrongTestTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/2.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheTestModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface SecondWrongTestTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *leftLabel;
- (void)reloadData:(NSDictionary*)dic model:(TheTestModel*)model;
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet UIView *rightOrWrongBottomView;
@property (weak, nonatomic) IBOutlet UIImageView *rightOrWrongImageView;

@end

NS_ASSUME_NONNULL_END
