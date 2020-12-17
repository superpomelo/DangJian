//
//  MingZuModel.h
//  labor
//
//  Created by 狍子 on 2020/11/19.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface MingZuModel : NSObject
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int value;

//@property (nonatomic, assign) int infoId;
@property (nonatomic, copy) NSString *label;

@property (nonatomic, copy) NSString *remarks;
@property (nonatomic, copy) NSString *descriptionx;

@end

NS_ASSUME_NONNULL_END
