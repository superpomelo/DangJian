//
//  WrongTestDetailsView.m
//  labor
//
//  Created by 狍子 on 2020/9/2.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "WrongTestDetailsView.h"
#import "JsonString.h"

@implementation WrongTestDetailsView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
}
- (void)reloadData:(TheTestModel*)model{
    if (model.analysis == nil) {
        NSAttributedString *abt = [[NSAttributedString alloc]initWithString:@"解析:"];
        self.titleLabel.attributedText = abt;
    }else{
        NSAttributedString *abt = [[NSAttributedString alloc]initWithString:[NSString stringWithFormat:@"解析: %@",model.analysis]];
        self.titleLabel.attributedText = abt;
    }

    
    NSArray *optionsContentArray = [JsonString arrayWithJsonString:model.optionsContent] ;
    NSArray *arrayAnswer = [NSArray array];
    NSMutableArray *arrayM = [NSMutableArray array];
    NSMutableString *answerStrM = [NSMutableString string];
    
    if ([model.answer containsString:@","]) {
       arrayAnswer = [model.answer componentsSeparatedByString:@","];
        for (int i = 0; i<optionsContentArray.count; i++) {
            for (int k=0; k<arrayAnswer.count; k++) {
//                NSDictionary *dictanswer = arrayAnswer[k];
                NSDictionary *dictoptionsContent = optionsContentArray[i];

                if ([arrayAnswer[k] isEqualToString:dictoptionsContent.allValues[0]]) {
                    [arrayM addObject:dictoptionsContent.allValues[0]];
                    if ([answerStrM containsString:@","]) {
                        
                        [answerStrM appendString:@","];
                        [answerStrM appendString:dictoptionsContent.allKeys[0]];
                    }else{
                        [answerStrM appendString:dictoptionsContent.allKeys[0]];

                    }
                 
                    
                }
            }
        }
        
        self.answerLabel.text = [NSString stringWithFormat:@"正确答案:  %@",answerStrM];

        
    }else{
//        NSMutableString *answerStrM = [NSMutableString string];

        for (int i = 0; i<optionsContentArray.count; i++) {
            NSDictionary *dictoptionsContent = optionsContentArray[i];

            if ([model.answer isEqualToString:dictoptionsContent.allValues[0]]) {
                self.answerLabel.text = [NSString stringWithFormat:@"正确答案:  %@",dictoptionsContent.allKeys[0]];

            }
        }
    }

    
}
- (IBAction)closeButtonAction:(id)sender {
    self.hidden = YES;

}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
