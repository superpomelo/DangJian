//
//  FirstFrameOfTheVideo.h
//  labor
//
//  Created by 狍子 on 2020/9/5.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  获取视频第一帧

#import <Foundation/Foundation.h>
NS_ASSUME_NONNULL_BEGIN

@interface FirstFrameOfTheVideo : NSObject
+ (UIImage *)firstFrameWithVideoURL:(NSURL *)url size:(CGSize)size;
@end

NS_ASSUME_NONNULL_END
