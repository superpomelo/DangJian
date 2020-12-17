//
//  ThirdLaborCenterLessonDetailsTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/9/8.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdLaborCenterLessonDetailsTableViewCell.h"
#import "FirstLaborCenterLessonDetailsCollectionViewCell.h"

@interface ThirdLaborCenterLessonDetailsTableViewCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
@implementation ThirdLaborCenterLessonDetailsTableViewCell

- (void)reloadData{
    [self.myCollectionView reloadData];
}

- (void)awakeFromNib {
    [super awakeFromNib];
    // Initialization code
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    //滚动方向
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;

    // 最小行间距，默认是0
//    layout.minimumLineSpacing = 15.0;
    // 最小左右间距，默认是10
//    layout.minimumInteritemSpacing = 15.0;
    // 区域内间距，默认是 UIEdgeInsetsMake(0, 0, 0, 0)
//    layout.sectionInset = UIEdgeInsetsMake(5.0, 5.0, 5.0, 5.0);
    self.array = [NSMutableArray array];
    layout.sectionInset = UIEdgeInsetsMake(0.0, 10, 0.0,10);
    layout.itemSize = CGSizeMake((SCR_W-40)/3, 120);
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.bounces = NO;
    _myCollectionView.collectionViewLayout = layout;
    [_myCollectionView registerNib:[UINib nibWithNibName:@"FirstLaborCenterLessonDetailsCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstLaborCenterLessonDetailsCollectionViewCellID"];

}
- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        
            return self.array.count;
       
    }else {
       return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstLaborCenterLessonDetailsCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FirstLaborCenterLessonDetailsCollectionViewCellID" forIndexPath:indexPath];
//    [cell initUI];
    [cell reloadData:self.array[indexPath.row]];
    return cell;
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
    if ([self.delegate respondsToSelector:@selector(ThirdLaborCenterLessonDetailsTableViewCellCollectionViewActiondelegate:CollectionViewindexPath:)]) {
        [self.delegate ThirdLaborCenterLessonDetailsTableViewCellCollectionViewActiondelegate:self CollectionViewindexPath:indexPath];
    }
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
    return  UIEdgeInsetsMake(0.0, 15, 0.0,15);
}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
