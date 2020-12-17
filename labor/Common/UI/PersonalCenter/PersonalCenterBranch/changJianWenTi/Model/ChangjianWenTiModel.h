//
//  ChangjianWenTiModel.h
//  labor
//
//  Created by 狍子 on 2020/11/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ChangjianWenTiModel : NSObject
@property (nonatomic, assign) int idx;

@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, copy) NSString *question;
@property (nonatomic, copy) NSString *updateTime;
@end

NS_ASSUME_NONNULL_END
