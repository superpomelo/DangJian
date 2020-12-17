//
//  VotingQuestionVosModel.m
//  labor
//
//  Created by 狍子 on 2020/11/18.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "VotingQuestionVosModel.h"

@implementation VotingQuestionVosModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"idx" : @"id"};
}
@end
