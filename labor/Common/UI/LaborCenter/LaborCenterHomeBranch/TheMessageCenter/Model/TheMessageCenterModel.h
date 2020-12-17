//
//  TheMessageCenterModel.h
//  labor
//
//  Created by 狍子 on 2020/10/15.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheMessageCenterModel : NSObject
/***/
@property (nonatomic, copy) NSString *content;
@property (nonatomic, copy) NSString *createTime;

@property (nonatomic, copy) NSString *title;
/**id*/
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int type;

@end

NS_ASSUME_NONNULL_END
