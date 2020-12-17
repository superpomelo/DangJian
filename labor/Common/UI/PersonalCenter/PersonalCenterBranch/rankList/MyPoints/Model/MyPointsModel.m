//
//  MyPointsModel.m
//  labor
//
//  Created by 狍子 on 2020/9/16.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "MyPointsModel.h"

@implementation MyPointsModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"idx" : @"id"};
}
@end
