//
//  PerfectSchoolViewController.h
//  labor
//
//  Created by 狍子 on 2020/10/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "SchoolNameModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^PerfectSchoolresultBlock)(SchoolNameModel*);

@interface PerfectSchoolViewController : UIViewController
@property (nonatomic, copy)PerfectSchoolresultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
