//
//  SelectClassView.m
//  labor
//
//  Created by 狍子 on 2020/9/3.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "SelectClassView.h"
#import "FirstPublishTaskCollectionViewCell.h"


@interface SelectClassView ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
@implementation SelectClassView

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    self.hidden = YES;
}
- (IBAction)sureButtonAction:(id)sender {
    self.hidden = YES;
    if ([self.delegate respondsToSelector:@selector(SelectClassViewCollectionViewActiondelegate:selarray:)]) {
        [self.delegate SelectClassViewCollectionViewActiondelegate:self selarray:self.selArray];
    }
}

- (void)initUI{
    self.selArray = [NSMutableArray array];
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    // 最小行间距，默认是0
//    layout.minimumLineSpacing = 15.0;
    // 最小左右间距，默认是10
//    layout.minimumInteritemSpacing = 15.0;
    // 区域内间距，默认是 UIEdgeInsetsMake(0, 0, 0, 0)
//    layout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    layout.sectionInset = UIEdgeInsetsMake(0.0, 15, 0.0,15);
    layout.itemSize = CGSizeMake((SCR_W-40)/2, 60);
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.bounces = NO;
    _myCollectionView.collectionViewLayout = layout;
    [_myCollectionView registerNib:[UINib nibWithNibName:@"FirstPublishTaskCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstPublishTaskCollectionViewCellID"];
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
    FirstPublishTaskCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FirstPublishTaskCollectionViewCellID" forIndexPath:indexPath];
    [cell initUI];
    [cell reloadData:self.dataArray[indexPath.row] selArray:self.selArray];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    NSLog(@"sel-%ld",(long)indexPath.row);
    
    PublishTaskClassModel *model1 = self.dataArray[indexPath.row];
    NSMutableArray *temparrayM = [NSMutableArray array];
    temparrayM = [NSMutableArray arrayWithArray:self.selArray];
    if (temparrayM.count>0) {
        for (int i = 0; i<temparrayM.count; i++) {
            PublishTaskClassModel *model2 = temparrayM[i];
            if (model1.classId == model2.classId) {
                [self.selArray removeObjectAtIndex:i];
                break;
            }
            if (i == temparrayM.count-1) {
                [self.selArray addObject:model1];
            }
        }
    }else{
        [self.selArray addObject:model1];

    }

    [self.myCollectionView reloadData];

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
    return  UIEdgeInsetsMake(0.0, 15, 0.0,15);;;
}
/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
