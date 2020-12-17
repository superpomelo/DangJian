//
//  SexViewController.h
//  labor
//
//  Created by 狍子 on 2020/9/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^SexresultBlock)(NSString*);

@interface SexViewController : UIViewController
@property (nonatomic, copy)SexresultBlock resultBlock;
@property (nonatomic,strong)PersonalCenterHomeModel *model;

@end

NS_ASSUME_NONNULL_END
