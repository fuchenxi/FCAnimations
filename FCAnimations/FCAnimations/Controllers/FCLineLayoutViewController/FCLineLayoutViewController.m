//
//  FCLineLayoutViewController.m
//  FCAnimations
//
//  Created by fcx on 2017/12/27.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCLineLayoutViewController.h"
#import "FCCellDataAdapter.h"
#import "FCLineLayout.h"
#import "FCComplexLineLayout.h"

@interface FCLineLayoutViewController () <UICollectionViewDelegate, UICollectionViewDataSource>

@property (nonatomic, strong) NSMutableArray <FCCellDataAdapter *> *adapters;
@property (nonatomic, strong) UICollectionView                   *collectionView;
@property (nonatomic, strong) UICollectionViewLayout             *layout;

@end

@implementation FCLineLayoutViewController

- (void)viewDidLoad {
    
    [super viewDidLoad];
    
    static NSInteger layoutType = 0;
    layoutType                 += 1;
    
    self.collectionView = ({
        
        UICollectionView *collectionView = [[UICollectionView alloc] initWithFrame:CGRectZero
                                                              collectionViewLayout:layoutType % 2 == 1 ? [FCLineLayout new] : [FCComplexLineLayout new]];
        collectionView.backgroundColor = UIColor.backgroundColor;
        
        [collectionView registerClass:[UICollectionViewCell class] forCellWithReuseIdentifier:@"UICollectionViewCell"];
        collectionView.delegate = self;
        collectionView.dataSource = self;
        collectionView.contentInset = UIEdgeInsetsMake(15, 50, 15, 50);
        [self.contentView addSubview:collectionView];
        [collectionView mas_makeConstraints:^(MASConstraintMaker *make) {
           
            make.left.mas_equalTo(15);
            make.right.mas_equalTo(-15);
            make.centerY.equalTo(self.contentView);
            make.height.mas_equalTo(200);
        }];
        collectionView;
    });
}

- (NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView {
    
    return 10;
}

- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section {
    
    return 3;
}

- (UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath {
 
    UICollectionViewCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"UICollectionViewCell" forIndexPath:indexPath];
    cell.backgroundColor = UIColor.randomColor;
    return cell;
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath {
    
    [collectionView scrollToItemAtIndexPath:indexPath atScrollPosition:UICollectionViewScrollPositionCenteredHorizontally animated:YES];
}


@end
