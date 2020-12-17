//
//  FirstMyTaskAssessmentTeacher1TableViewCell.h
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@interface FirstMyTaskAssessmentTeacher1TableViewCell : UITableViewCell
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;

- (void)reloadData:(NSString*)titles;
@property (weak, nonatomic) IBOutlet UIView *detailsBottomView;

@end

NS_ASSUME_NONNULL_END
