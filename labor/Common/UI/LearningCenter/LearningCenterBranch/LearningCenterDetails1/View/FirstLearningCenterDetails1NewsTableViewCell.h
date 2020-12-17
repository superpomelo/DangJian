//
//  FirstLearningCenterDetails1NewsTableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/11/4.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "LearningCenterDetailsModel.h"
#import <WebKit/WebKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstLearningCenterDetails1NewsTableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UIView *bottomView;
@property (weak, nonatomic) IBOutlet WKWebView *wkView;

- (void)reloadData:(LearningCenterDetailsModel*)model;
@end

NS_ASSUME_NONNULL_END
