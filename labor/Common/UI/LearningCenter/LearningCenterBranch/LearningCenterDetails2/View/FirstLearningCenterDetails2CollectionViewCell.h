//
//  FirstLearningCenterDetails2CollectionViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/7.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "TeacherLectureHallModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface FirstLearningCenterDetails2CollectionViewCell : UICollectionViewCell
@property (weak, nonatomic) IBOutlet UIImageView *leftImageView;
@property (weak, nonatomic) IBOutlet UILabel *bottomLabel;

- (void)reloadData:(TeacherLectureHallModel*)model;
@end

NS_ASSUME_NONNULL_END
