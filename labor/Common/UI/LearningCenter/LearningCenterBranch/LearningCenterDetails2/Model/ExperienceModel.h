//
//  ExperienceModel.h
//  labor
//
//  Created by 狍子 on 2020/9/7.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExperienceModel : NSObject
/***/
@property (nonatomic, copy) NSString * avatar;
@property (nonatomic, copy) NSString * body;
@property (nonatomic, assign) int courseId;
/**id*/
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int lessonId;
@property (nonatomic, assign) int tenantId;
@property (nonatomic, copy) NSString *userName;
@property (nonatomic, copy) NSString *createTime;
@end

NS_ASSUME_NONNULL_END
