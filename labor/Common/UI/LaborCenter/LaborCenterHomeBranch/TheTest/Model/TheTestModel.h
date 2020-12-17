//
//  TheTestModel.h
//  labor
//
//  Created by 狍子 on 2020/9/7.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface TheTestModel : NSObject
/***/
@property (nonatomic, copy) NSString *answer;
@property (nonatomic, copy) NSString *myanswer;

/**abcd选项数组*/
@property (nonatomic, copy) NSString *optionsContent;
/**id*/
@property (nonatomic, assign) int idx;
@property (nonatomic, assign) int score;
/**题目*/
@property (nonatomic, copy) NSString *stem;
@property (nonatomic, assign) int typeId;
/**答案解析*/
@property (nonatomic, copy) NSString *analysis;
/**状态（0：未答，1：答对，2：答错）*/
@property (nonatomic, assign) int status;

@end

NS_ASSUME_NONNULL_END
