//
//  PerfectClassViewController.h
//  labor
//
//  Created by 狍子 on 2020/10/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PerfectClassModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^PerfectClassresultBlock)(PerfectClassModel*);

@interface PerfectClassViewController : UIViewController
@property (nonatomic, copy)PerfectClassresultBlock resultBlock;
@property(nonatomic,strong)NSString *deptpartmentId;
@end

NS_ASSUME_NONNULL_END
