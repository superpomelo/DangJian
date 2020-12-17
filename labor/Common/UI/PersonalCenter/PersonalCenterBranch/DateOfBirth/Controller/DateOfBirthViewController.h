//
//  DateOfBirthViewController.h
//  labor
//
//  Created by 狍子 on 2020/9/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "PersonalCenterHomeModel.h"

NS_ASSUME_NONNULL_BEGIN
typedef void(^DateOfBirthresultBlock)(NSString*);

@interface DateOfBirthViewController : UIViewController
@property (nonatomic, copy)DateOfBirthresultBlock resultBlock;
@property (nonatomic,strong)PersonalCenterHomeModel *model;
/**0-生日，1-参加工作日期，2-入党日期*/
@property (nonatomic,assign)int timetype;
@property (nonatomic,strong)NSString *titlestr;


@end

NS_ASSUME_NONNULL_END
