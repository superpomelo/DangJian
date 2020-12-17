//
//  ExaminationResultsViewController.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  成绩结果

#import <UIKit/UIKit.h>
#import "TheExamRushedOffModel.h"
#import "TheTestViewController.h"

NS_ASSUME_NONNULL_BEGIN

@interface ExaminationResultsViewController : UIViewController
@property (nonatomic,strong)TheExamRushedOffModel *model;
@property (nonatomic,assign)ExaminationResultsTypeState from;

@end

NS_ASSUME_NONNULL_END
