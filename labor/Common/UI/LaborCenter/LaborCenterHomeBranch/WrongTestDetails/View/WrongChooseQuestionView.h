//
//  WrongChooseQuestionView.h
//  labor
//
//  Created by 狍子 on 2020/9/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TheTestModel.h"

NS_ASSUME_NONNULL_BEGIN
@class WrongChooseQuestionView;
@protocol WrongChooseQuestionViewDelegate <NSObject>
/**选择题目*/
- (void)WrongChooseQuestionViewmyCollectionViewActiondelegate:(WrongChooseQuestionView*)cell index:(NSIndexPath*)indexPath;
/**选择题目的上一题，下一题*/
- (void)WrongChooseQuestionViewbuttonActiondelegate:(WrongChooseQuestionView*)view button:(UIButton*)sender;

@end
@interface WrongChooseQuestionView : UIView
@property (weak, nonatomic) IBOutlet UICollectionView *myCollectionView;
@property (nonatomic,weak) id<WrongChooseQuestionViewDelegate>delegate;
@property(nonatomic,strong)NSArray *dataArray;
/**当前题号*/
@property(nonatomic,assign)int questionNumber;
/**提交试卷时的questionsDtoList数组*/
@property (nonatomic,strong)NSMutableArray *questionsDtoListArrayM;
@property (weak, nonatomic) IBOutlet UIButton *nextButton;
@end

NS_ASSUME_NONNULL_END
