//
//  WrongChooseQuestionView.m
//  labor
//
//  Created by 狍子 on 2020/9/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "WrongChooseQuestionView.h"
#import "FirstWrongChooseQuestionCollectionViewCell.h"

@interface WrongChooseQuestionView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
@implementation WrongChooseQuestionView
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
}
- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 最小行间距，默认是0
//    layout.minimumLineSpacing = 15.0;
    // 最小左右间距，默认是10
//    layout.minimumInteritemSpacing = 15.0;
    // 区域内间距，默认是 UIEdgeInsetsMake(0, 0, 0, 0)
//    layout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    layout.sectionInset = UIEdgeInsetsMake(0.0, 15.0, 0.0,15.0);
    layout.itemSize = CGSizeMake((SCR_W-90)/7, (SCR_W-90)/7);
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.bounces = NO;
    _myCollectionView.collectionViewLayout = layout;
    [_myCollectionView registerNib:[UINib nibWithNibName:@"FirstWrongChooseQuestionCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstWrongChooseQuestionCollectionViewCellID"];

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.dataArray.count;
    }else {
       return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstWrongChooseQuestionCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FirstWrongChooseQuestionCollectionViewCellID" forIndexPath:indexPath];
//    [cell initUI];
    cell.titleLabel.text = [NSString stringWithFormat:@"%ld",(long)indexPath.row+1];
//    if (indexPath.row == self.questionNumber) {
//        cell.bottomView.backgroundColor = [UIColor colorWithRed:93/255.0 green:116/255.0 blue:160/255.0 alpha:1];
      cell.bottomView.backgroundColor = [UIColor colorWithRed:0/255.0 green:128/255.0 blue:0/255.0 alpha:1];
//      cell.titleLabel.textColor = [UIColor colorWithRed:78/255.0 green:103/255.0 blue:174/255.0 alpha:1];
//        cell.titleLabel.textColor = [UIColor whiteColor];
//    }else{
        TheTestModel *model = self.questionsDtoListArrayM[indexPath.row];
        /**状态（0：未答，1：答对，2：答错）*/
        if (model.status == 0||model.status == 2) {
            
            cell.bottomView.backgroundColor = [UIColor colorWithRed:238/255.0 green:69/255.0 blue:69/255.0 alpha:1];
            cell.titleLabel.textColor = [UIColor colorWithRed:52/255.0 green:52/255.0 blue:52/255.0 alpha:1];

        }else{
            
                cell.bottomView.backgroundColor = [UIColor colorWithRed:79/255.0 green:219/255.0 blue:141/255.0 alpha:1];
//                cell.titleLabel.textColor = [UIColor colorWithRed:78/255.0 green:103/255.0 blue:174/255.0 alpha:1];
            cell.titleLabel.textColor = [UIColor whiteColor];

        }
//    }
    return cell;
}

//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath {
//    CGFloat width = ((SCR_W-20)/3);
//    CGSize size = CGSizeMake(width, width);
//    return size;
//}


//- (UICollectionReusableView *)collectionView:(UICollectionView *)collectionView viewForSupplementaryElementOfKind:(NSString *)kind atIndexPath:(NSIndexPath *)indexPath{
//    if (kind == UICollectionElementKindSectionHeader) {
//        CT_MyCollectionReusableView *aView = [collectionView dequeueReusableSupplementaryViewOfKind:kind withReuseIdentifier:@"CT_MyCollectionReusableView" forIndexPath:indexPath];
//        if (indexPath.section == 0) {
//            aView.titleLbl.text = @"生活类贴纸展示";
//        } else {
//            aView.titleLbl.text = @"美食类贴纸展示";
//        }
//        aView.titleLbl.textColor = [UIColor whiteColor];
//        return aView;
//    }
//    return nil;
//}
//- (CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout referenceSizeForHeaderInSection:(NSInteger)section
//{
//    if (section == 0) {
//        return CGSizeMake(SCR_W, 40);
//    }else{
//        return CGSizeMake(SCR_W, 40);
//    }
//}
- (UIEdgeInsets)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout*)collectionViewLayout insetForSectionAtIndex:(NSInteger)section
{
//    layout.sectionInset = UIEdgeInsetsMake(0.0, 15, 0.0,15);

    if (section==0) {
        
    }
    return  UIEdgeInsetsMake(0.0, 15.0, 0.0,15.0);;;
}

-(void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(WrongChooseQuestionViewmyCollectionViewActiondelegate:index:)]) {
        [self.delegate WrongChooseQuestionViewmyCollectionViewActiondelegate:self index:indexPath];
    }
}
/**选择题目*/
- (IBAction)chooseQuestionButtonAction:(id)sender {
    self.hidden = YES;
}
- (IBAction)lastQuestionButtonAction:(UIButton*)sender {
    if ([self.delegate respondsToSelector:@selector(WrongChooseQuestionViewbuttonActiondelegate:button:)]) {
        [self.delegate WrongChooseQuestionViewbuttonActiondelegate:self button:sender];
    }
}
- (IBAction)nextQuestionButtonAction:(UIButton*)sender {
    
    if ([self.delegate respondsToSelector:@selector(WrongChooseQuestionViewbuttonActiondelegate:button:)]) {
        [self.delegate WrongChooseQuestionViewbuttonActiondelegate:self button:sender];
    }
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
