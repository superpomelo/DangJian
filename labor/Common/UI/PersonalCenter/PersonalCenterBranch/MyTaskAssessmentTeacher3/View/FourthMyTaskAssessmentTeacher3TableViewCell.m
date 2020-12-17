//
//  FourthMyTaskAssessmentTeacher3TableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/30.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FourthMyTaskAssessmentTeacher3TableViewCell.h"

@implementation FourthMyTaskAssessmentTeacher3TableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView9.hidden = YES;
    self.bottomView2.hidden = YES;
    self.bottomView3.hidden = YES;
    self.bottomView4.hidden = YES;
    self.bottomView5.hidden = YES;
    self.bottomView6.hidden = YES;
    self.bottomView7.hidden = YES;
    self.bottomView8.hidden = YES;
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}
- (void)reloadData:(MyTaskAssessmentTeacher3Model*)model{
    NSString *http;
    if ([model.cover containsString:@"http"]) {
        http = @"";
        
    }else{
        http = [NSString stringWithFormat:@"%@",VideoHost];
//        Url = [NSURL URLWithString:[NSString stringWithFormat:@"%@%@",VideoHost,model.cover]];

    }
    if ([model.cover containsString:@","]) {
        NSArray *ary = [model.cover componentsSeparatedByString:@","];
        if (ary.count==2) {
            
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            self.bottomView9.hidden = YES;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = YES;
            self.bottomView4.hidden = YES;
            self.bottomView5.hidden = YES;
            self.bottomView6.hidden = YES;
            self.bottomView7.hidden = YES;
            self.bottomView8.hidden = YES;
        }else if (ary.count==3) {
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[2]]]];
            self.bottomView9.hidden = YES;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = NO;
            self.bottomView4.hidden = YES;
            self.bottomView5.hidden = YES;
            self.bottomView6.hidden = YES;
            self.bottomView7.hidden = YES;
            self.bottomView8.hidden = YES;
        }else if (ary.count==4) {
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[2]]]];
            [self.image4View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[3]]]];
            self.bottomView9.hidden = YES;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = NO;
            self.bottomView4.hidden = NO;
            self.bottomView5.hidden = YES;
            self.bottomView6.hidden = YES;
            self.bottomView7.hidden = YES;
            self.bottomView8.hidden = YES;
        }else if (ary.count==5) {
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[2]]]];
            [self.image4View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[3]]]];
            [self.image5View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[4]]]];
            self.bottomView9.hidden = YES;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = NO;
            self.bottomView4.hidden = NO;
            self.bottomView5.hidden = NO;
            self.bottomView6.hidden = YES;
            self.bottomView7.hidden = YES;
            self.bottomView8.hidden = YES;
        }else if (ary.count==6) {
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[2]]]];
            [self.image4View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[3]]]];
            [self.image5View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[4]]]];
            [self.image6View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[5]]]];
            self.bottomView9.hidden = YES;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = NO;
            self.bottomView4.hidden = NO;
            self.bottomView5.hidden = NO;
            self.bottomView6.hidden = NO;
            self.bottomView7.hidden = YES;
            self.bottomView8.hidden = YES;
        }else if (ary.count==7) {
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[2]]]];
            [self.image4View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[3]]]];
            [self.image5View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[4]]]];
            [self.image6View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[5]]]];
            [self.image7View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[6]]]];
            self.bottomView9.hidden = YES;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = NO;
            self.bottomView4.hidden = NO;
            self.bottomView5.hidden = NO;
            self.bottomView6.hidden = NO;
            self.bottomView7.hidden = NO;
            self.bottomView8.hidden = YES;
        }else if (ary.count==8) {
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[2]]]];
            [self.image4View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[3]]]];
            [self.image5View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[4]]]];
            [self.image6View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[5]]]];
            [self.image7View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[6]]]];
            [self.image8View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[7]]]];
            self.bottomView9.hidden = YES;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = NO;
            self.bottomView4.hidden = NO;
            self.bottomView5.hidden = NO;
            self.bottomView6.hidden = NO;
            self.bottomView7.hidden = NO;
            self.bottomView8.hidden = NO;
        }else if (ary.count==9) {
            [self.image1View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[0]]]];
            [self.image2View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[1]]]];
            [self.image3View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[2]]]];
            [self.image4View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[3]]]];
            [self.image5View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[4]]]];
            [self.image6View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[5]]]];
            [self.image7View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[6]]]];
            [self.image8View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[7]]]];
            [self.image9View sd_setImageWithURL:[NSURL URLWithString:[NSString stringWithFormat:@"%@%@",http,ary[8]]]];
            self.bottomView9.hidden = NO;
            self.bottomView2.hidden = NO;
            self.bottomView3.hidden = NO;
            self.bottomView4.hidden = NO;
            self.bottomView5.hidden = NO;
            self.bottomView6.hidden = NO;
            self.bottomView7.hidden = NO;
            self.bottomView8.hidden = NO;
        }
    }
}
- (IBAction)button1Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:0];
    }
}
- (IBAction)button2Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:1];
    }
}
- (IBAction)button3Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:2];
    }
}
- (IBAction)button4Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:3];
    }
}
- (IBAction)button5Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:4];
    }
}
- (IBAction)button6Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:5];
    }
}
- (IBAction)button7Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:6];
    }
}
- (IBAction)button8Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:7];
    }
}
- (IBAction)button9Action:(id)sender {
    if ([self.delegate respondsToSelector:@selector(FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:location:)]) {
        [self.delegate FourthMyTaskAssessmentTeacher3TableViewCellActiondelegate:self location:8];
    }
}

@end
