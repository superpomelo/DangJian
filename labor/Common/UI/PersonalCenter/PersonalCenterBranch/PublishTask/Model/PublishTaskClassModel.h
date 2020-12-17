//
//  PublishTaskClassModel.h
//  labor
//
//  Created by 狍子 on 2020/10/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PublishTaskClassModel : NSObject
@property (nonatomic, copy) NSString *name;
@property (nonatomic, assign) int classId;
@property (nonatomic, copy) id departmentId;
@property (nonatomic, copy) id userId;
@property (nonatomic, copy) id count;


@end

NS_ASSUME_NONNULL_END
