//
//  VotingQuestionVosModel.h
//  labor
//
//  Created by 狍子 on 2020/11/18.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface VotingQuestionVosModel : NSObject
@property (nonatomic, assign) int idx;
@property (nonatomic, copy) NSString *questionImg;
@property (nonatomic, copy) NSString *questionText;

@property (nonatomic, copy) NSString *questionTitle;
@property (nonatomic, copy) NSString *resume;

@property (nonatomic, assign) int type;

@property (nonatomic, assign) int userNum;
@property (nonatomic, assign) int votingId;

@end

NS_ASSUME_NONNULL_END
