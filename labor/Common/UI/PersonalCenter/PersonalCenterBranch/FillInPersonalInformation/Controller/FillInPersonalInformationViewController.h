//
//  FillInPersonalInformationViewController.h
//  labor
//
//  Created by 狍子 on 2020/9/4.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^FillInPersonalInformationresultBlock)(NSString*);

@interface FillInPersonalInformationViewController : UIViewController
@property (nonatomic,strong)PersonalCenterHomeModel *model;
@property (nonatomic, copy)FillInPersonalInformationresultBlock resultBlock;

@end

NS_ASSUME_NONNULL_END
