//
//  GetCommentVoListModel.m
//  labor
//
//  Created by 狍子 on 2020/9/14.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  评论列表model

#import "GetCommentVoListModel.h"

@implementation GetCommentVoListModel
+ (NSDictionary *)mj_replacedKeyFromPropertyName {
    return @{@"idx" : @"id"};
}
@end
