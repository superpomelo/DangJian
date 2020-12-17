//
//  RankListModel.h
//  labor
//
//  Created by 狍子 on 2020/9/23.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface RankListModel : NSObject

@property (nonatomic, copy) NSString *avatar;
@property (nonatomic, assign) int numerical;
@property (nonatomic, copy) NSString *realName;
@property (nonatomic, assign) int userId;
@property (nonatomic, assign) int username;
@end

NS_ASSUME_NONNULL_END
