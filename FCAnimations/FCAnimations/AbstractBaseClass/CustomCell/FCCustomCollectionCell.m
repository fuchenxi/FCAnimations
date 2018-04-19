//
//  FCCustomCollectionCell.m
//  FCAnimations
//
//  Created by fcx on 2017/12/29.
//  Copyright © 2017年 https://github.com/fuchenxi. All rights reserved.
//

#import "FCCustomCollectionCell.h"

@implementation FCCustomCollectionCell

- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        
        [self setupCell];
        
        [self buildSubview];
    }
    
    return self;
}

- (void)setupCell {
    
}

- (void)buildSubview {
    
}

- (void)loadContent {
    
}

- (void)contentOffset:(CGPoint)offset {
    
}

- (void)selectedEvent {
    
}

+ (FCCellDataAdapter *)dataAdapterWithCellReuseIdentifier:(NSString *)reuseIdentifier data:(id)data type:(NSInteger)type {
    
    NSString *tmpReuseIdentifier = reuseIdentifier.length <= 0 ? NSStringFromClass([self class]) : reuseIdentifier;
    return [FCCellDataAdapter collectionCellDataAdapterWithCellReuseIdentifier:tmpReuseIdentifier data:data cellType:type];
}

+ (FCCellDataAdapter *)dataAdapterWithData:(id)data type:(NSInteger)type {
    
    return [FCCellDataAdapter collectionCellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class]) data:data cellType:type];
}

+ (FCCellDataAdapter *)dataAdapterWithData:(id)data {
    
    return [FCCellDataAdapter collectionCellDataAdapterWithCellReuseIdentifier:NSStringFromClass([self class]) data:data cellType:0];
}

+ (void)registerToCollectionView:(UICollectionView *)collectionView reuseIdentifier:(NSString *)reuseIdentifier {
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:reuseIdentifier.length ? reuseIdentifier : NSStringFromClass([self class])];
}

+ (void)registerToCollectionView:(UICollectionView *)collectionView {
    
    [collectionView registerClass:[self class] forCellWithReuseIdentifier:NSStringFromClass([self class])];
}

@end
