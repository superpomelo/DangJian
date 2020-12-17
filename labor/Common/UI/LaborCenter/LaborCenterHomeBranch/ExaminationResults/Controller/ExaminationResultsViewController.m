//
//  ExaminationResultsViewController.m
//  labor
//
//  Created by 狍子 on 2020/8/24.
//  Copyright © 2020 ZKWQY. All rights reserved.
//  成绩结果

#import "ExaminationResultsViewController.h"
#import "WrongTestDetailsViewController.h"
#import "FirstExaminationResultsTableViewCell.h"
#import "LaborCenterRequestDatas.h"
#import "ExaminationResultsModel.h"
#import "TheExamRushedOffViewController.h"
#import "TheTestViewController.h"
#import "MyTestViewController.h"

@interface ExaminationResultsViewController ()<UITableViewDelegate,UITableViewDataSource,FirstExaminationResultsTableViewCellDelegate,UIScrollViewDelegate>
{
    CAShapeLayer *_shapeLayer;
}
@property (weak, nonatomic) IBOutlet UITableView *myTableView;
@property (weak, nonatomic) IBOutlet UIView *navBottomView;
@property (weak, nonatomic) IBOutlet UIView *nav2BottomView;
@property (weak, nonatomic) IBOutlet UILabel *titlesLabel;
@property (weak, nonatomic) IBOutlet UIImageView *backImageView;
@property (weak, nonatomic) NSTimer *timer;

@property(nonatomic,strong) ExaminationResultsModel *Examinationmodel;
@property (weak, nonatomic) IBOutlet NSLayoutConstraint *toplayoutconstraint;

@end

@implementation ExaminationResultsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
    if ([IsIphoneX isIphoneX]==NO) {
        self.toplayoutconstraint.constant = -20.0f;
    }
    self.extendedLayoutIncludesOpaqueBars = YES;

    if (@available(iOS 11.0, *)) {

            self.myTableView.contentInsetAdjustmentBehavior = UIScrollViewContentInsetAdjustmentNever;

    } else {

            self.automaticallyAdjustsScrollViewInsets = NO;

    }
    [self initUI];
    [self initmyTableView];
    [self requestmobileEvaluationgetUserExamResult];
    self.fd_prefersNavigationBarHidden = YES;
    

}
//MARK: - Life Cycle - 生命周期
- (void)viewWillAppear:(BOOL)animated{
    [super viewWillAppear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleLightContent;
}

- (void)viewWillDisappear:(BOOL)animated{
    [super viewWillDisappear:animated];
    [UIApplication sharedApplication].statusBarStyle = UIStatusBarStyleDefault;
}
//MARK: - Initalization - 初始化
- (void)initmyTableView{
    self.myTableView.delegate = self;
    self.myTableView.dataSource = self;
    self.myTableView.bounces = NO;
//    self.myTableView.rowHeight = UITableViewAutomaticDimension;
//    self.myTableView.estimatedRowHeight = 70.0;
    [self.myTableView registerNib:[UINib nibWithNibName:@"FirstExaminationResultsTableViewCell" bundle:nil] forCellReuseIdentifier:@"FirstExaminationResultsTableViewCellID"];
    
}

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    return 800;

}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
 
    return 1;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
        FirstExaminationResultsTableViewCell *cell = [self.myTableView dequeueReusableCellWithIdentifier:@"FirstExaminationResultsTableViewCellID"];
    if (self.Examinationmodel!=nil) {
        [cell reloadData:self.Examinationmodel];
        float userScore = [[NSString stringWithFormat:@"%d",self.Examinationmodel.userScore] floatValue];
        if (userScore==0) {
            [self initquxian:cell tianchongfloat:0.01];


        }else if (userScore>=100){
            [self initquxian:cell tianchongfloat:1];
        }else{
            [self initquxian:cell tianchongfloat:[[NSString stringWithFormat:@"%.2f",userScore/100] floatValue]+0.01];
        }

      
            [self animateToProgress:[[NSString stringWithFormat:@"%.2f",userScore/100] floatValue]];
        

    }
    cell.delegate = self;
    return cell;
  

    

}
- (void)initUI{

}
//MARK: - SubViews - 子视图

- (void)initquxian:(FirstExaminationResultsTableViewCell*)cell tianchongfloat:(float)tianchongfloat{
//    UIBezierPath *circlePath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(0, 0, 200, 200)];
   /**radius 半径  clockwise 是否顺时针画图*/
    UIBezierPath *circlePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:M_PI / 2  + M_PI - 0.01 endAngle: M_PI / 2  + M_PI clockwise:NO];
    //设置颜色
    [[UIColor blackColor] set];
    
    //线粗细
    circlePath.lineWidth = 5;
    
    //开始绘图
    [circlePath stroke];
    
    CAShapeLayer *shape = [CAShapeLayer layer];
        shape.frame = cell.centerBottomView.bounds;

    shape.fillColor = [UIColor clearColor].CGColor;//填充色 -  透明
    shape.lineWidth = 7.f;
    shape.strokeColor = [UIColor colorWithRed:255/255.0 green:255/255.0 blue:255/255.0 alpha:0.3].CGColor; //线条颜色
    shape.strokeStart = 0.0;//起始点
    shape.strokeEnd = 1.0;//终点
    shape.lineCap = kCALineCapRound;//让线两端是圆滑的状态
    shape.path = circlePath.CGPath;//这里就是把背景的路径设为之前贝塞尔曲线的那个路径
    [cell.centerBottomView.layer addSublayer:shape];
    
        _shapeLayer = [CAShapeLayer layer];
        _shapeLayer.frame = cell.centerBottomView.bounds;
        _shapeLayer.fillColor = [UIColor clearColor].CGColor;
        _shapeLayer.lineWidth = 7.f;
        _shapeLayer.lineCap = kCALineCapRound;
    //    _shapeLayer.strokeColor = color.CGColor;
    
   
    _shapeLayer.strokeColor = [UIColor colorWithRed:255/255.0 green:252/255.0 blue:177/255.0 alpha:1.0].CGColor;
        _shapeLayer.strokeStart = 0.0;
        _shapeLayer.strokeEnd = 0.0;
        _shapeLayer.path = circlePath.CGPath;
        [cell.centerBottomView.layer addSublayer:_shapeLayer];
    
    [self qiudedonghua:cell tianchongfloat:tianchongfloat];
}

- (void)qiudedonghua:(FirstExaminationResultsTableViewCell*)cell tianchongfloat:(float)tianchongfloat{
    CGFloat endAnglefloat = 0;
    if (tianchongfloat <= 0.75){
        endAnglefloat = M_PI / 2  + M_PI+tianchongfloat*(-2*M_PI);
    }else{
        endAnglefloat = M_PI / 2  + M_PI+tianchongfloat*(-2*M_PI);
    }
    UIBezierPath *circlePathTemp = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100) radius:100 startAngle:M_PI / 2  + M_PI endAngle:endAnglefloat  clockwise:NO];
    
   
    //设置颜色
    [[UIColor colorWithRed:249/255.0 green:113/255.0 blue:106/255.0 alpha:1.0] set];
    
    //线粗细
    circlePathTemp.lineWidth = 5;
    
    //开始绘图
    [circlePathTemp stroke];
    
    CAKeyframeAnimation *pathAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];

    //Set some variables on the animation

    pathAnimation.calculationMode = kCAAnimationPaced;

    //We want the animation to persist - not so important in this case - but kept for clarity

    //If we animated something from left to right - and we wanted it to stay in the new position,

    //then we would need these parameters

    pathAnimation.fillMode = kCAFillModeForwards;

    pathAnimation.removedOnCompletion = NO;

    pathAnimation.duration = tianchongfloat;

    //Lets loop continuously for the demonstration

    pathAnimation.repeatCount = 1;

    //Setup the path for the animation - this is very similar as the code the draw the line

    //instead of drawing to the graphics context, instead we draw lines on a CGPathRef

    //CGPoint endPoint = CGPointMake(310, 450);

//    CGMutablePathRef curvedPath = CGPathCreateMutable();
//
//    CGPathMoveToPoint(curvedPath, NULL, 10, 10);
//
//    CGPathAddQuadCurveToPoint(curvedPath, NULL, 10, 450, 310, 450);
//
//    CGPathAddQuadCurveToPoint(curvedPath, NULL, 310, 10, 10, 10);

    //Now we have the path, we tell the animation we want to use this path - then we release the path

//    pathAnimation.path = curvedPath;
        pathAnimation.path = circlePathTemp.CGPath;

//    CGPathRelease(curvedPath);

   // 在指定路径后，指定动画的对象，（在此用UIImageView举例：）

    UIImageView *circleView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"quanquan"]];

    circleView.frame = CGRectMake(1, 1, 15, 15);

    [cell.centerBottomView addSubview:circleView];

    //Add the animation to the circleView - once you add the animation to the layer, the animation starts

    [circleView.layer addAnimation:pathAnimation

    forKey:@"moveTheSquare"];

    
}
- (void)animate:(NSTimer *)time{
    
    CGFloat progress = [[time.userInfo objectForKey:@"progressStr"]  floatValue];
    
    if(_shapeLayer.strokeEnd <= progress)
    {
        _shapeLayer.strokeEnd = _shapeLayer.strokeEnd + 0.01;
        NSLog(@"最终值%f",_shapeLayer.strokeEnd);
    }else{
        [self deleteTimer];
    }
}


- (void)animateToProgress:(CGFloat)progress{
    
//    NSLog(@"增加到progress%lf", progress);
    
//    if(_shapeLayer.strokeEnd != 0){
//        [self animateToZero];
//    }
    
    __weak typeof(self)weakSelf = self;
    
    NSLog(@"-----%lf",_shapeLayer.strokeEnd);
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(_shapeLayer.strokeEnd * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
    
        [weakSelf deleteTimer];
        
        NSString *progressStr = [NSString stringWithFormat:@"%lf",progress];
        
        NSDictionary *userInfo = @{@"progressStr":progressStr};
        
        weakSelf.timer = [NSTimer scheduledTimerWithTimeInterval:0.01 target:weakSelf selector:@selector(animate:) userInfo:userInfo repeats:YES];
    });
    
}

- (void)animateReset{
    
    if(_shapeLayer.strokeEnd > 0){
        _shapeLayer.strokeEnd -= 0.01;
    }else{
        [self deleteTimer];
    }
    
}

- (void)deleteTimer{
    [self.timer invalidate];
    self.timer = nil;
}
//MARK: - Button Action - 点击事件

/**查看考卷/重新考试*/
- (void)FirstExaminationResultsTableViewCellButtonActiondelegate:(FirstExaminationResultsTableViewCell*)cell button:(UIButton*)sender{
    if ([sender.currentTitle isEqualToString:@"查看考卷"]) {
       
        WrongTestDetailsViewController *WTvc = [[WrongTestDetailsViewController alloc]init];
        WTvc.model = self.model;
        [self.navigationController pushViewController:WTvc animated:YES];
    }else if ([sender.currentTitle isEqualToString:@"再考一次"]){
        NSLog(@"2");
        [self requestmobileEvaluationagainExam];
    }
}

- (IBAction)backButtonAction:(id)sender {

   for (UIViewController *temp in self.navigationController.viewControllers) {
       if (self.from == ExaminationResultsHome) {
           //返回考试冲关
           if ([temp isKindOfClass:[TheExamRushedOffViewController class]]) {
               [self.navigationController popToViewController:temp animated:YES];
           }
       }else if (self.from == ExaminationResultsPersonal) {
           //返回个人中心我的考试
           if ([temp isKindOfClass:[MyTestViewController class]]) {
               [self.navigationController popToViewController:temp animated:YES];
           }
       }

     }
   
}


//MARK: - Utility - 多用途(功能)方法

-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    if (scrollView.contentOffset.y > 44) {
        self.navBottomView.backgroundColor = [UIColor whiteColor];
        self.nav2BottomView.backgroundColor = [UIColor whiteColor];
        self.titlesLabel.textColor = [UIColor colorWithRed:51/255.0 green:51/255.0 blue:51/255.0 alpha:1];
        self.backImageView.image = [UIImage imageNamed:@"路径 31"];
    }else{
        self.navBottomView.backgroundColor = [UIColor clearColor];
        self.nav2BottomView.backgroundColor = [UIColor clearColor];
        self.titlesLabel.textColor = [UIColor whiteColor];
        self.backImageView.image = [UIImage imageNamed:@"路径 32"];

    }
}
//MARK: - Network request - 网络请求
/**获取考试结果*/
- (void)requestmobileEvaluationgetUserExamResult{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //考试id
    para[@"examId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    //试卷id
//    para[@"examPaperId"] = [NSString stringWithFormat:@"%d",self.model.examPaperId];
    [LaborCenterRequestDatas mobileEvaluationgetUserExamResultrequestDataWithparameters:para success:^(id  _Nonnull result) {
        self.Examinationmodel = result;
        [self.myTableView reloadData];
    } failure:^(NSError * _Nonnull error) {
        
    }];
}

/**重新考试*/
- (void)requestmobileEvaluationagainExam{
    NSMutableDictionary *para = [NSMutableDictionary dictionary];
    //考试id
    para[@"examId"] = [NSString stringWithFormat:@"%d",self.model.idx];
    //试卷id
//    para[@"examPaperId"] = [NSString stringWithFormat:@"%d",self.model.examPaperId];
    [LaborCenterRequestDatas mobileEvaluationagainExamrequestDataWithparameters:para success:^(id  _Nonnull result) {
        TheTestViewController *TTvc = [[TheTestViewController alloc]init];
        TTvc.model = self.model;
        TTvc.from = self.from;
        [self.navigationController pushViewController:TTvc animated:YES];
    } failure:^(NSError * _Nonnull error) {
        
    }];
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
