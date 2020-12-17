//
//  MyPointsModel.h
//  labor
//
//  Created by 狍子 on 2020/9/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyPointsModel : NSObject

/**id*/
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int integralId;
@property (nonatomic, assign) int numerical;
@property (nonatomic, assign) int userId;
@property (nonatomic, assign) int type;
@property (nonatomic, copy) NSString *createTime;



@end

NS_ASSUME_NONNULL_END
