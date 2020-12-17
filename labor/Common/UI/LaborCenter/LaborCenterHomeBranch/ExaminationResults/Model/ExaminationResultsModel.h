//
//  ExaminationResultsModel.h
//  labor
//
//  Created by 狍子 on 2020/9/9.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface ExaminationResultsModel : NSObject
/***/
@property (nonatomic, assign) int answerTime;
@property (nonatomic, assign) int examId;
@property (nonatomic, assign) int idx;

@property (nonatomic, copy) NSString *title;

@property (nonatomic, assign) int userScore;

@property (nonatomic, assign) int wrongNum;
/**总题数*/
@property (nonatomic, assign) int itemCount;

@property (nonatomic, copy) NSString *endTime;

@end

NS_ASSUME_NONNULL_END
