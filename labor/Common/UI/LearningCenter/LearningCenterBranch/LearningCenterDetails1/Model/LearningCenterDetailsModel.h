//
//  LearningCenterDetailsModel.h
//  labor
//
//  Created by 狍子 on 2020/9/11.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface LearningCenterDetailsModel : NSObject
@property (nonatomic, copy) NSString *body;
@property (nonatomic, assign) int idx;
/**vid ，text ，img*/
@property (nonatomic, copy) NSString *type;
/***/
@property (nonatomic, assign) int selectNum;

@end

NS_ASSUME_NONNULL_END
