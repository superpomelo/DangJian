//
//  ThirdthMingZhuPingYiDetailsViewTableViewCell.m
//  labor
//
//  Created by 狍子 on 2020/11/10.
//  Copyright © 2020 ZKWQY. All rights reserved.
//

#import "ThirdthMingZhuPingYiDetailsViewTableViewCell.h"
#import "FirstMingZhuPingYiDetailsViewCollectionViewCell.h"

@interface ThirdthMingZhuPingYiDetailsViewTableViewCell ()<UICollectionViewDelegateFlowLayout,UICollectionViewDataSource>

@end
@implementation ThirdthMingZhuPingYiDetailsViewTableViewCell

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
    layout.sectionInset = UIEdgeInsetsMake(0.0, 15, 0.0,15);
    layout.itemSize = CGSizeMake((SCR_W-40)/2, 215);
    _myCollectionView.delegate = self;
    _myCollectionView.dataSource = self;
    _myCollectionView.bounces = NO;
    _myCollectionView.collectionViewLayout = layout;
    [_myCollectionView registerNib:[UINib nibWithNibName:@"FirstMingZhuPingYiDetailsViewCollectionViewCell" bundle:nil] forCellWithReuseIdentifier:@"FirstMingZhuPingYiDetailsViewCollectionViewCellID"];
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    return 1;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    if (section == 0) {
        return self.dataArray.count;

//        return 4;
    }else {
       return 0;
    }
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
    FirstMingZhuPingYiDetailsViewCollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"FirstMingZhuPingYiDetailsViewCollectionViewCellID" forIndexPath:indexPath];
//    [cell initUI];
    [cell reloadData:self.dataArray[indexPath.row]];
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath{
//    VotingQuestionVosModel *model = self.dataArray[indexPath.row];
//    if (model.type == 0) {
        if ([self.delegate respondsToSelector:@selector(ThirdthMingZhuPingYiDetailsViewTableViewCellCollectionViewActiondelegate:index:)]) {
            [self.delegate ThirdthMingZhuPingYiDetailsViewTableViewCellCollectionViewActiondelegate:self index:indexPath];
        }

//    }else if(model.type == 1) {
////        self.toupiaoButton.backgroundColor = [UIColor lightGrayColor];
//
//    }

}
- (void)setSelected:(BOOL)selected animated:(BOOL)animated {
    [super setSelected:selected animated:animated];

    // Configure the view for the selected state
}

@end
