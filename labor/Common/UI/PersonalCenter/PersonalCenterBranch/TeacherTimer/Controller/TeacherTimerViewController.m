//
//  TeacherTimerViewController.m
//  labor
//
//  Created by 狍子 on 2020/10/12.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "TeacherTimerViewController.h"

@interface TeacherTimerViewController ()
@property (weak, nonatomic) IBOutlet UIDatePicker *mydataPicker;

@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property (nonatomic,strong)NSString *dateStr;
@end

@implementation TeacherTimerViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    self.titlesLabel.text = self.TITLES;
    [self.mydataPicker addTarget:self action:@selector(dataValueChange:) forControlEvents:UIControlEventValueChanged];
    NSDate* dateNow = [NSDate dateWithTimeIntervalSinceNow:0];
    // 格式化时间
       NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
       formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
       [formatter setDateStyle:NSDateFormatterMediumStyle];
       [formatter setTimeStyle:NSDateFormatterShortStyle];
       [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
       
       NSString* dateString = [formatter stringFromDate:dateNow];
    self.dateStr = dateString;
    self.fd_prefersNavigationBarHidden = YES;

}
- (void)dataValueChange:(UIDatePicker*)sender{
    NSDate *date = sender.date;
    // 格式化时间
       NSDateFormatter* formatter = [[NSDateFormatter alloc] init];
       formatter.timeZone = [NSTimeZone timeZoneWithName:@"shanghai"];
       [formatter setDateStyle:NSDateFormatterMediumStyle];
       [formatter setTimeStyle:NSDateFormatterShortStyle];
       [formatter setDateFormat:@"yyyy-MM-dd HH:mm:ss"];
       
       NSString* dateString = [formatter stringFromDate:date];
    self.dateStr = dateString;
    NSLog(@"%@",dateString);
}
- (IBAction)backButtonAction:(id)sender {
    [self.navigationController popViewControllerAnimated:YES];
}
/**确定*/
- (IBAction)submitButtonAction:(id)sender {

    self.resultBlock(self.dateStr);
    [self.navigationController popViewControllerAnimated:YES];

}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
