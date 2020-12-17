//
//  MobnumberViewController.h
//  labor
//
//  Created by 狍子 on 2020/9/20.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^MobnumberresultBlock)(NSString*);

@interface MobnumberViewController : UIViewController
@property (nonatomic,strong)PersonalCenterHomeModel *model;
@property (nonatomic, copy)MobnumberresultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
