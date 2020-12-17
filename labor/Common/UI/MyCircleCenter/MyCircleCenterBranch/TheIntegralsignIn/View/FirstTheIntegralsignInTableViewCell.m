//
//  FirstTheIntegralsignInTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/8/26.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "FirstTheIntegralsignInTableViewCell.h"
#import "MyTimeInterval.h"

@implementation FirstTheIntegralsignInTableViewCell

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    self.bottomView1.layer.cornerRadius = self.bottomView1.bounds.size.height/2;
    self.bottomView2.layer.cornerRadius = self.bottomView2.bounds.size.height/2;
    self.bottomView3.layer.cornerRadius = self.bottomView3.bounds.size.height/2;
    self.bottomView4.layer.cornerRadius = self.bottomView4.bounds.size.height/2;
    self.bottomView5.layer.cornerRadius = self.bottomView5.bounds.size.height/2;
    self.bottomView6.layer.cornerRadius = self.bottomView6.bounds.size.height/2;
    self.bottomView7.layer.cornerRadius = self.bottomView7.bounds.size.height/2;
    
    self.dayslabel1.text =  [MyTimeInterval getsevenDays][0];
    self.dayslabel2.text =  [MyTimeInterval getsevenDays][1];
    self.dayslabel3.text =  [MyTimeInterval getsevenDays][2];
    self.dayslabel4.text =  [MyTimeInterval getsevenDays][3];
    self.dayslabel5.text =  [MyTimeInterval getsevenDays][4];
    self.dayslabel6.text =  [MyTimeInterval getsevenDays][5];
    self.dayslabel7.text =  [MyTimeInterval getsevenDays][6];
    
}

- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
