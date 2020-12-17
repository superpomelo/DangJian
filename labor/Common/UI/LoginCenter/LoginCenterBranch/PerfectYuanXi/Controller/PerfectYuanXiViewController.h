//
//  PerfectYuanXiViewController.h
//  labor
//
//  Created by 狍子 on 2020/10/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PerfectYuanXiModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^PerfectYuanXiresultBlock)(PerfectYuanXiModel*);
@interface PerfectYuanXiViewController : UIViewController
@property (nonatomic, copy)PerfectYuanXiresultBlock resultBlock;
@property(nonatomic,strong)NSString *deptId;

@end

NS_ASSUME_NONNULL_END
