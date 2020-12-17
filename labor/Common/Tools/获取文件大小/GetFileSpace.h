//
//  GetFileSpace.h
//  labor
//
//  Created by 狍子 on 2020/10/27.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface GetFileSpace : NSObject
//获取视频 大小

+ (NSInteger) getFileSize:(NSString*) path;
@end

NS_ASSUME_NONNULL_END
