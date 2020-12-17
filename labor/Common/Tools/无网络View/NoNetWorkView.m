//
//  NoNetWorkView.m
//  labor
//
//  Created by 狍子 on 2020/10/29.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "NoNetWorkView.h"
#import "UserInfoManager.h"

@implementation NoNetWorkView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (void)setUI{
    self.againButton.layer.cornerRadius = self.againButton.bounds.size.height/2;
}
- (IBAction)againButtonAction:(id)sender {
    if ([[UserInfoManager getAFNetworkReachabilityStatus] isEqualToString:@"viaWWAN"]||[[UserInfoManager getAFNetworkReachabilityStatus] isEqualToString:@"viaWiFi"]) {
        self.hidden = YES;
        if ([self.delegate respondsToSelector:@selector(NoNetWorkViewAgainButtonActiondelegate:)]) {
            [self.delegate NoNetWorkViewAgainButtonActiondelegate:self];
        }
    }else{
       //无网络不作处理
    }
}
- (IBAction)backButtonAction:(id)sender {
    if ([self.delegate respondsToSelector:@selector(NoNetWorkViewBackButtonActiondelegate:)]) {
        [self.delegate NoNetWorkViewBackButtonActiondelegate:self];
    }
}

@end
