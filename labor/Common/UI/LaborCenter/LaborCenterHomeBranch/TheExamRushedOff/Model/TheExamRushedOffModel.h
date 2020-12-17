//
//  TheExamRushedOffModel.h
//  labor
//
//  Created by 狍子 on 2020/9/5.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheExamRushedOffModel : NSObject
/***/
@property (nonatomic, copy) NSString * endTime;
@property (nonatomic, assign) int examPaperId;
/**id*/
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int itemCount;
@property (nonatomic, copy) NSString *startTime;
@property (nonatomic, assign) int status;
@property (nonatomic, assign) int sumScore;
@property (nonatomic, copy) NSString *title;
@property (nonatomic, assign) int mysacore;

@end

NS_ASSUME_NONNULL_END
