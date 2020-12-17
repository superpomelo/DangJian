//
//  MyFileRequestDatas.h
//  labor
//
//  Created by 狍子 on 2020/9/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MyFileRequestDatas : NSObject
/**图片上传*/
+ (void)informationuploadImgrequestDataWithparameters:(nullable  id)parameters imageDatas:(nullable  id)imageDatas success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;

/**视频上传*/
+ (void)lessonuploadrequestDataWithparameters:(nullable  id)parameters imageDatas:(nullable  id)imageDatas success:(void (^)(id result))success failure:(void (^)(NSError *error))failure;
@end

NS_ASSUME_NONNULL_END
