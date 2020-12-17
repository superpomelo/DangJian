//
//  TheTestViewController.h
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheExamRushedOffModel.h"

typedef enum  {

ExaminationResultsHome  = 0, //考试冲关跳转进入
ExaminationResultsPersonal,   //个人中心我的考试跳转进入
    
} ExaminationResultsTypeState; //有哪里跳转进入的
NS_ASSUME_NONNULL_BEGIN

@interface TheTestViewController : UIViewController
@property (nonatomic,strong)TheExamRushedOffModel *model;
@property (nonatomic,assign)ExaminationResultsTypeState from;

@end

NS_ASSUME_NONNULL_END
