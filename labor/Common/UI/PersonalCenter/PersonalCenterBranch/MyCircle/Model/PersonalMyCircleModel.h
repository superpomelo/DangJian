//
//  PersonalMyCircleModel.h
//  labor
//
//  Created by 狍子 on 2020/9/28.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface PersonalMyCircleModel : NSObject


@property (nonatomic, copy) NSString *content;
/**imgorvid   0视频 1-图片 2文本*/
@property (nonatomic, assign) int imgorvid;

@property (nonatomic, assign) int idx;

@property (nonatomic, copy) NSString *cover;
@property (nonatomic, copy) NSString *createTime;
@property (nonatomic, assign) int delFlag;
@end

NS_ASSUME_NONNULL_END
