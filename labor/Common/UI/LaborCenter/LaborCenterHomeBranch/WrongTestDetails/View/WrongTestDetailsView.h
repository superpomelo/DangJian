//
//  WrongTestDetailsView.h
//  labor
//
//  Created by 狍子 on 2020/9/2.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheTestModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface WrongTestDetailsView : UIView
- (void)reloadData:(TheTestModel*)model;
@property (weak, nonatomic) IBOutlet UILabel *titleLabel;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;
@property (weak, nonatomic) IBOutlet UIView *buttonBottomView;

@end

NS_ASSUME_NONNULL_END
