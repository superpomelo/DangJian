//
//  PerfectClassModel.h
//  labor
//
//  Created by 狍子 on 2020/10/17.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PerfectClassModel : NSObject
@property (nonatomic, assign) int classId;
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int departmentId;
@end

NS_ASSUME_NONNULL_END
